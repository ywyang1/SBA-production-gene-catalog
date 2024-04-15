# Data
## Non-redundant protein sequences of the SBA production gene catalog
## Species distribution of the SBA production gene catalog.csv
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
*Gene*_hmmsearch_out.txt
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
*Gene*.phy.contree  
The consensus tree with assigned branch supports where branch lengths are optimized on the original alignment
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
*Gene*_blast_out.txt  
| Colume | Explaination |
|---------|---------|
|    1   | Query Accesion |
|    2   | Subject accession |
|    3   | Percentage of identical matches |  
|    4   | Alignment length |  
|    5   | Number of mismatches |  
|    6   | Number of gap openings |  
|    7   | Start of alignment in query |  
|    8   | End of alignment in query |  
|    9   | Start of alignment in subject |  
|    10  | End of alignment in subject |
|    11  | Expect value |  
|    12  | Bit score |
