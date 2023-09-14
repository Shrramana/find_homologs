cd /home/shrramana/biol7200/class3/ex3/

protein_q="$1"
nucl_sub="$2"
output_file="$3"

tblastn -query "$protein_q" -subject "$nucl_sub" -outfmt "6 qseqid sseqid pident length qlen" > blast_results.txt

awk '$3 > 30 && $4 > (0.9 * $5)' blast_results.txt > $output_file

match_count=$(wc -l < $output_file)
echo "Number of matches identified: $match_count"  

#rm blast_results.txt 
