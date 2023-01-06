#include <stdio.h>
#include <stdlib.h>

#ifndef VERSION
    #define VERSION "1.0"
#endif

const char build_time[] = __TIMESTAMP__;
const char version[] = VERSION;

int main(int argc, char *argv[])
{
    if (argc >= 2 && argv[1][0] == '-')
    {
        switch (argv[1][1])
        {
        case 'v':
            printf("Build time: %s\n",build_time);
            printf("Version is %s\n", version) ;
            break;
        default:
            fprintf(stderr, "Unknown usage: %s \n", argv[1]);
            exit(EXIT_FAILURE);
            break;
        
        }
    } else {
        printf("Hello, world!\n");
    }
    return 0;
}