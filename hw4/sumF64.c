#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>

extern double sumF64(double x[], uint32_t count);

#define COUNT 3

int main()
{
    double a[COUNT] = {1.01, 2.02, 3.03};
    double sum;
    sum = sumF64(a, COUNT);
    printf("sum = %lf\n", sum);
    return EXIT_SUCCESS;
}

