#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

extern void diffF32(float z[], const float x[], const float y[], uint32_t count);
//double prodF32_64(const float x[], uint32_t count);
//float dotpF32(const float x[], const float y[], uint32_t count);
//double minF64(const double x[], uint32_t count);
int main()
{
	uint32_t s=3;
	float x[3]={1.5,2.0,-1.1};
	float y[3]={1.0,1.0,1.1};
	float z[3];
	diffF32(z,x,y,s);
	for(int i=0;i<s;i++)
		printf("%f \n", z[i]);




}


