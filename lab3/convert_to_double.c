#include <stdint.h>
#include <stdio.h>

int main() {
    int32_t arr[2] = {-4194304, 1104150527};

    printf("%lf", *(double*)arr);
    return 0;
}