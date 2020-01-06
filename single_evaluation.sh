#!/usr/bin/env bash
# Program:
#       This program is to evaluate the performance in different traces.
#       The parameters of this shell is same as the raidmeter.
# History:
# 2018.1.2  Vitor Zhu       First release.

PARAMETERS=""

for var in "$@"
do
    option=${var%=*}
    if [ "$option" == "rangescale" ]; then
        rangescale=${var#rangescale=}
        PARAMETERS="$PARAMETERS -a $rangescale"
    elif [ "$option" == "timescale" ]; then
        timescale=${var#timescale=}
        PARAMETERS="$PARAMETERS -i $timescale"
    elif [ "$option" == "dedupschems" ]; then
        dedupschems=${var#dedupschems=}
        PARAMETERS="$PARAMETERS -h $dedupschems"
    elif [ "$option" == "tracetype" ]; then
        tracetype=${var#tracetype=}
        PARAMETERS="$PARAMETERS -p $tracetype"
    elif [ "$option" == "tracename" ]; then
        tracename=${var#tracename=}
        PARAMETERS="$PARAMETERS -t $tracename"
    elif [ "$option" == "resultname" ]; then
        resultname=${var#resultname=}
        PARAMETERS="$PARAMETERS -r $resultname"
    elif [ "$option" == "devicename" ]; then
        devicename=${var#devicename=}
    elif [ "$option" == "capacity" ]; then
        capacity=${var#capacity=}
        PARAMETERS="$PARAMETERS -c $capacity"
    else
        echo "Wrong parameters!"
        exit 1
    fi
done
if [ -z "$devicename" ]; then
    echo "Please input a device."
    exit 1
fi
if [ ! -b "$devicename" ]; then
	echo "# FAILED: dev_name($devicename)"
	exit 1
fi

PARAMETERS="$PARAMETERS $devicename"
echo "./raidmeter$PARAMETERS"
sudo ./raidmeter $PARAMETERS