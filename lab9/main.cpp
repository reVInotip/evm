#include <iostream>
#include <limits.h>
#include <x86intrin.h>
#include <fstream>

using namespace std;
using ull = unsigned long long;
using uint = unsigned int;

uint* CreateArray(const uint size, const uint offset, const uint numberOfFragments) {
    uint* arr = new uint[size];
    const uint cacheSize = offset;
    const uint blockSize = cacheSize / numberOfFragments;

    for (int i = 0; i < blockSize; ++i) {
        int k = i;
        for (int j = 1; j < numberOfFragments; ++j) {
            arr[k] = k + offset;
            k += offset;
            if (k > cacheSize * 32) {
                throw std::exception();
            }
        }
        arr[k] = (i + 1) % blockSize;
    }
    return arr;
}

double GetTraversTime(uint* arr, uint& countElements) {
    ull mintime = ULLONG_MAX;
    for (uint k = 0; k < 1000; ++k) {
        uint next = 0;
        ull start = __rdtsc();

        do {
            ++countElements;
            next = arr[next];
        } while (next != 0);
        next = arr[next];
        ++countElements;

        ull end = __rdtsc();
        if (next == -1) {
            cout << "-1";
        }
        ull currTime = end - start;
        mintime = mintime > currTime ? currTime : mintime;
    }
    countElements /= 1000;
    return mintime;
}

int main() {
    const uint offset = 12 * 1024 * 1024 / sizeof(uint); // 12 MB
    const uint Size = offset * 32;
    
    cout << "Size (KB) " << Size / 1024 * sizeof(uint) << endl;

    ofstream out("графики.csv");
    for (uint i = 1; i <= 32; ++i) {
        uint* arr = CreateArray(Size, offset, i);
        cout << "==============================" << endl;
        cout << "Number of fragments " << i << endl;
        uint countElements = 0;
        ull time = GetTraversTime(arr, countElements);
        time /= countElements;
        cout << "Average time " << time << endl;
        cout << "==============================" << endl;

        if (out.is_open()) {
            out << i << ',' << time << '\n';
        }

        delete [] arr;
    }
    return 0;
}