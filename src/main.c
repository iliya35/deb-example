#include <stdio.h>
#include <stdlib.h>

#ifndef VERSION
    #define VERSION "1.0"
#endif

const char build_time[] = __TIMESTAMP__;
const char version[] = VERSION;

int main(int argc, char *argv[])
{
    
    int count;
    printf("Количество аргументов, указанных в командной строке: %d\n", argc - 1);
    for (count = 1; count < argc; count++)
        printf("%d: %s\n", count, argv[count]) ;
    printf("%d\n", argc) ;
    if (argv[1][0] == '-' && argc >= 2)
    {
        switch (argv[1][1])
        {
        case 'v':
            printf("Build time: %s.\n",build_time);
            printf("Version is %s\n", version) ;
            break;
        default:
            fprintf(stderr, "Unknown usage: %s \n", argv[1]);
            exit(EXIT_FAILURE);
            break;
        
        }
    } else {
        printf (" \n" ) ;
        printf("Hello, world!\n");
    }
    return 0;
}