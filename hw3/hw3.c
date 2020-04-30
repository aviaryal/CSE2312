#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>



typedef struct _BUSINESS
{
 uint32_t taxId;
 char name[22];
 char street[30];
 char direction;
 uint32_t addNo;
 char city[35];
 char state[3];
 uint32_t zip;
} BUSINESS;

extern bool isStrEqual(const char *str1, const char *str2);
extern void strCopy(char *str1, const char *str2);
extern int32_t sumS16(const int16_t x[], int32_t count);
extern uint32_t sumU16(const uint16_t x[], uint32_t count);
extern uint32_t countZeros(const int32_t x[], uint32_t count);
extern void rightStringFull(char strOut[], const char strIn[], uint32_t length); 
extern void rightStringTrunc(char strOut[], const char strIn[], uint32_t length);
extern int32_t find2ndMatch(const char strIn[], const char strMatch[]) ;
//extern void find2ndMatch(const char strIn[], const char strMatch[]) ;
extern uint32_t countMatches(const char strIn[], const char strMatch[]);
extern void sortAscendingInPlace (uint32_t x[], uint32_t count);
extern	uint8_t decimalToUint8(const char str[]);
extern int8_t decimalToInt8(const char str[]) ;
extern uint16_t hexStringToUint16(const char str[]) ;
extern void uint8ToBinaryString (char str[], uint8_t x) ;
int32_t findStreet (char street[], const BUSINESS business[], uint32_t count) ;

//disassemble



#define COUNT 3

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
 	/*
 	uint32_t x[]={9,8,7};
  uint32_t count=3;
  sortAscendingInPlace(x,count);
  for(int i=0;i<3;i++)
  	printf("%d ",x[i]);
  */
  /*
  char *a={"BABAB AB b"};
  char *b={"AB b"};
  uint32_t x=countMatches(a,b);
  printf("There are %u %s on %s\n",x,a,b);
  */
  /*
  char *a={"BABAB AB b"};
  char *b={"AB"};
  int32_t x=find2ndMatch(a,b);
  //find2ndMatch(a,b);
  printf("The %s is offset %s\n",a,x);
  */
  
  char *a={"1000"};
  uint8_t x= decimalToUint8(a);
  printf("The value is %u\n",x);
  
  
  /*
  char a[9];;
  uint8_t x= 255;
  uint8ToBinaryString(a,x);
  printf("The value is %d in binary is  %s\n",x,a);
  */
  /*
  char *a={"F9FF"};
  uint16_t b = hexStringToUint16(a);
  printf("Converting a %s to b in hex : %X\n",a,b);
  */
  
	/*
  uint32_t i=3;
  BUSINESS business[COUNT] = {
        {12342332, "Home Depot", "AB", 'W', 201, "Arlington", "TX", 76011},
        {18091123, "Kroger", "Lamar", 'W', 945, "Arlington", "TX", 76012},
        {81927322, "Round1", "Cooper St" , 'S', 3811, "Arlington", "TX", 76015} };
    
    printf("Addresses of selected record entries:\r\n");
    char format[] = {"%p %s\r\n"};
    printf(format, &business[0], "business[0]");
    printf(format, &business[1], "business[1]");
    printf(format, &business[2], "business[2]");
    
    
    
    
    char *street={"Lamar"};
    uint32_t VALUE= findStreet(street,business,i);
    printf("%p\n",VALUE);
   */
}
