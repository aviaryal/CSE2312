#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
extern bool isStrEqual(const char *str1, const char *str2);
//disassemble

int main()
{
	char str1[]={"hello"};
	char str2[]={"hello"};
	bool value=isStrEqual(str1,str2);
	printf("%s and %s comparasion is: %d ", str1,str2, value);
 
  
}
