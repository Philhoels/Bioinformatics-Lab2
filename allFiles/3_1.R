# QUESTION 3.1 #

# Phylogenetic trees were created by using Clustal Omega as software for allignment 
# and downloaded as .txt file in git repository

create_phylotree = function(dataset_name) {
  tree = read.tree(paste("phylotree_", dataset_name, ".txt", sep = ""))
  png(paste("phylotree_", dataset_name, ".png", sep=""))
  plot(tree)
  #dev.copy(png,paste("phylotree_", dataset_name, ".png", sep=""))
  dev.off()
}

create_phylotree("lizards_sequences")
create_phylotree("artificial_dataset_1_1")
create_phylotree("artificial_dataset_1_2")