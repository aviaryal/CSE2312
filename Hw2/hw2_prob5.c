#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
extern uint64_t add32(uint32_t x, uint32_t y); // returns x+y
//extern uint64_t sub64(uint64_t x, uint64_t y); // returns (x-y)%(2 64 )
//extern uint16_t minU16(uint16_t x, uint16_t y); // returns the minimum of x, y
//extern int32_t minS32(int32_t x, int32_t y); // returns the minimum of x, y
//extern bool isLessThanU16(uint16_t x, uint16_t y); // returns 1 if x<y, 0 else
//extern bool isLessThanS16(int16_t x, int16_t y); // returns 1 if x<y, 0 else
//extern uint16_t shiftLeftU16 (uint16_t x, uint16_t p); // returns x << p =((x*2^(p)) % 2 32 ) for p = 0..31
//extern int8_t shiftS8(int8_t x, int8_t p); // return (x*2^p) % 2 32 ) for p = -31..31
//extern uint32_t shiftU32(uint32_t x, int32_t p); // return ((x*2^p) % 2 32 ) for p = -31..31
//extern bool isEqualU32(uint32_t x, uint32_t y); // returns 1 if x=y, 0 if x!=y
//extern bool isEqualS8(int8_t x, int8_t y); // returns 1 if x=y, 0 if x!=y
//extern bool isStrEqual(const char* str1, const char* str2); // returns 1 the strings match, 0 otherwise
//extern void strCopy(char* strTo, const char* strFrom); // copies strFrom to strTo


int main()
{
  uint32_t a=4;
  uint32_t b=5;
  uint64_t c;
  c=add32(a,b);
}
