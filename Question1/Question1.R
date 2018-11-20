library(seqinr)

# data preparation (dna sequences include emtpy spaces which will be removed)
# for (i in 1:length(lizards_sequences)) {
#   lizards_sequences[[i]] = lizards_sequences[[i]][lizards_sequences[[i]] != " "]
# }
# ape::write.dna(lizards_sequences, file ="lizard_seqs.fasta", format = "fasta")

# reading fasta file 
lizards_sequences = read.fasta("lizard_seqs.fasta")

# Question 1.1
get_artificial_sequence_dataset = function(original_dataset) {
  # creating empty varibales which will be filled in following for loop
  original_sequence_distributions = list()
  artificial_dataset = list()
  artificial_sequence_distributions = list()
  a_original = c()
  c_original = c()
  g_original = c()
  t_original = c()
  a_artificial = c()
  c_artificial = c()
  g_artificial = c()
  t_artificial = c()
  for (i in 1:length(original_dataset)) {
    # getting original sequence distribution for each list element
    original_sequence_distributions[[i]] = seqinr::count(original_dataset[[i]],1)/length(original_dataset[[i]])
    # creating artificial dna sequences 
    artificial_dataset[[i]] = sample(x = c("a","c","g","t"),
                                           size = length(original_dataset[[i]]),
                                           rep = TRUE,
                                           prob = original_sequence_distributions[[i]])
    # creating data.frame to compare nucleotide distributions between original and artificial sequences 
    artificial_sequence_distributions[[i]] = seqinr::count(artificial_dataset[[i]],1)/length(artificial_dataset[[i]])
    a_original = c(a_original, original_sequence_distributions[[i]][1])
    a_artificial = c(a_artificial, artificial_sequence_distributions[[i]][1])
    c_original = c(c_original, original_sequence_distributions[[i]][2])
    c_artificial = c(c_artificial, artificial_sequence_distributions[[i]][2])
    g_original = c(g_original, original_sequence_distributions[[i]][3])
    g_artificial = c(g_artificial, artificial_sequence_distributions[[i]][3])
    t_original = c(t_original, original_sequence_distributions[[i]][4])
    t_artificial = c(t_artificial, artificial_sequence_distributions[[i]][4])
    comparison_sequence_distributions = cbind(
      a_original, a_artificial, c_original, c_artificial, g_original, g_artificial, t_original, t_artificial
    )
  }
  comparison_sequence_distributions = round(comparison_sequence_distributions, 2)
  rownames(comparison_sequence_distributions) = names(lizards_sequences)
  print("comparison of sequence distributions between original and artificial datasets:\n")
  print(comparison_sequence_distributions)
  # saving fasta file
  ape::write.dna(artificial_dataset, file ="artificial_dataset.fasta", format = "fasta")
  # returning artificial dna sequences
  return(artificial_dataset)
}
artificial_sequences = get_artificial_sequence_dataset(lizards_sequences)

