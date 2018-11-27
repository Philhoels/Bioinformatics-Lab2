library(phangorn)
compare_phylotrees = function(phylotree1, phylotree2) {
  if(all(phylotree1$tip.label == phylotree2$tip.label)) {
    comparePhylo(phylotree1, phylotree2)
    treedist(phylotree1, phylotree2)
  } else {
    comparePhylo(phylotree1, phylotree2)
  }
}
# Comparing tree_lizards_sequences & tree_artificial_dataset_1_1
compare_phylotrees(tree_lizards_sequences, tree_artificial_dataset_1_1)
# Comparing tree_lizards_sequences & tree_artificial_dataset_1_2
compare_phylotrees(tree_lizards_sequences, tree_artificial_dataset_1_2)
# Comparing tree_artificial_dataset_1_1 & tree_artificial_dataset_1_2
compare_phylotrees(tree_artificial_dataset_1_1, tree_artificial_dataset_1_2)