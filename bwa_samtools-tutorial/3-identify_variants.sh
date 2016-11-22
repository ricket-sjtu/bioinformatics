# Convert SAM to BAM
# -b:  output BAM
# -S:  input is SAM
printf "\n>Converting SAM to BAM\n"
samtools view -b -S -o alignments/sim_reads.bam alignments/sim_reads.sam

# Sort and Index BAM
printf "\n>Sorting and indexing BAM\n"
samtools sort alignments/sim_reads.bam alignments/sim_reads.sorted
samtools index alignments/sim_reads.sorted.bam

# Identify SNPs:  requires two distinct steps.
# These steps can be piped together, but for clarify, they are issues
# as two independent steps below.

# First, run samtools mpileup to calculate likelihoods
# -g:  generate BCF output (genotype likelihoods)
# -f:  reference sequence file
printf "\n>Running mpileup\n"
samtools mpileup -g -f genomes/NC_008253.fna alignments/sim_reads.sorted.bam > variants/sim_variants.bcf

# Second, run bcftools to actually call the SNPs
# -c:  SNP calling (force -e)
# -v:  output potential variant sites only
# -e:  likelihood based analyses
printf "\n>Calling variants with bcftools\n"
bcftools view -c -v variants/sim_variants.bcf > variants/sim_variants.vcf

printf "\nAll done.\n"

# Then, you can do tview...
samtools tview alignments/sim_reads_aligned.sorted.bam genomes/NC_008253.fna
