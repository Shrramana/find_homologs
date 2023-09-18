#!/usr/bin/bash 
cd /home/shrramana/biol7200/class3/ex3/

query_seqs="$1" 
genome_assembly="$2" 
genes_bed="$3" 
outfile="$4" 
# Perform tblastn search and save results to a temporary file 

tmpfile=$(mktemp)

tblastn -query "$query_seqs" -subject "$genome_assembly" -outfmt "6 std qlen" | awk '$3 > 30 && $4 > (0.9 * $13)' > blast_results.txt

match_count=$(wc -l < blast_results.txt)
echo "Number of tblastn matches identified from $genome_assembly: $match_count"

awk 'NR==FNR { positions[$9,$10]; next } { for (pos in positions) { split(pos, arr, SUBSEP); if ($2 <= arr[1] && $3 >= arr[2]) print $4 } }' blast_results.txt $genes_bed > $outfile

