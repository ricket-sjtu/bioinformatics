#!/bin/bash

# Align the simulated reads against the reference genome
bwa aln indexes/e_coli simulated_reads/sim_reads.fq > alignments/sim_reads.sai
bwa samse -f alignments/sim_reads.sam indexes/e_coli alignments/sim_reads.sai simulated_reads/sim_reads.fq
