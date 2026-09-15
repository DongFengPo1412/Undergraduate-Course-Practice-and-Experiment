/*
 * app.cpp
 *
 *  Created on: Sep 30, 2025
 *      Author: czgj9
 */

#include "app.h"
#include "tim.h"
#include "cs1237.h"

void ErrorInfo(const char* err) {
  // BREAKPOINT HERE TO SEE ERROR INFO
  while (1);
}

void Success() {
  // BREAKPOINT HERE TO CONFIRM CORRECTNESS
  while (1);
}

// All testcases return info when failed; otherwise return nullptr.
const char* TestCfg40Hz() {
  Config cfg = Config40Hz();
  uint8_t *p = (uint8_t*)(&cfg);
  if (*p != 0x1C) {
    return "Bad 40Hz config!";
  } else {
    return 0;
  }
}

const char* TestRead10Hz() {
  int time_s = 0;
  int success_reads = 0;
  int count_0 = 0;
  int count_minmax = 0;
  // reset timer
  while (!GET_TIME_FLAG(T_1S));
  RESET_TIME_FLAG(T_1S);

  while (time_s < 5) {
    if (GET_TIME_FLAG(T_1MS)) {
      RESET_TIME_FLAG(T_1MS);
      int32_t v;
      bool res = Read(&v);
      if (res) {
        success_reads++;
        if (v < -8388608 || v > 8388607) {
          return "Value out of bounds!";
        }
        if (v == 0) {
          if (++count_0 > 10) {
            return "Too many 0 values!";
          }
        }
        if (v == -8388608 || v == 8388607) {
          if (++count_minmax > 10) {
            return "Too many min/max values!";
          }
        }
      }
    }

    if (GET_TIME_FLAG(T_1S)) {
      RESET_TIME_FLAG(T_1S);
      time_s++;
    }
  }
  if (success_reads > 13 * time_s) {
    return "reads > 13Hz!";
  }
  if (success_reads < 7 * time_s) {
    return "reads < 7 Hz!";
  }
  return 0;
}

const char* TestRead40Hz() {
  int time_s = 0;
  int success_reads = 0;
  // reset timer
  while (!GET_TIME_FLAG(T_1S));
  RESET_TIME_FLAG(T_1S);

  uint32_t ms_before = mcu_time_ms;
  SetConfig(Config40Hz());
  uint32_t ms_after = mcu_time_ms;
  if (ms_after - ms_before > 3) {
    return "SetConfig must not block!";
  }

  while (time_s < 5) {
    if (GET_TIME_FLAG(T_1MS)) {
      RESET_TIME_FLAG(T_1MS);
      int32_t v;
      bool res = Read(&v);
      if (res) {
        success_reads++;
      }
    }

    if (GET_TIME_FLAG(T_1S)) {
      RESET_TIME_FLAG(T_1S);
      time_s++;
    }
  }
  if (success_reads > 45 * time_s) {
    return "reads > 45Hz!";
  }
  if (success_reads < 35 * time_s) {
    return "reads < 35Hz!";
  }
  return 0;
}

void AppLoop() {
  if (const char* err = TestCfg40Hz()) {
    ErrorInfo(err);
  }
  if (const char* err = TestRead10Hz()) {
    ErrorInfo(err);
  }
  if (const char* err = TestRead40Hz()) {
    ErrorInfo(err);
  }

  Success();
}


