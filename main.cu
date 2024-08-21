#include <iostream>
#include <engine/engine.h>
#include <engine/cuda_func.h>
#include <arrow/api.h>
#include <arrow/csv/api.h>
#include <arrow/io/file.h>
#include <arrow/result.h>
#include <iostream>


#define N 3

int main() {
    float *a, *b, *out; 
    float *d_a, *d_b, *d_out;

    a   = (float*)malloc(sizeof(float) * N);
    b   = (float*)malloc(sizeof(float) * N);
    out = (float*)malloc(sizeof(float) * N);

    for(int i = 0; i < N; i++){
        a[i] = 1.0f; 
        b[i] = 2.0f;
        printf("iter: a: %f, b: %f\n", a[i], b[i]);
    }

    cudaMalloc((void**)&d_a, sizeof(float) * N);
    cudaMalloc((void**)&d_b, sizeof(float) * N);
    cudaMalloc((void**)&d_out, sizeof(float) * N);

    cudaMemcpy(d_a, a, sizeof(float) * N, cudaMemcpyHostToDevice);
    cudaMemcpy(d_b, b, sizeof(float) * N, cudaMemcpyHostToDevice);

    matAddition<<<1, 1>>>(d_out, d_a, d_b, N);

    cudaMemcpy(out, d_out, sizeof(float) * N, cudaMemcpyDeviceToHost);

    for (int i = 0; i < N; i++){
        printf("%f ", out[i]);
    }
    printf("\n");

    cudaFree(d_a);
    cudaFree(d_b);
    cudaFree(d_out);

    free(a);
    free(b);
    free(out);

    cudaDeviceSynchronize();

    void *ptr;
    int i = 5;
    std::cout << "i: " << i << std::endl;
    std::cout << "&i: " << &i << std::endl;
    std::cout << "ptr: " << ptr << std::endl;
    std::cout << "&ptr: " << &ptr << std::endl;

    ptr = &i;
    std::cout << "ptr: " << ptr << std::endl;
    std::cout << "&ptr: " << &ptr << std::endl;

    return 0;
}
