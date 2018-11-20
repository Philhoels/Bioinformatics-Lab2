# Question 2
# 2.1 
#install.packages("stringr")
library(stringr)
string <- "acctgctcaactc"

taa_count <- c()
tag_count <- c()
tga_count <- c()

for (i in 1:33){
string <- sequences[[1]]
taa_count[i] <-str_count(string, pattern = "taa")
tag_count[i] <- str_count(string, pattern = "tag")
tga_count[i] <- str_count(string, pattern = "tga")
}


# 2.2 Markov chain
nucleotide <- c("a", "c", "g", "t")

trans_matrix <- matrix(0.25, ncol = 4, nrow = 4)
rownames(trans_matrix) <- c("a", "c", "g", "t")
colnames(trans_matrix) <- c("a", "c", "g", "t")
trans_matrix

#install.packages("markovchain")
library(markovchain)

sequenceMatr <- createSequenceMatrix(sequence, sanitize = FALSE)
sequences <- list(x = c("a", "b", "a"), y = c("b", "a", "b", "a", "c"))
mcFitMle <- markovchainFit(sequences, method = "mle")
mcFitMle
