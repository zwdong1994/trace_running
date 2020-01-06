//
// Created by victor on 1/28/18.
//

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

typedef	struct	_io_time
{
    double	start_time;
    double	end_time;
    double	elpsd_time;
    double  move_time;
    unsigned int	flag;
    int hash_flag;
}io_time;


uint64_t time_collect_num_less[1000];

int avertime_distribute_less(double elpstime) {
    int integer;
    integer = (int)(elpstime / 0.001);
    if(integer < 1000) {
        for(int i = integer; i <= 999; ++i) {
            ++time_collect_num_less[i];
        }
    }
    else {
        ++time_collect_num_less[999];
    }
    return 0;
}

int main(int argc, char **argv){
    char path[30];
    FILE *in, *out;
    io_time mid_time;
    uint64_t chunk_num = 0;
    if(argc == 1)
    {
        printf("error: no parameter!\n");
        exit(0);
    }
    if(argc > 2){
        printf("error: too many parameters!\n");
        exit(0);
    }
    sprintf(path, "%s.distribute", argv[1]);
    if((out = fopen(argv[1], "r")) == NULL){
        printf("Open %s error!\n", argv[1]);
        exit(0);
    }
    if((in = fopen(path, "w")) == NULL ){
        printf("Open %s error!\n", argv[1]);
        exit(0);
    }

    while((fread(&mid_time, sizeof(io_time), 1, out)) == 1 ){
        avertime_distribute_less(mid_time.elpsd_time * 1000);
        chunk_num ++;
    }
    for(int i = 0; i < 1000; ++i){
        fprintf(in, "%d\t%lf\n", i+1, (double)time_collect_num_less[i] / chunk_num);
    }

    fclose(in);
    fclose(out);
    return 0;
}

