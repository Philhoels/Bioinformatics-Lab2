library(ape)
library(seqinr)
library(phangorn)

# reading original_dataset from fasta file 
lizards_sequences = read.fasta("lizard_seqs.fasta")

tree <- rtree(n = length(lizards_sequences))
plot(tree, edge.width = 2)

transition_matrix <- matrix(0.25, ncol = 4, nrow = 4)
rownames(transition_matrix) <- c("a", "c", "t", "g")
colnames(transition_matrix) <- c("a", "c", "t", "g")
transition_matrix

# calculating average length of original sequences
avg_length = c()
for (seq in 1:33) {
  avg_length = c(avg_length, length(lizards_sequences[[seq]]))
}
avg_length = mean(avg_length)

# creating artificial sequences
sequences_artificial <- simSeq(tree, l = avg_length, Q=transition_matrix , type = "DNA")

for (k in 1:33){
sequences_artificial[[k]][sequences_artificial[[k]] == 1] = "a"
sequences_artificial[[k]][sequences_artificial[[k]] == "2"] = "c"
sequences_artificial[[k]][sequences_artificial[[k]] == "3"] = "g"
sequences_artificial[[k]][sequences_artificial[[k]] == "4"] = "t"
}

ape::write.dna(sequences_artificial, file ="artificial_dataset_1_2.fasta", format = "fasta", colsep = "")


