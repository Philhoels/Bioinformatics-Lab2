# QUESTION 2.3 #

library(seqinr)
library(DECIPHER)
library(plsgenomics)
library(ape)

# getting all datasets in DNAStringSet format
  # original dataset
  lizards_sequences = readDNAStringSet("lizard_seqs.fasta")
  # artificial_dataset_1_1
  artificial_dataset_1_1 = readDNAStringSet("artificial_dataset_1_1.fasta")
  # artificial_dataset_1_2
  artificial_dataset_1_2 = readDNAStringSet("artificial_dataset_1_2.fasta")
  
# alligning sequences for each dataset
sequence_alligning = function(dataset, name) {
  # alligning process
  sequences_alligned = AlignSeqs(dataset)
  # creating distance matrix
  dm_sequences_alligned = DistanceMatrix(sequences_alligned)
  saveRDS(dm_sequences_alligned, paste0("distanceMatrix_", name, ".RDS"))
  # creating matrix heatmap
  heatmap_dm_sequences_alligned = matrix.heatmap(dm_sequences_alligned)
  dev.copy(png,paste("heatmap_", name, ".png", sep=""))
  dev.off()
  return(sequences_alligned)
}

lizards_sequences_alligned = sequence_alligning(dataset = lizards_sequences, name = "lizards_sequences")
artificial_dataset_1_1_alligned = sequence_alligning(artificial_dataset_1_1, name = "artificial_dataset_1_1")
artificial_dataset_1_2_alligned = sequence_alligning(artificial_dataset_1_2, name = "artificial_dataset_1_2")

# results for report saved in repository as 
# heatmap_lizards_sequences, heatmap_artificial_dataset_1_1, heatmap_artificial_dataset_1_2
# also extracts from the alligments (just print output of the function) can be included into the report