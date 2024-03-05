#include "SIM.h"

// NO_INLINE void
// sim_roi_start() {
//     printf(PREFIX "roi start\n");
// }
//
// NO_INLINE void
// sim_roi_end() {
//     printf(PREFIX "roi end\n");
// }

unsigned __attribute__ ((noinline)) SIM_BEGIN(bool i)
{
	// sim_roi_start();
    if (i==false) return 0;
    std::cout<<"sim begin\n";
    return 1;
}
unsigned __attribute__ ((noinline)) SIM_END(bool i)
{
	// sim_roi_end();
    if (i==false) return 0;
    std::cout<<"sim end\n";
    return 1;
}

void __attribute__ ((noinline)) SIM_LOCK(bool * i)
{
    while(__sync_lock_test_and_set(i, 1));
}

void __attribute__ ((noinline)) SIM_UNLOCK(bool * i)
{
    __sync_lock_release(i);
}

