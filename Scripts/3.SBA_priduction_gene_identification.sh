#!/bin/bash

help_message="Usage: bash 3.SBA_priduction_gene_identification.sh [--gene name] [--query_type nucl/prot] [--query file_name]  [--evalue value] [--thread value]

Options:
  --gene        Name of gene family.
  --query_type  Molecule type of queries ('nucl' or 'prot').
  --query       File name of queries.
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
        --query_type)
            query_type="$2"
            shift
            shift
            ;;
        --query)
            query="$2"
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

if [ "$query_type" = "nucl" ]; then
  blastx -db $gene -query $query -outfmt 6 -out $gene'_blast_out.txt' -evalue $evalue -num_threads $thread
elif [ "$query_type" = "prot" ]; then
  blastp -db $gene -query $query -outfmt 6 -out $gene'_blast_out.txt' -evalue $evalue -num_threads $thread
else
  echo "Unknown value of 'query_type'"
fi
