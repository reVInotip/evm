#include <bits/time.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/times.h>
#include <unistd.h>

enum {
    REDAING_ERROR = -1,
    WRITING_ERROR = 1,
    CIRCLE_RADIUS = 1,
    WRITING_SUCCESS = 0
};

double MonteKarlo(const int countPoints) {
    srand(time(NULL));

    int countPointsInCircle = 0;
    for(int i = 0; i < countPoints; ++i) {
        double x = rand() / (RAND_MAX/2.0) - 1.0;
        double y = rand() / (RAND_MAX/2.0) - 1.0;

        if (x*x + y*y <= CIRCLE_RADIUS) {
            ++countPointsInCircle;
        }
    }
    return 4.0*countPointsInCircle/countPoints;
}

int main() {
    /*struct tms start, end;
    const long clocks_per_sec = sysconf(_SC_CLK_TCK);
    long clocks;
    times(&start);*/
    struct timespec start, end;
    clock_gettime(CLOCK_MONOTONIC_RAW, &start);
    const int countPoints = INT_MAX / 4;
    
    const double pi = MonteKarlo(countPoints);
    printf("%lf\n", pi);
    clock_gettime(CLOCK_MONOTONIC_RAW, &end);
    printf("Time taken %lf sec.", end.tv_sec - start.tv_sec + 0.000000001*(end.tv_nsec-start.tv_nsec));
    /*times(&end);
    clocks = end.tms_utime - start.tms_utime;
    printf("Time taken: %lf sec.\n",
        (double)clocks / clocks_per_sec);*/
    return EXIT_SUCCESS;
}