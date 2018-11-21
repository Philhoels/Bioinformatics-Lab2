library(ape)
library(seqinr)

# reading original_dataset from fasta file 
lizards_sequences = read.fasta("lizard_seqs.fasta")

# preparing data in fasta file (dna sequences include emtpy spaces which will be removed)
for (i in 1:length(lizards_sequences)) {
  lizards_sequences[[i]] = lizards_sequences[[i]][lizards_sequences[[i]] != " "]
}

tree <- rtree(n = length(lizards_sequences))
plot(tree, edge.width = 2)

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

for (k in 1:33){
sequences_artificial[[k]][sequences_artificial[[k]] == 1] = "a"
sequences_artificial[[k]][sequences_artificial[[k]] == "2"] = "c"
sequences_artificial[[k]][sequences_artificial[[k]] == "3"] = "g"
sequences_artificial[[k]][sequences_artificial[[k]] == "4"] = "t"
}

  
ape::write.dna(sequences_artificial, file ="artificial_dataset_1_2.fasta", format = "fasta", append =FALSE, nbcol = 6, colsep = " ", colw = 10)


