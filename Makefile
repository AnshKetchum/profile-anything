# Docker-related commands
docker/build:
	docker build -t profiler-image .

docker/run:
	sudo docker run --privileged profiler-image

# Python related commands
python/build: 
	swig -python -c++ -o src/HyperProfiler.cc hyperprofiler.i
	python setup.py build_ext --inplace

# Building C++
.PHONY: build
build:
	cmake -B build/ -S .
	make -C build/

run:
	./build/profile

clean: 
	rm -rf build/*