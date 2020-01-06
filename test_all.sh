#!/usr/bin/env bash
# Program:
#       This program is to evaluate the raidmeter performance in different traces.
# History:
# 2018.1.2  Vitor Zhu       First release.

OUTPUT_FOLDER=result

if [ ! -d "$OUTPUT_FOLDER" ]; then
    mkdir "$OUTPUT_FOLDER"
fi

sudo bash single_evaluation.sh dedupschems=2 tracetype=1 tracename=homes_500000.trace resultname=${OUTPUT_FOLDER}/homes.sample capacity=100 devicename=/dev/nvme0n1

sudo bash single_evaluation.sh dedupschems=2 tracetype=2 tracename=web_500000.trace resultname=${OUTPUT_FOLDER}/web.sample capacity=100 devicename=/dev/nvme0n1

sudo bash single_evaluation.sh dedupschems=2 tracetype=2 tracename=mail_500000.trace resultname=${OUTPUT_FOLDER}/mail.sample capacity=100 devicename=/dev/nvme0n1

sudo bash single_evaluation.sh dedupschems=0 tracetype=2 tracename=web_500000.trace resultname=${OUTPUT_FOLDER}/web.traditional capacity=100 devicename=/dev/nvme0n1

sudo bash single_evaluation.sh dedupschems=1 tracetype=2 tracename=web_500000.trace resultname=${OUTPUT_FOLDER}/web.EaD capacity=100 devicename=/dev/nvme0n1

sudo bash single_evaluation.sh dedupschems=0 tracetype=1 tracename=homes_500000.trace resultname=${OUTPUT_FOLDER}/homes.traditional capacity=100 devicename=/dev/nvme0n1

sudo bash single_evaluation.sh dedupschems=1 tracetype=1 tracename=homes_500000.trace resultname=${OUTPUT_FOLDER}/homes.EaD capacity=100 devicename=/dev/nvme0n1

sudo bash single_evaluation.sh dedupschems=0 tracetype=2 tracename=mail_500000.trace resultname=${OUTPUT_FOLDER}/mail.traditional capacity=100 devicename=/dev/nvme0n1

sudo bash single_evaluation.sh dedupschems=1 tracetype=2 tracename=mail_500000.trace resultname=${OUTPUT_FOLDER}/mail.EaD capacity=100 devicename=/dev/nvme0n1

