FROM ubuntu:20.04

# Prep apt-get
RUN apt-get update \
  && apt-get install -y wget 

# Install perf 
RUN apt-get install -y linux-tools-common linux-tools-generic linux-tools-`uname -r`

# Install CMake
RUN apt-get -y install protobuf-compiler
RUN apt-get -y install build-essential make
RUN wget -qO- "https://cmake.org/files/v3.17/cmake-3.17.0-Linux-x86_64.tar.gz" | tar --strip-components=1 -xz -C /usr/local

# Build everything
COPY . .
RUN rm -rf build/
RUN cmake -B build/ -S .

# Compile using the makefile
RUN make -C build

#Prep systemctl for the program
RUN sysctl -w kernel.perf_event_paranoid=-1

# Run
CMD ["./build/profile"]