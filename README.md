Shell Scripts for Research Data Processing

This repository contains shell scripts used in computational biology and bioinformatics workflows. The scripts use AWK, SED, Grep, and command-line tools for FASTA processing, BLAST searches, FASTQ statistics, and transcript quantification. One R script is included for molecular dynamics analysis.

📁 Repository Structure
Shell_scripts_research/
│
├── DNA_translation_AA_largescale.sh
├── MD_trajectory_Datanalysis.R
│
├── fasta_file_handling     (text file containing multiple FASTA-related shell commands)
├── file_manipulation       (text file containing multiple file-processing shell commands)
│
└── README.md

🧬 Main Scripts
1. DNA_translation_AA_largescale.sh

A shell script for large-scale DNA→protein translation using AWK.
Useful for processing large FASTA datasets efficiently.

2. MD_trajectory_Datanalysis.R

R script for molecular dynamics trajectory analysis.
Performs basic calculations and visualizations used in MD workflows.

📄 Text File: fasta_file_handling

This file contains several independent shell command snippets for processing FASTA files and running BLASTP.

Included scripts/commands:
a. Split a FASTA file into separate files
awk '/^>tr/{close(f);f++}{print $0 > f}' uniprot_uncharacterized_protein_human.fasta

b. Convert FASTA files to text
textutil -convert txt *

c. Run BLASTP on each converted entry
for i in *.txt; do
    name=$(echo $i | awk -F "." '{print $1}')
    blastp -query $i \
           -db /Users/sayaneshome/Downloads/ncbi-blast-2.6.0+-src/c++/ReleaseMT/build/db/nr \
           -out ${name}.out
done


Each snippet is independent and meant to be executed manually as needed.

📄 Text File: file_manipulation

This file contains miscellaneous shell scripts for text processing, FASTQ statistics, and expression quantification.

Included scripts/commands:
a. Extract lines around a pattern
grep -A 20 -B 5 'Sequences producing significant alignments: ' B90_mc10_trinity_novel_2.out > output.txt

b. Compute total reads, mean read length, and standard deviation for FASTQ files
for F in *.fastq
do 
    echo "$F"
    awk 'BEGIN { t=0.0; sq=0.0; n=0; }
         NR%4==2 { n++; L=length($0); t+=L; sq+=L*L; }
         END { m=t/n; printf("total %d avg=%f stddev=%f\n", n, m, sq/n - m*m); }' $F
done

c. Run kallisto quantification on multiple FASTQ files
for j in *.fastq; do
    kallisto quant \
        -i ../homo_sapiens/transcriptome.idx \
        -g ../homo_sapiens/Homo_sapiens.GRCh38.96.gtf \
        -l 50 -s 1 \
        -o "${j}_1" \
        --genomebam --single "$j"
done


These are standalone snippets organized together for convenience.

🚀 Usage

Clone the repo:

git clone https://github.com/sayaneshome/Shell_scripts_research.git
cd Shell_scripts_research


Run any standalone .sh script directly:

bash DNA_translation_AA_largescale.sh


Run individual lines from fasta_file_handling or file_manipulation as needed.

🔧 Requirements

bash

awk, sed, grep

textutil (macOS)

BLAST+

kallisto

R (for MD analysis)

📄 License

Open for academic and research use.
