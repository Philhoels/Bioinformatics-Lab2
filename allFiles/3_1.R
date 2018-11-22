# QUESTION 3.1 #

# Phylogenetic trees were created by using Clustal Omega as software for allignment 
# and downloaded as .txt file in git repository. Then with function "create_phylotree" tree is saved as .png file
# The .png files can be included into the report 

library(seqinr)
library(DECIPHER)
library(plsgenomics)
library(ape)

create_phylotree = function(dataset_name) {
  tree = read.tree(paste("phylotree_", dataset_name, ".txt", sep = ""))
  png(paste("phylotree_", dataset_name, ".png", sep=""))
  plot(tree)
  dev.off()
}

create_phylotree("lizards_sequences")
create_phylotree("artificial_dataset_1_1")
create_phylotree("artificial_dataset_1_2")







# Into the report has to be included:
# .png files, answer to 'Are the two based on the simulated data similar to expected?', 