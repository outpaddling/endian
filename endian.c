/****************************************************************************
Name:   Jason W. Bacon

Description: Report whether a system is big or little endian.
 
Returns: 1 for big endian, 0 for little.
****************************************************************************/

#include <stdio.h>

int     main(int argc,char *argv[])

{
    union
    {
	unsigned long   intval;
	struct
	{
	    unsigned char   byte0;
	    unsigned char   byte1;
	    unsigned char   byte2;
	    unsigned char   byte3;
	};
    }   v;
    
    v.intval = 0x00010203;
    if ( (v.byte0 == 3) && (v.byte1 == 2) && (v.byte2 == 1) )
    {
	puts("little");
	return 0;
    }
    else if ( (v.byte0 == 0) && (v.byte1 == 1) && (v.byte2 == 2) )
    {
	puts("big");
	return 1;
    }
    else
    {
	puts("mixed");
	return 2;
    }
}

