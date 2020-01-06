#!/usr/bin/env bash
# Program:
#       This program is to evaluate the raidmeter performance in different traces.
# History:
# 2018.1.2  Vitor Zhu       First release.

OUTPUT_FOLDER=result

if [ ! -d "$OUTPUT_FOLDER" ]; then
    mkdir "$OUTPUT_FOLDER"
fi

sudo bash single_evaluation.sh tracetype=0 tracename=traces/financial.txt resultname=${OUTPUT_FOLDER}/financial.sample capacity=8 devicename=/dev/nvme0n1

sudo bash single_evaluation.sh tracetype=0 tracename=traces/hm_0.txt resultname=${OUTPUT_FOLDER}/hm_0.sample capacity=8 devicename=/dev/nvme0n1

sudo bash single_evaluation.sh tracetype=0 tracename=traces/prxy_0.txt resultname=${OUTPUT_FOLDER}/prxy_0.sample capacity=8 devicename=/dev/nvme0n1

sudo bash single_evaluation.sh tracetype=0 tracename=traces/rsrch_0.txt resultname=${OUTPUT_FOLDER}/rsrch_0.sample capacity=8 devicename=/dev/nvme0n1

sudo bash single_evaluation.sh tracetype=0 tracename=traces/wdev_0.txt resultname=${OUTPUT_FOLDER}/wdev_0.sample capacity=8 devicename=/dev/nvme0n1

