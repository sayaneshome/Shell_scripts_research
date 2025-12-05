# Shell Scripts for Research

This repository contains shell and R scripts that I use in my research for
bioinformatics and computational biology. The scripts rely on standard UNIX
tools (`awk`, `sed`, `grep`) plus a few external programs (BLAST+, kallisto, R).

They are mainly small, reusable snippets for:

- Working with FASTA files
- Parsing BLAST outputs
- Inspecting FASTQ read statistics
- Running transcript quantification
- Analyzing molecular dynamics trajectories in R

---

## 📁 Files

- `DNA_translation_AA_largescale.sh`  
  Shell script for large-scale translation of DNA sequences to amino acids.

- `MD_trajectory_Datanalysis.R`  
  R script for basic molecular dynamics (MD) trajectory analysis.

- `fasta_file_handling`  
  Text file containing several one-liner and loop commands for:
  - splitting a multi-FASTA file into individual files  
  - converting files to `.txt`  
  - running `blastp` on each sequence and saving the outputs  

- `file_manipulation`  
  Text file containing commands for:
  - extracting regions around a pattern from BLAST output  
  - computing total reads, mean read length, and standard deviation in FASTQ files  
  - running `kallisto quant` in a loop over multiple FASTQ files  

---

## 🔧 Example Snippets

### Split a multi-FASTA file into separate files

```bash
awk '/^>tr/{close(f);f++}{print $0 > f}' uniprot_uncharacterized_protein_human.fasta
