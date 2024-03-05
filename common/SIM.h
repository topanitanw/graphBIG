#ifndef _SIM_H
#define _SIM_H
#include <stdint.h>
#include <iostream>

// #include <stdio.h>
// #define NO_INLINE __attribute__((noinline))
// #define PREFIX "[sim ticker] "
// extern "C" void NO_INLINE sim_roi_start();
// extern "C" void NO_INLINE sim_roi_end();

extern "C" unsigned __attribute__ ((noinline)) SIM_BEGIN(bool i);
extern "C" unsigned __attribute__ ((noinline)) SIM_END(bool i);

extern "C" void __attribute__ ((noinline)) SIM_LOCK(bool * i);
extern "C" void __attribute__ ((noinline)) SIM_UNLOCK(bool * i);

#endif
