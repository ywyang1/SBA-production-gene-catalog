#!/bin/bash

help_message="Usage: bash SBA_priduction_gene_identification.sh [--gene name] [--input_type value] [--input value]  [--evalue value] [--thread value]

Options:
  --gene        Name of gene family.
  --input_type  Molecule type of queries ('nucl' or 'prot').
  --input       Input file name.
  --evalue      Expectation Evalue threshold for saving hits. Default is 1e-50.
  --thread      Number of threads (CPUs) to use in the BLAST search. Default is 1.
  --help        Show this help message."

evalue=1e-50
thread=1

while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        --gene)
            gene="$2"
            shift
            shift
            ;;
        --input_type)
            input_type="$2"
            shift
            shift
            ;;
        --input)
            input="$2"
            shift
            shift
            ;;
        --evalue)
            evalue="$2"
            shift
            shift
            ;;
        --thread)
            thread="$2"
            shift
            shift
            ;;
        --help)
            echo "$help_message"
            exit 0
            ;;
        *)
            echo "unkonw: $key"
            shift
            ;;
    esac
done

makeblastdb -in $gene.fasta -dbtype prot -out $gene

if [ "$input_type" = "nucl" ]; then
  blastx -db $gene -query $input -outfmt 6 -out $gene'_blast_out.txt' -evalue $evalue -num_threads $thread
elif [ "$input_type" = "prot" ]; then
  blastp -db $gene -query $input -outfmt 6 -out $gene'_blast_out.txt' -evalue $evalue -num_threads $thread
else
  echo "Unknown value of 'input_type'"
fi
