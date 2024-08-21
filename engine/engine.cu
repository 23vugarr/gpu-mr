#include <engine.h>

__global__ void cuda_hello(){
    printf("Hello World from GPU!\n");
}

__global__ void matAddition(float *out, float *a, float *b, int n) {
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    if (index < n) {
        out[index] = a[index] + b[index];
    }
}