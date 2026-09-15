/*
 * cs1237.h
 *
 *  Created on: Sep 30, 2025
 *      Author: czgj9
 */

#ifndef INC_CS1237_H_
#define INC_CS1237_H_

#include "gpio.h"

#ifdef __cplusplus
extern "C" {
#endif

struct Config {
  uint8_t ch_sel : 2;
  uint8_t pga_sel : 2;
  uint8_t speed_sel : 2;
  uint8_t refo_off : 1;
  uint8_t reserved : 1;
};


// 在cs1237.cpp实现以下4个函数
Config Config40Hz();
void PowerDown();
bool Read(int32_t* value);
void SetConfig(Config cfg);

#ifdef __cplusplus
}
#endif

#endif /* INC_CS1237_H_ */
