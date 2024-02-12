#include <iostream>
#include "HyperProfiler.h"

using namespace std;

void processToProfile() {
    cout << "Hello World" << endl;
}

int main() 
{
    //Starter profiling code
    HyperProfiler p = HyperProfiler();
    p.startProfiling();

    //Run the process we seek to profile
    processToProfile();

    //Ending profiling code
    p.stopProfiling();
    
    cout << p.getSingleStat("L1-misses") << " " << p.getSingleStat("cycles") << endl; // use n as scale factor
    cout << endl;
    return 0;
}