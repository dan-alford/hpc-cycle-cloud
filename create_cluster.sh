#!/bin/bash



cyclecloud create_cluster slurm $1 -p $2  -P AdditionalNFSExportPath="/$3/data" -P AdditonalNFSAddress="$3.blob.core.windows.net"

cyclecloud start_cluster $1
