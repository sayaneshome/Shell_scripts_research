sort myfile.txt | uniq -u

#!/bin/env bash
i=0
while IFS=  read -r -d $'\n'
do
  ((i++))
  curl -s -d "dna_sequence=${REPLY}&output_format=fasta" 'https://web.expasy.org/cgi-bin/translate/dna2aa.cgi' > "./output_${i}.fasta"
done < <( sed '/^>/d' "./input.txt" )
exit 0


while read line;

if $line= "Sequences producing significant alignments:" ;

do  grep -A4 -B10 >> output.txt;

done < 'SK16_kejuematrix_uniquehits_chr38_reduced5.txt'


for file in *; do cat "$file"; done > output.fasta


grep -o '>' output_sequences_prelim.txt | wc -l


'/@/d' sequences_SK16_chr38.txt > sequences_SK16_chr38_filtered.txt
sort sequences_SK16_chr38.txt | uniq -u

sort sequences_SK16_chr38.txt | uniq -u > sequences_SK16_chr38_unique.txt

sed '/@/d' sequences_SK16_chr38_unique.txt > sequences_SK16_chr38_unique_1.txt


find . -maxdepth 1 -type f -name '*.fasta' -print0 |
sort -zV |
xargs -0 cat >merged_snake.txt
