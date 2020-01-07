#!/usr/bin/env bash
# Program:
#       This program is to evaluate the raidmeter performance in different traces.
# History:
# 2018.1.2  Vitor Zhu       First release.

OUTPUT_FOLDER=result

if [ ! -d "$OUTPUT_FOLDER" ]; then
    mkdir "$OUTPUT_FOLDER"
fi

sudo bash single_evaluation.sh tracetype=0 timescale=10 tracename=traces/financial_100000.txt resultname=financial.sample capacity=8 devicename=/dev/nvme0n1

sudo bash single_evaluation.sh tracetype=0 timescale=10 tracename=traces/hm_0_100000.txt resultname=hm_0.sample capacity=8 devicename=/dev/nvme0n1

sudo bash single_evaluation.sh tracetype=0 timescale=10 tracename=traces/prxy_0_100000.txt resultname=prxy_0.sample capacity=8 devicename=/dev/nvme0n1

sudo bash single_evaluation.sh tracetype=0 timescale=10 tracename=traces/rsrch_0_100000.txt resultname=rsrch_0.sample capacity=8 devicename=/dev/nvme0n1

sudo bash single_evaluation.sh tracetype=0 timescale=10 tracename=traces/wdev_0_100000.txt resultname=wdev_0.sample capacity=8 devicename=/dev/nvme0n1

sudo bash single_evaluation.sh tracetype=0 timescale=10 tracename=traces/mds_0_100000.txt resultname=mds_0.sample capacity=8 devicename=/dev/nvme0n1
