#!/bin/bash

help_message="Usage: bash 1.SBA_production_gene_HMM.sh [--gene name] [--cycle value] [--evalue value]  [--cpu value] [--database file_name]

Options:
  --gene      Name of gene family.
  --cycle     Times of iterative process to ensure the robustness of models. Default is 3.
  --evalue    Report sequences <= this evalue threshold in hmmsearch output. Default is 1e-65.
  --database  Database for hmmsearch.
  --cpu       Number of parallel CPU workers to use hmmsearch for multithreads. Default is 1.
  --help      Show this help message."

cycle=3
evalue=1e-65
cpu=1

while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        --gene)
            gene="$2"
            shift
            shift
            ;;
        --cycle)
            cycle="$2"
            shift
            shift
            ;;
        --evalue)
            evalue="$2"
            shift
            shift
            ;;
        --database)
            database="$2"
            shift
            shift
            ;;
        --cpu)
            cpu="$2"
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

clustalo -i $gene'_seed.fasta' -o $gene'_0.sto' --outfmt=st
hmmbuild $gene'_0.hmm' $gene'_0.sto' >  $gene'_hmmbulid_0.out'

m=1
n=0
while [[ $m -le $cycle ]]
do
    hmmalign $gene'_'$n.hmm $gene'_seed.fasta' > $gene'_'$m.sto
    hmmbuild $gene'_'$m.hmm $gene'_'$m.sto  >  $gene'_hmmbulid_'$m.out
    ((m++))
    ((n++))
done

hmmsearch --tblout $gene'_hmmsearch_out'.txt -E $evalue --cpu $cpu $gene'_'$cycle.hmm $database > $gene'_hmmsearch.out'