#!/bin/bash
cyclecloud initialize --url=https://localhost:443 --verify-ssl=false --username=$1 --password=$2 --batch

git clone https://github.com/Azure/cyclecloud-slurm.git /tmp/cc-slurm/

cyclecloud import_template -f /tmp/cc-slurm/templates/slurm.txt

cyclecloud create_cluster $3 -p $4 -P SubnetId=$5 -P Region=$6

cyclecloud start_cluster $3
