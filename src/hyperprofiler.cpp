#include <iostream>
#include <string>

#include "hyperprofiler.h"
#include "PerfEvent.hpp"

void HyperProfiler::startProfiling() {
    e.startCounters();
}

void HyperProfiler::stopProfiling() { 
    e.stopCounters(); 
}

void HyperProfiler::getGeneralStats() {
    e.printReport(std::cout, 10); 
}

double HyperProfiler::getSingleStat(std::string s) {
    return e.getCounter(s);
}
