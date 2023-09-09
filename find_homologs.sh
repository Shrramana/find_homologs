cd /home/shrramana/biol7200/class3/ex3/

protein_query="$1"
nucleotide_subject="$2"
output_file="$3"

tblastn -query "$protein_query" -subject "$nucleotide_subject" -outfmt "6 qseqid sseqid pident length" > blast_results.txt

