sort myfile.txt | uniq -u

while read line;  do curl -s -d "dna_sequence="$line"&output_format=fasta" https://web.expasy.org/cgi-bin/translate/dna2aa.cgi >> my_output4_${line}.fasta; done < 'DNA_sequences_chr22_SL16.txt'


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
