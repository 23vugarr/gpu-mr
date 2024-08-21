#include <iostream>
#include <cuda_runtime.h>
#include "cuda_runtime_api.h"


__global__ void cuda_hello();
__global__ void matAddition(float *out, float *a, float *b, int n);