# Script from Thijs
#install.packages("ape")
library(ape)
#install.packages("seqinr")
library(seqinr)
getwd()
lizards_sequences <- read.fasta("lizard_seqs.fasta")

tree <- rtree(n = 33)
plot(tree, edge.width = 2)


#install.packages("phangorn")
library(phangorn)
transition_matrix <- matrix(0.25, ncol = 4, nrow = 4)
rownames(transition_matrix) <- c("a", "c", "t", "g")
colnames(transition_matrix) <- c("a", "c", "t", "g")
transition_matrix
lengths <- c()

for (i in 1:33){
lengths <- c(lengths, length(lizards_sequences[[i]]))
}

lengths
sequences_artificial <- list()

for (j in 1:33){
sequences_artificial[j] <- simSeq(tree, l = lengths[j], Q=transition_matrix , type = "DNA")
}

abc <- simSeq(tree, l = 100, Q=transition_matrix , type = "DNA")

