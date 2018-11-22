install.packages("BiocManager")
BiocManager::install("msa")
library(msa)
library(seqinr)

# readAAStringSet-function needs path of fasta file as input. The original dataset needs to be prepared and saved 
# so that the fasta file does not inlcude whitespaces anymore.
  # reading original_dataset from fasta file 
  lizards_sequences = read.fasta("lizard_seqs.fasta")
  # preparing data in fasta file (dna sequences include emtpy spaces which will be removed)
  for (i in 1:length(lizards_sequences)) {
    lizards_sequences[[i]] = lizards_sequences[[i]][lizards_sequences[[i]] != " "]
  }
  # saving prepared fasta file
  ape::write.dna(lizards_sequences, file ="lizards_sequences_no_whitespaces.fasta", format = "fasta", colsep = "")
# use prepared fasta file in msa function
location_original_dataset = "lizards_sequences_no_whitespaces.fasta"
mySequences <- readAAStringSet(location_original_dataset)
msaResults = msa(mySequences)

