# Variant Calling Pipeline

This repository contains a small next-generation sequencing variant calling workflow built using standard genomics tools.

The project follows a simple pipeline starting from publicly available sequencing reads, through quality control, alignment, BAM processing, variant calling, and visualisation of candidate variants in IGV.

## Overview

This project was created to practise the main steps involved in a short-read variant calling workflow using Linux command-line tools.

The analysis includes:

- downloading sequencing reads
- downloading the reference genome
- performing quality control with FastQC
- aligning reads with BWA
- processing BAM files with SAMtools
- calling variants with FreeBayes
- annotation using VEP
- inspecting variants in IGV

## Project Workflow

1. Download sequencing reads
2. Download the reference genome
3. Perform quality control with FastQC
4. Align reads to the reference genome using BWA MEM
5. Convert SAM to BAM using SAMtools
6. Sort and index BAM files
7. Call variants using FreeBayes
8. Annotate variants using Ensembl Variant Effect Predictor (VEP)
9. Visualise candidate variants in IGV

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

The pipeline successfully produced aligned reads, variant calls, and annotated variants.

Key output files generated during the analysis include:

- `sorted_reads.bam` – sorted alignment file used for downstream analysis  
- `variants.vcf` – variants identified using FreeBayes  

### Variant Visualisation

Candidate variants were inspected using **Integrative Genomics Viewer (IGV)** by loading the reference genome, the sorted BAM file, and the variant VCF file. This allows visual confirmation of variant positions and read support.
