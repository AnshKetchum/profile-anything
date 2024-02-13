# Pre-installation commands 
install:
	sudo apt-get install -y linux-tools-common linux-tools-generic linux-tools-`uname -r`
	sudo sysctl -w kernel.perf_event_paranoid=-1

# Docker-related commands
docker/build:
	docker build -t profiler-image .

docker/run:
	sudo docker run --privileged profiler-image

# Python related commands
python/build: 
	swig -c++ -python src/hyperprofiler.i
	python setup.py build_ext --inplace
	mv src/*.py . 

# Building C++
.PHONY: build
build:
	mkdir -p build 	
	cmake -B build/ -S .
	make -C build/

run:
	./build/profile

clean: 
	rm -rf build
	rm -rf *.so
	rm -rf hyperprofiler.py
	rm -rf hyperprofiler.egg-info
	rm -rf __pycache__