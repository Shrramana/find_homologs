cd /home/shrramana/biol7200/class3/ex3/

protein_query="$1"
nucleotide_subject="$2"
output_file="$3"

tblastn -query "$protein_query" -subject "$nucleotide_subject" -outfmt "6 qseqid sseqid pident length" > blast_results.txt

# Filter hits to keep only those with >30% sequence identity and >90% match length
awk '$3 > 30 && $4 > 0.9 * length($1)' blast_results.txt > filtered_hits.txt

match_count=$(wc -l < filtered_hits.txt)

