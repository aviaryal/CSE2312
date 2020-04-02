#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
extern bool isStrEqual(const char *str1, const char *str2);
extern void strCopy(char *str1, const char *str2);
extern int32_t sumS16(const int16_t x[], int32_t count);
extern uint32_t sumU16(const uint16_t x[], uint32_t count);
extern uint32_t countZeros(const int32_t x[], uint32_t count);
extern void rightStringFull(char strOut[], const char strIn[], uint32_t length); 
extern void rightStringTrunc(char strOut[], const char strIn[], uint32_t length);
extern uint32_t countMatches(const char strIn[], const char strMatch[]);
//disassemble

int main()
{
	/*
	char str1[]={"hello"};
	char str2[]={"Hello"};
	bool value=isStrEqual(str1,str2);
	printf("%s and %s comparasion is: %d ", str1,str2, value);
 	*/
 	/*
 	char str1[10];
 	char str2[]={"world"};
 	strCopy(str1,str2);
 	printf("String 1 value is %s\n", str1);
  */
  /*
  int16_t x[]={1,2,3,4,-5,6,7,8,9};
  int32_t count=9;
  int32_t sum= sumS16(x,count);
  printf("The sum is %d\n", sum);
  */
  /*
  uint16_t x[]={1,2,3,4,5,6,7,8,9};
  uint32_t count=9;
  uint32_t sum= sumS16(x,count);
  printf("The sum is %d\n", sum);
  */
  /*
  int32_t x[]={12,-1,3,-0,0,1,2,3,0};
  uint32_t count=9;
  uint32_t countzero=countZeros(x,count);
  printf("No of zeros: %d\n", countzero);
  */
  /*
  char str2[]={"abcdef"};
  char str1[10];
  uint32_t length=0;
 	rightStringFull(str1,str2,length);
 	printf("%s\n",str1);	 
  */
  /*
  char str2[]={"abcdef"};
  char str1[10];
  uint32_t length=0;
 	rightStringTrunc(str1,str2,length);
 	printf("%s\n",str1);	
 	*/
}
