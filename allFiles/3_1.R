# QUESTION 3.1 #
library(seqinr)
library(DECIPHER)
library(plsgenomics)
library(ape)

# create phylotrees
create_phylotree = function(dataset_name) {
  distanceMatrix = readRDS(paste0("distanceMatrix_", dataset_name, ".RDS"))
  tree = nj(distanceMatrix)
  png(paste("phylotree_", dataset_name, ".png", sep=""))
  plot(tree)
  dev.off()
  return(tree)
}
tree_lizards_sequences = create_phylotree("lizards_sequences")
tree_artificial_dataset_1_1 = create_phylotree("artificial_dataset_1_1")
tree_artificial_dataset_1_2 = create_phylotree("artificial_dataset_1_2")



# bootstrap analysis for the tree_lizards_sequences (still has to be done for the other datasets)
bootstrapTree = boot.phylo(phy = tree_lizards_sequences,
                           x = as.matrix(lizards_sequences_alligned), # this has to be a matrix
                           FUN = function(uselessMatrix) {
                             t = lizards_sequences_alligned
                             root(nj(DistanceMatrix(t)),1) # matrix can not be used, DistanceMatrix function requires myXStringSet format
                           })
plot(tree_lizards_sequences)
nodelabels(bootstrapTree, cex=.6) # it is still wrong, because it gives back 100 for every node

# Into the report has to be included:
# .png files, answer to 'Are the two based on the simulated data similar to expected?', 