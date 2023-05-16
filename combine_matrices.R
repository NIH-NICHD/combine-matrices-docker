## Takes input as --m1="path/to/file1" --m2="path/to/file2"

#+ options, echo = F, results = 'hide', warning = F, error = F, message = F
options(stringsAsFactors = FALSE, width = 100)

#+ collect arguments, echo = F, results = 'hide', warning = F, error = F, message = F
args <- commandArgs(trailingOnly = TRUE)

print(args)

#args <- c("--m1=/sbgenomics/project-files/tumor-gene-counts-rsem-expected_count-collapsed.tsv","--m2=/sbgenomics/project-files/downsyndrome-gene-counts-rsem-expected_count-collapsed.tsv")

# Parse arguments (the expected form is --arg=value)
parseArgs <- function(x) strsplit(gsub("^--", "", x), "=")
argsDF <- as.data.frame(do.call("rbind", parseArgs(args)))
arg <- as.list(as.character(argsDF$V2))
names(arg) <- argsDF$V1

# For this we expect 3 inputs, matrix1, matrix2. We can require all 3 when wrapping, so we don't need to check for them here
library(tidyverse)

matrix1 <- data.frame(read.csv(arg$m1, sep="\t"))
matrix2 <- data.frame(read.csv(arg$m2, sep="\t"))
 
combined <- inner_join(matrix1, matrix2, by = "gene_id")

write.csv(combined, "/sbgenomics/output-files/combined_matrices.csv")

