#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

extern void diffF32(float z[], const float x[], const float y[], uint32_t count);
extern double prodF32_64(const float x[], uint32_t count);
extern float dotpF32(const float x[], const float y[], uint32_t count);
extern double minF64(const double x[], uint32_t count);
//extern void check(uint32_t  x);
#define COUNT 3
int main()
{
	/*
	uint32_t s=3;
	float x[3]={1.5,2.0,-1.1};
	float y[3]={1.0,1.0,1.1};
	float z[3];
	diffF32(z,x,y,s);
	for(int i=0;i<s;i++)
		printf("%f \n", z[i]);
	*/
	
	
	uint32_t s=3;
	float x[3]={2,-1,3};
	double y=prodF32_64(x,s);
	printf("%f\n",y);
	
	/*
	uint32_t s=3;
	float x[3]={1,2,3};
	float y[3]={1,-2,3};
	float z=dotpF32(x,y,s);
	printf("%f\n",z);
	*/
	/*
	uint32_t s=5;
	double x[5]={2,5,8,-11,1};
	double y=minF64(x,s);
	printf("%lf\n",y);
	*/
	/*
	double a[COUNT] = {1.01, 2.02, 3.03};
  double mean;
  mean = meanF64(a, COUNT);
  printf("mean = %lf\n", mean);
 	*/
 	//uint32_t  x=0;
 	//check(x);
}


