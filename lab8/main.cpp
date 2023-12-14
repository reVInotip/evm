#include <iostream>
#include <x86intrin.h>
#include <float.h>

using namespace std;

#define K 10

int Run(int *arr, int size, int countRun) {
    int k, i;

    for (k = 0, i = 0; i < size * countRun; i++) {
        k = arr[k];
    }
    return k;
}

int *CreateStraight(int size) {
    int *arr = new int[size];
    arr[size - 1] = 0;
    for (int i = 1; i < size; i++) {
        arr[i - 1] = i;
    }
    return arr;
}

int *CreateReverse(int size) {
    int *arr = new int[size];
    arr[0] = size - 1;
    for (int i = 1; i < size; i++) {
        arr[i] = i - 1;
    }
    return arr;
}

int *CreateRandom(int size) {
    int *arr = new int[size];
    auto *indexes = new unsigned int[size];
    for (unsigned int i = 0; i < size; ++i) {
        indexes[i] = i;
    }
    srand(time(NULL));
    for (long long i = size - 1; i > 0; --i) {
        unsigned int j = 0;
        j = rand() % i;
        swap(indexes[i], indexes[j]);
    }

    for (unsigned int i = 0; i < size - 1; ++i) {
        arr[indexes[i]] = indexes[i + 1];
    }
    arr[indexes[size - 1]] = indexes[0];

    delete[] indexes;

    return arr;
}

int main() {
    int size[16] = {
        1 * 1024 / 4,   // 1 KB
        2 * 1024 / 4,   // 2 KB
        4 * 1024 / 4,   // 4 KB
        8 * 1024 / 4,   // 8 KB
        16 * 1024 / 4,  // 16 KB
        32 * 1024 / 4,  // 32 KB
        64 * 1024 / 4,  // 64 KB
        128 * 1024 / 4,  // 128 KB
        256 * 1024 / 4,  // 256 KB
        512 * 1024 / 4, // 512 KB
        1 * 1024 * 1024 / 4, // 1 MB
        2 * 1024 * 1024 / 4, // 2 MB
        4 * 1024 * 1024 / 4, // 4 MB
        8 * 1024 * 1024 / 4, // 8 MB
        16 * 1024 * 1024 / 4, // 16 MB
        32 * 1024 * 1024 / 4  // 32 MB
    };

    int *arr1;
    int *arr2;
    int *arr3;
    double minTime = DBL_MAX;
    int k = 0;

    for (int i = 0; i < 16; i++) {
        std::cout << "===============" << std::endl;
        std::cout << i + 1 << " Memory size in KB: " << size[i] * 4 / 1024 << std::endl;
        arr1 = CreateStraight(size[i]);

        k += Run(arr1, size[i], 1);
        for (int k = 0; k < K; k++) {
            double start = __rdtsc();
            k += Run(arr1, size[i], K);
            double end = __rdtsc();

            minTime = minTime > ((double)(end - start)) ? ((double)(end - start)) : minTime;
        }
        
        minTime /= K;
        minTime /= size[i];
        std::cout << " Time for straight: " << minTime << std::endl;
        minTime = DBL_MAX;

        arr2 = CreateReverse(size[i]);

        k += Run(arr2, size[i], 1);
        for (int k = 0; k < K; k++) {
            double start = __rdtsc();
            k += Run(arr2, size[i], K);
            double end = __rdtsc();

            minTime = minTime > ((double)(end - start)) ? ((double)(end - start)) : minTime;
        }

        minTime /= K;
        minTime /= size[i];
        std::cout << " Time for reverse: " << minTime << std::endl;
        minTime = DBL_MAX;

        arr3 = CreateRandom(size[i]);

        k += Run(arr3, size[i], 1);
        for (int k = 0; k < K; k++) {
            double start = __rdtsc();
            k += Run(arr3, size[i], K);
            double end = __rdtsc();

            minTime = minTime > ((double)(end - start)) ? ((double)(end - start)) : minTime;
        }

        minTime /= K;
        minTime /= size[i];
        std::cout << " Time for random: " << minTime << std::endl
                  << "===============" << std::endl;
        minTime = DBL_MAX;
    }

    std::cout << k;

    return 0;
}
