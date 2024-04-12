#!/bin/bash

help_message="Usage: bash 2.Phylogenetic_tree_build.sh [--gene name] [--thread value]

Options:
  --gene      Name of gene family.
  --thread    Number of cores/threads for iqtree. Default is 1.
  --help      Show this help message."

thread=1

while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        --gene)
            gene="$2"
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

clustalo -i $gene.fasta -o $gene'_clustao.fasta'
trimal -in $gene'_clustao.fasta' -out $gene.phy -phylip -automated1
iqtree -s $gene.phy -T $thread -B 1000 > $gene'_tree_build.out'
