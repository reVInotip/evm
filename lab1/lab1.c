#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

enum {
    REDAING_ERROR = -1,
    WRITING_ERROR = -2,
    SQUARE_SIDE = 20,
    CIRCLE_CENTER = 10,
    CIRCLE_RADIUS = 10,
    WRITING_SUCCESS = 0
};

double MonteKarlo(const int countPoints) {
    srand(time(NULL));

    int countPointsInCircle = 0;
    for(int i = 0; i < countPoints; ++i) {
        int x = rand()%SQUARE_SIDE;
        int y = rand()%SQUARE_SIDE;

        if ((x - CIRCLE_CENTER)*(x - CIRCLE_CENTER) + y*y <= CIRCLE_RADIUS*CIRCLE_RADIUS) {
            ++countPointsInCircle;
        }
    }
    return 4.0*countPointsInCircle/countPoints;
}

int FileRead(const char* fileName) {
    assert(fileName);

    int answer = 0;   
    FILE* inputStream = fopen(fileName, "r");
    unsigned int countReadingSymbols =  fscanf(inputStream, "%d", &answer);

    return (!countReadingSymbols) ? answer : REDAING_ERROR; 
}

int FileWrite(const double data, const char* fileName) {
    assert(data);
    assert(fileName);

    FILE* outputStream = fopen(fileName, "w");
    unsigned int countWritingSymbols = fprintf(outputStream, "%lf", data);

    return (!countWritingSymbols) ? WRITING_SUCCESS : WRITING_ERROR;
}

int main() {
    const char* inputFileName = "tests/1/in.txt";
    const char* outputFileName = "test/1/out.txt";
    int countPoints = FileRead(inputFileName);

    if (countPoints < 0) {
        return EXIT_FAILURE;
    }
    
    const double pi = MonteKarlo(countPoints);

    int isEror = FileWrite(pi, outputFileName);
    return EXIT_SUCCESS;
}