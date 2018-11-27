# QUESTION 3.1
# Into the report has to be included:
# .png files, answer to 'Are the two based on the simulated data similar to expected?', 
library(seqinr)
library(DECIPHER)
library(plsgenomics)
library(ape)

# creating phylotrees
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

# performing bootstrap analysis
bootstrap_analysis = function(dataset_name, tree_object) {
  distanceMatrix = readRDS(paste0("distanceMatrix_", dataset_name, ".RDS"))
  bootstrap_result = boot.phylo(phy = tree_object,
                                x = distanceMatrix,
                                FUN = function(x) {
                                  nj(x)
                                })
  png(paste("bootstrap_phylotree_", dataset_name, ".png", sep=""))
  plot(tree_object)
  nodelabels(bootstrap_result, cex=.6)
  dev.off()
}
bootstrap_analysis("lizards_sequences", tree_lizards_sequences)
bootstrap_analysis("artificial_dataset_1_1", tree_artificial_dataset_1_1)
bootstrap_analysis("artificial_dataset_1_2", tree_artificial_dataset_1_2)


# alternative way of Marie with results which are also not that promising

# library(msa)
# install.packages("phangorn")
# library(phangorn)
# original = readDNAStringSet("lizards_sequences_no_whitespaces.fasta")
# aligned = msa(original)
# alignedConverted = msaConvert(aligned, "seqinr::alignment")
# dist = as.matrix(dist.alignment(alignedConverted))
# tree = upgma(dist)
# 
# bootstrapTree = boot.phylo(phy = tree,
#                            x = dist,
#                            FUN = function(x) {
#                              upgma(x)
#                            })
# 
# plot(tree)
# nodelabels(bootstrapTree, cex=.6) 
