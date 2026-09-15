/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file    tim.h
  * @brief   This file contains all the function prototypes for
  *          the tim.c file
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2025 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __TIM_H__
#define __TIM_H__

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

extern TIM_HandleTypeDef htim7;

/* USER CODE BEGIN Private defines */
extern volatile uint16_t time_flag;
extern volatile uint32_t mcu_time_ms;

typedef enum{
  T_1MS = 1,
  T_10MS = 2,
  T_100MS = 4,
  T_1S = 8,
}Time_Flag_t;

// 设置时间标志位
#define SET_TIME_FLAG(_tf)   (time_flag |= ((uint16_t)_tf))

// 重置时间标志位
#define RESET_TIME_FLAG(_tf) (time_flag &= ((uint16_t)~((uint16_t)_tf)))

// 获取时间标志位
#define GET_TIME_FLAG(_tf)   (time_flag & ((uint16_t)_tf))
/* USER CODE END Private defines */

void MX_TIM7_Init(void);

/* USER CODE BEGIN Prototypes */

/* USER CODE END Prototypes */

#ifdef __cplusplus
}
#endif

#endif /* __TIM_H__ */

