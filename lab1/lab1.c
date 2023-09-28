#include <assert.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

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
    const int countPoints = INT_MAX / 4;
    
    const double pi = MonteKarlo(countPoints);
    printf("%lf\n", pi);

    return EXIT_SUCCESS;
}