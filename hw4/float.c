#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>

#define COUNT 9

void uint23ToBinaryString(char str[], uint32_t x)
{
    uint32_t index;
    uint32_t mask = 0x400000;
    for (index = 0; index < 23; index++)
    {
	if (x & mask)
	    str[index] = '1';
	else
	    str[index] = '0';
	mask >>= 1;
     }
     str[23] = '\0';
}

int main()
{
    int i;
    uint32_t value;
    uint32_t s;
    uint32_t e;
    uint32_t f;
    char str[24];
    float x[COUNT] = {1, -1, 2, -2, -0.640625, 0.3333333333333,
                      1024, 1024 + 1/8192.0, 1024 + 1/16384.0};
    printf("Float value           Hex         S  E    F\n");
    for (int i = 0; i < COUNT; i++)
    {
        value = *((uint32_t*)&x[i]);
        s = value >> 31;
        e = (value >> 23) & 0xFF;
        f = value & 0x7FFFFF;
        uint23ToBinaryString(str, f);
        printf("%20.10f  0x%08x  %1d  %3d  %s\n", x[i], value, s, e, str);
    }
    return EXIT_SUCCESS;
}

