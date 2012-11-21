
#include <sys/stat.h>
#include <unistd.h>

int main( int argc, char *argv[] )
{
    struct stat st;
    if( stat( "/proc/last_kmsg", &st ) && stat( "/proc/first_bootmsg", &st ) )
    {
        execl( "/sbin/chargerlogo", "chargerlogo", (char*)NULL );
    }
    return 0;
}
