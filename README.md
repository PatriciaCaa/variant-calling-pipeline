# Variant Calling Pipeline

This repository contains a small next-generation sequencing variant calling workflow built using standard genomics tools.

The project follows a simple pipeline starting from publicly available sequencing reads, through quality control, alignment, BAM processing, variant calling, and visualisation of candidate variants in IGV.

## Overview

This project implements a simple variant-calling pipeline for analysing next-generation sequencing data. The workflow includes read quality control, alignment to a reference genome, variant calling, annotation, and visualisation.

## Dataset

Sequencing reads were downloaded from the NCBI Sequence Read Archive (SRA).

Accession: SRR2584866

Paired-end reads:
- SRR2584866_1.fasta.gz
- SRR2584866_2.fasta.gz

## Project Workflow

1. Download sequencing reads
2. Download the reference genome
3. Perform quality control with FastQC
4. Align reads to the reference genome using BWA MEM
5. Convert SAM to BAM using SAMtools
6. Sort BAM file using SAMtools
7. Index BAM file using SAMtools
8. Call variants using FreeBayes
9. Annotate variants using Ensembl Variant Effect Predictor (VEP)
10. Visualise candidate variants in IGV
    
## Tools Used

- FastQC
- BWA
- SAMtools
- FreeBayes
- Ensembl Variant Effect Predictor (VEP)
- IGV
  
**Variant annotation is performed using Ensembl Variant Effect Predictor (VEP) to identify the potential functional consequences of detected variants.**

## Repository Structure

```text
variant-calling-pipeline
│
├── README.md
├── scripts/
├── results/
├── figures/
├── data/
```

## Example Pipeline Commands

### 1. Quality Control with FastQC

```bash
fastqc sample_reads.fastq
```

### 2. Index the Reference Genome

```bash
bwa index reference_genome.fasta
```

### 3. Align Reads with BWA MEM

```bash
bwa mem reference_genome.fasta sample_reads.fastq > aligned_reads.sam
```

### 4. Convert SAM to BAM

```bash
samtools view -Sb aligned_reads.sam > aligned_reads.bam
```

### 5. Sort BAM File

```bash
samtools sort aligned_reads.bam -o sorted_reads.bam
```

### 6. Index BAM File

```bash
samtools index sorted_reads.bam
```

### 7. Variant Calling with FreeBayes

```bash
freebayes -f reference_genome.fasta sorted_reads.bam > variants.vcf
```

### 8. Variant Annotation with VEP

```bash
vep -i variants.vcf -o annotated_variants.vcf --cache
```

### 9. Visualisation in IGV

Load the following files in IGV:

- reference genome
- sorted BAM file
- VCF variant file

## Results

The pipeline produced aligned reads and variant calls.

Key output files generated during the analysis include:

- `aligned_reads.sorted.bam` – sorted alignment file generated using SAMtools
- `aligned_reads.sorted.bam.bai` – BAM index file
- `variants.vcf` – variants identified using FreeBayes

FastQC reports were also generated to assess the quality of the sequencing reads.

### Visualisation in IGV

Variants were inspected using Integrative Genomics Viewer (IGV) by loading:

- the reference genome
- `aligned_reads.sorted.bam`
- `variants.vcf`
