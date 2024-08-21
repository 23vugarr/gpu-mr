#include <cuda_func.h>

int getCudaCoresPerSM(int major, int minor) {
    switch (major) {
        case 2: 
            return 32;
        case 3: 
            return 192;
        case 5: 
            return 128;
        case 6: 
            return 64;
        case 7: 
            return 64;
        case 8:
            return 64;
        default:
            std::cerr << "Unknown CUDA architecture." << std::endl;
            return 0;
    }
}

void deviceInfo(){
    int deviceCount = 0;
    cudaGetDeviceCount(&deviceCount);

    if (deviceCount == 0) {
        std::cerr << "No CUDA devices found." << std::endl;
        return ;
    }

    for (int i = 0; i < deviceCount; ++i) {
        cudaDeviceProp deviceProp;
        cudaGetDeviceProperties(&deviceProp, i);

        int smCount = deviceProp.multiProcessorCount;
        int major = deviceProp.major;
        int minor = deviceProp.minor;
        int coresPerSM = getCudaCoresPerSM(major, minor);
        int totalCores = smCount * coresPerSM;

        std::cout << "Device " << i << ": " << deviceProp.name << std::endl;
        std::cout << "  CUDA Compute Capability: " << major << "." << minor << std::endl;
        std::cout << "  Number of SMs: " << smCount << std::endl;
        std::cout << "  CUDA Cores per SM: " << coresPerSM << std::endl;
        std::cout << "  Total CUDA Cores: " << totalCores << std::endl;
    }

}