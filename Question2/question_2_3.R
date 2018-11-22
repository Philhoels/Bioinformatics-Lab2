library(seqinr)
library(DECIPHER)
library(plsgenomics)

# getting all datasets

  # original dataset
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
    # reading prepared fasta file as biostrings-object
    lizards_sequences = readDNAStringSet("lizards_sequences_no_whitespaces.fasta")
    
  # artificial_dataset_1_1
  artificial_dataset_1_1 = read.fasta("artificial_dataset_1_1.fasta")
    
  # artificial_dataset_1_2
  artificial_dataset_1_2 = read.fasta("artificial_dataset_1_2.fasta")
  
# alligning sequences for each dataset
sequence_alligning = function(dataset, name) {
  # alligning process
  sequences_alligned = AlignSeqs(dataset)
  # creating distance matrix
  dm_sequences_alligned = DistanceMatrix(sequences_alligned)
  # creating matrix heatmap
  heatmap_dm_sequences_alligned = matrix.heatmap(dm_sequences_alligned)
  dev.copy(png,paste("heatmap_", name, ".png", sep=""))
  dev.off()
}

sequence_alligning(dataset = lizards_sequences, name = "lizards_sequences")
sequence_alligning(artificial_dataset_1_1, name = "artificial_dataset_1_1")
sequence_alligning(artificial_dataset_1_2, name = "artificial_dataset_1_2")




# clustal_results = read.alignment(file = "C:/Users/Lennart/Desktop/clustalo-I20181122-163820-0599-46068815-p2m.clustal_num",
#                format = "clustal")
