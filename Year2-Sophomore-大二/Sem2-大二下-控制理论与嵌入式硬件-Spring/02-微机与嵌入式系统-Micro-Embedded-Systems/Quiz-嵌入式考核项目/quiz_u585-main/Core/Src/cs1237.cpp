/*
 * cs1237.cpp
 *
 *  Created on: Sep 30, 2025
 *      Author: czgj9
 */

#include "cs1237.h"

#include "stm32u5xx_hal.h"

// Delay t microseconds(us)
static void delay_us(uint32_t t) {
  uint32_t ticks;
  uint32_t told, tnow, tcnt = 0;
  uint32_t reload = SysTick->LOAD;
  ticks = t * (SysTick->LOAD + 1)/1000;
  told = SysTick->VAL;
  while (1) {
    tnow = SysTick->VAL;
    if (tnow != told) {
      if (tnow < told)
        tcnt += told - tnow;
      else
        tcnt += reload - tnow + told;
      told = tnow;
      if (tcnt >= ticks) break;
    }
  }
}

// 缓存配置信息以及配置挂起标志
static Config g_cached_config;
static bool g_config_pending = false;
static bool g_is_power_down = false; // 软件维护的 PowerDown 状态标志

// 实现以下四个函数
Config Config40Hz() {
  Config cfg;
  cfg.ch_sel = 0;       // 通道选择：通道 A (默认 00)
  cfg.pga_sel = 3;      // PGA选择：128 (默认 11)
  cfg.speed_sel = 1;    // ADC输出速率选择：40Hz (01)
  cfg.refo_off = 0;     // REF输出开关：正常输出 (默认 0)
  cfg.reserved = 0;     // 保留位：0
  return cfg;
}


void PowerDown() {
  HAL_GPIO_WritePin(SG_OUT_A_GPIO_Port, SG_OUT_A_Pin, GPIO_PIN_SET);
  g_is_power_down = true;
  delay_us(120); // 确保高电平保持时间超过 100µs，使芯片进入 PowerDown 模式
}


// 辅助函数：切换 SG_IO_A_Pin (DOUT/DRDY) 为输出模式
static void set_io_mode_output() {
  GPIO_InitTypeDef GPIO_InitStruct = {0};
  GPIO_InitStruct.Pin = SG_IO_A_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
  HAL_GPIO_Init(SG_IO_A_GPIO_Port, &GPIO_InitStruct);
}

// 辅助函数：切换 SG_IO_A_Pin (DOUT/DRDY) 为输入模式
static void set_io_mode_input() {
  GPIO_InitTypeDef GPIO_InitStruct = {0};
  GPIO_InitStruct.Pin = SG_IO_A_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_PULLDOWN;
  HAL_GPIO_Init(SG_IO_A_GPIO_Port, &GPIO_InitStruct);
}

bool Read(int32_t* value) {
  // 1. 如果当前处于 PowerDown 模式，将其拉低以唤醒芯片并立即返回 false
  if (g_is_power_down) {
    HAL_GPIO_WritePin(SG_OUT_A_GPIO_Port, SG_OUT_A_Pin, GPIO_PIN_RESET);
    g_is_power_down = false;
    return false;
  }


  // 2. 检查数据是否准备好。如果 DOUT/DRDY (SG_IO_A_Pin) 为高，则数据未准备好，立即返回 false
  if (HAL_GPIO_ReadPin(SG_IO_A_GPIO_Port, SG_IO_A_Pin) == GPIO_PIN_SET) {
    return false;
  }

  // 3. 读出 24 位 ADC 数据
  int32_t raw_data = 0;
  for (int i = 0; i < 24; i++) {
    HAL_GPIO_WritePin(SG_OUT_A_GPIO_Port, SG_OUT_A_Pin, GPIO_PIN_SET);
    delay_us(1);
    HAL_GPIO_WritePin(SG_OUT_A_GPIO_Port, SG_OUT_A_Pin, GPIO_PIN_RESET);
    delay_us(1);
    raw_data = (raw_data << 1) | HAL_GPIO_ReadPin(SG_IO_A_GPIO_Port, SG_IO_A_Pin);
  }

  // 4. 进行 24 位有符号数的符号扩展到 32 位
  if (raw_data & 0x800000) {
    raw_data |= 0xFF000000;
  }

  if (value != nullptr) {
    *value = raw_data;
  }

  // 5. 若成功读取，且有配置挂起，则写入新配置
  if (g_config_pending) {
    // 第 25、26 个 SCLK
    for (int i = 0; i < 2; i++) {
      HAL_GPIO_WritePin(SG_OUT_A_GPIO_Port, SG_OUT_A_Pin, GPIO_PIN_SET);
      delay_us(1);
      HAL_GPIO_WritePin(SG_OUT_A_GPIO_Port, SG_OUT_A_Pin, GPIO_PIN_RESET);
      delay_us(1);
    }

    // 第 27 个 SCLK (拉高 DOUT/DRDY)
    HAL_GPIO_WritePin(SG_OUT_A_GPIO_Port, SG_OUT_A_Pin, GPIO_PIN_SET);
    delay_us(1);
    HAL_GPIO_WritePin(SG_OUT_A_GPIO_Port, SG_OUT_A_Pin, GPIO_PIN_RESET);
    delay_us(1);

    // 切换 MCU GPIO 为输出，准备写命令和配置
    set_io_mode_output();

    // 第 28、29 个 SCLK (切换 CS1237 DOUT/DRDY 为输入)
    for (int i = 0; i < 2; i++) {
      HAL_GPIO_WritePin(SG_OUT_A_GPIO_Port, SG_OUT_A_Pin, GPIO_PIN_SET);
      delay_us(1);
      HAL_GPIO_WritePin(SG_OUT_A_GPIO_Port, SG_OUT_A_Pin, GPIO_PIN_RESET);
      delay_us(1);
    }

    // 第 30 至 36 个 SCLK：写入 7 位命令 0x65 (MSB 先写，0x65 = 二进制 1100101)
    uint8_t cmd = 0x65;
    for (int i = 6; i >= 0; i--) {
      uint8_t bit = (cmd >> i) & 0x01;
      HAL_GPIO_WritePin(SG_IO_A_GPIO_Port, SG_IO_A_Pin, bit ? GPIO_PIN_SET : GPIO_PIN_RESET);
      delay_us(1);
      HAL_GPIO_WritePin(SG_OUT_A_GPIO_Port, SG_OUT_A_Pin, GPIO_PIN_SET);
      delay_us(1);
      HAL_GPIO_WritePin(SG_OUT_A_GPIO_Port, SG_OUT_A_Pin, GPIO_PIN_RESET);
      delay_us(1);
    }

    // 第 37 个 SCLK
    HAL_GPIO_WritePin(SG_OUT_A_GPIO_Port, SG_OUT_A_Pin, GPIO_PIN_SET);
    delay_us(1);
    HAL_GPIO_WritePin(SG_OUT_A_GPIO_Port, SG_OUT_A_Pin, GPIO_PIN_RESET);
    delay_us(1);

    // 第 38 至 45 个 SCLK：写入 8 位配置寄存器数据
    uint8_t cfg_val = *(uint8_t*)&g_cached_config;
    for (int i = 7; i >= 0; i--) {
      uint8_t bit = (cfg_val >> i) & 0x01;
      HAL_GPIO_WritePin(SG_IO_A_GPIO_Port, SG_IO_A_Pin, bit ? GPIO_PIN_SET : GPIO_PIN_RESET);
      delay_us(1);
      HAL_GPIO_WritePin(SG_OUT_A_GPIO_Port, SG_OUT_A_Pin, GPIO_PIN_SET);
      delay_us(1);
      HAL_GPIO_WritePin(SG_OUT_A_GPIO_Port, SG_OUT_A_Pin, GPIO_PIN_RESET);
      delay_us(1);
    }

    // 恢复 MCU GPIO 为输入模式
    set_io_mode_input();

    // 第 46 个 SCLK (切换 CS1237 DOUT/DRDY 为输出且拉高)
    HAL_GPIO_WritePin(SG_OUT_A_GPIO_Port, SG_OUT_A_Pin, GPIO_PIN_SET);
    delay_us(1);
    HAL_GPIO_WritePin(SG_OUT_A_GPIO_Port, SG_OUT_A_Pin, GPIO_PIN_RESET);
    delay_us(1);

    g_config_pending = false;
  } else {
    // 6. 若无挂起配置，只需发送第 25、26、27 个 SCLK 结束数据读取过程
    for (int i = 0; i < 3; i++) {
      HAL_GPIO_WritePin(SG_OUT_A_GPIO_Port, SG_OUT_A_Pin, GPIO_PIN_SET);
      delay_us(1);
      HAL_GPIO_WritePin(SG_OUT_A_GPIO_Port, SG_OUT_A_Pin, GPIO_PIN_RESET);
      delay_us(1);
    }
  }

  return true;
}


void SetConfig(Config cfg) {
  g_cached_config = cfg;
  g_config_pending = true;
}

