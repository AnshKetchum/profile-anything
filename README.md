## Profile Anything
Profile any linux distribution on C++ at the harware level, period. Zero complexity. Identify critical hotspots within your C++ code.

## Side Notes
This project is an attempt to extend the marvelous work done by Viktor Leis in his [perfevent](https://github.com/viktorleis/perfevent/tree/master) repository into a seamless, scalable API. Currently, it is known to work with C++ and Python.

## Features
- Support for Docker builds and reproducible testing in isolated environments
- Obtain *hardware-level* metrics like the L1 Cache Miss Rate, Instructions, Cycles, CPU usage, and many more.
- Bringing profiling capabilities to higher level languages like Python.

## Installation
You can use the `Makefile` provided for a 2-3 command installation. 
Steps are the following:

Local Setup
1. Run the installations necessary for `perf` to run. `make install`
2. Build the C++ API. `make build`
3. Execute any profiled code (develop this in the `src` folder) with `make run`

Docker Setup
1. Build the docker image (make sure you have docker installed!) using `make docker/build`
2. Run the image with `make docker/run`

Python API Setup
1. Run the installations necessary for `perf` to run. `make install`
2. Build the C++ API. `make python/build`
3. Install the package to pip for global use `pip install .`

## Quickstart 
Copy over the `PerfEvent.hpp` headers from the `include` directory. The `src/hyperprofiler.cpp/h` files contain a simple API that can be used to interact with Perf in your C++ and Python

**C++ Interface**
```cpp
#include <iostream>
#include "hyperprofiler.h"

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

**Python Interface**

Make sure to follow the steps for the python 
installation before running any code.

```python
import hyperprofiler

hp = hyperprofiler.HyperProfiler()

# Start the profiler
hp.startProfiling()

# Insert whatever method you'd like
yourMethodToProfile()

# Complete Profiling
hp.stopProfiling()

print(hp.getSingleStat("L1-misses"))
```

## Todo
1. Create a list of supported metrics from the perf interface
2. Add some support for instant, isolated segmented tests using Docker.

This repo is being actively maintained as of Feb 2024. Facing bugs, Have some more suggestions about what should be done next? Open up an ISSUE!
