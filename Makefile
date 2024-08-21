IDIR=.
EDIR=engine
COMPILER=nvcc
COMPILER_FLAGS=-I$(IDIR) -I$(EDIR) -I/usr/local/cuda/include --std=c++17
LINKER_FLAGS=-lcuda

b:
	cd build && cmake ..; make

clean:
	rm -rf ./build/*

run:
	./build/simple

all: clean b run

# build_t: 
# 	$(COMPILER) $(COMPILER_FLAGS) main.cu ./engine/engine.cu ./engine/cuda_func.cpp  -o simple.exe $(LINKER_FLAGS)
