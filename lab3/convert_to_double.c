#include <stdint.h>
#include <stdio.h>

int main() {
    int32_t arr[2] = {0, 1072693248};

    printf("%lf", *(double*)arr);
    return 0;
}