
#!/bin/bash

# Variant-calling pipeline
# Dataset: SRR2584866

# ---------------------------
# 1. Quality control with FastQC
# ---------------------------
fastqc SRR2584866_1.fastq.gz
fastqc SRR2584866_2.fastq.gz


# ---------------------------
# 2. Index the reference genome
# ---------------------------
bwa index Homo_sapiens.GRCh38.dna.primary_assembly.fa


# ---------------------------
# 3. Align reads with BWA MEM
# Using 4 CPU threads (-t 4)
# ---------------------------
bwa mem -t 4 ../referenceresults/Homo_sapiens.GRCh38.dna.primary_assembly.fa \
SRR2584866_1.fastq.gz SRR2584866_2.fastq.gz > aligned_reads.sam


# ---------------------------
# 4. Convert SAM to BAM
# ---------------------------
samtools view -S -b aligned_reads.sam > aligned_reads.bam


# ---------------------------
# 5. Sort BAM file
# ---------------------------
samtools sort aligned_reads.bam -o aligned_reads.sorted.bam


# ---------------------------
# 6. Index sorted BAM
# ---------------------------
samtools index aligned_reads.sorted.bam


# ---------------------------
# 7. Variant calling with FreeBayes
# ---------------------------
freebayes -f ../referenceresults/Homo_sapiens.GRCh38.dna.primary_assembly.fa \
aligned_reads.sorted.bam > variants.vcf
