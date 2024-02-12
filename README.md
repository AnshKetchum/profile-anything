## Profile Anything
Profile any linux distribution on C++ at the harware level, period. Zero complexity. Identify critical hotspots within your C++ code.

## Side Notes
This project is an attempt to extend the marvelous work done by Viktor Leis in his [perfevent](https://github.com/viktorleis/perfevent/tree/master) repository into a seamless, scalable API. Currently, it is known to work 
with C++, and work is being done to add Python bindings in order for it to become accessible via pip.

## Features
- Obtain *hardware-level* metrics like the L1 Cache Miss Rate, Instructions, Cycles, CPU usage, and many more.

## Quickstart 
Copy over the `PerfEvent.hpp` headers from the `include` directory. The `src/HyperProfiler.cpp/h` files contain a simple API that can be used to interact with Perf in your C++ (and eventually Python) code.

```cpp
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
```
