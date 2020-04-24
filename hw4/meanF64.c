#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>

extern double meanF64(double x[], uint32_t count);

#define COUNT 3

int main()
{
    double a[COUNT] = {1.01, 2.0, 3.03};
    double mean;
    mean = meanF64(a, COUNT);
    printf("mean = %lf\n", mean);
    return EXIT_SUCCESS;
}

