#!/bin/sh

# First, make sure wgsim is installed
if ! type wgsim > /dev/null 2>&1; then
    echo "Could not find wgsim.  Please adjust your path or download from:  https://github.com/lh3/wgsim."
fi

# Generate simulated reads
wgsim -N1000 -S1 genomes/NC_008253_1K.fna simulated_reads/sim_reads.fq /dev/null
