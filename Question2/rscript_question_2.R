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