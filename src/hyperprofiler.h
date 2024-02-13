#include "PerfEvent.hpp"

class HyperProfiler {
    private:
        PerfEvent e;

    public: 
        HyperProfiler() {
            
        }

        void startProfiling();
        void stopProfiling();
        void getGeneralStats();

        double getSingleStat(std::string s);
};