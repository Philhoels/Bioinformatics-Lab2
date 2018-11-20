library(seqinr)
lizards_sequences = read.fasta("lizard_seqs.fasta")

# Question 1.1
get_artificial_sequence_dataset = function(lizards_sequences) {
  sequence_distributions = list()
  artificial_dna_sequences = list()
  for (i in 1:length(lizards_sequences)) {
    sequence_distributions[[i]] = seqinr::count(lizards_sequences[[i]],1)/length(lizards_sequences[[i]])
    artificial_dna_sequences[[i]] = sample(x = c("a","c","g","t"),
                                           size = length(lizards_sequences[[i]]),
                                           rep = TRUE,
                                           prob = sequence_distributions[[i]])
  }
  ape::write.dna(artificial_dataset, file ="artificial_dna_sequences.fasta", format = "fasta")
  return(artificial_dna_sequences)
}
artificial_dataset = get_artificial_sequence_dataset(lizards_sequences)
    
