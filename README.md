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

````markdown
variant-calling-pipeline
│
├── README.md
├── scripts/
├── results/
└── figures/

