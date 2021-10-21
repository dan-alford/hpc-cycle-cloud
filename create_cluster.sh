#!/bin/bash
cyclecloud initialize --url=https://localhost:443 --verify-ssl=false --username=$1 --password=$2 --batch

git clone https://github.com/Azure/cyclecloud-slurm.git /tmp/cc-slurm/

cyclecloud import_template -f /tmp/cc-slurm/templates/slurm.txt

cyclecloud create_cluster Slurm slurm_terra_cluster -p /tmp/parameters.json -P SubnetId=$3 -P Region=$4

cyclecloud start_cluster slurm_terra_cluster
