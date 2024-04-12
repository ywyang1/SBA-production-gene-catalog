# Data
## Non-redundant protein sequences of the SBA production gene catalog
# Scripts
## 1.SBA_production_gene_HMM.sh
### Software
Clustal Omega  
HMMER
### Input file
1. A fasta file including the seed protein sequences for model building
2. Protein database for searching target genes
### Usage
bash 1.SBA_production_gene_HMM.sh [--gene name] [--cycle value] [--evalue value]  [--cpu value] [--database file_name]

Options:  
  --gene      Name of gene family.  
  --cycle     Times of iterative process to ensure the robustness of models. Default is 3.  
  --evalue    Report sequences <= this evalue threshold in hmmsearch output. Default is 1e-65.  
  --database  Database for hmmsearch.  
  --cpu       Number of parallel CPU workers to use hmmsearch for multithreads. Default is 1.  
  --help      Show this help message.
### Output file

## 2.Phylogenetic_tree_build.sh
### Software
Clustal Omega  
trimAl  
IQ-TREE
### Input file
A fasta file including the sequences for phylogenetic analysis
### Usage
bash 2.Phylogenetic_tree_build.sh [--gene name]  [--thread value] 
  
Options:  
  --gene      Name of gene family.  
  --thread    Number of cores/threads for iqtree. Default is 1.  
  --help      Show this help message.
### Output file
## 3.SBA_priduction_gene_identification.sh
### Software
BLAST
### Input file
1. A fasta file including protein sequences of targted the gene family 
2. A fasta file including sequences for identification
### Usage
bash 3.SBA_priduction_gene_identification.sh [--gene name] [--query_type nucl/prot] [--query file_name]  [--evalue value] [--thread value]  
  --gene        Name of gene family.  
  --query_type  Molecule type of queries ('nucl' or 'prot').  
  --query       File name of queries.  
  --evalue      Expectation Evalue threshold for saving hits. Default is 1e-50.  
  --thread      Number of threads (CPUs) to use in the BLAST search. Default is 1.  
  --help        Show this help message.
### Output file
