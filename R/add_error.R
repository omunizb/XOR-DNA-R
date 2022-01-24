#' Add error to sequence
#'
#' Simulate errors that happen in the DNA-based data storage process.
#'
#' @param dna A character vector representing a DNA sequence, where each element
#'   is a single DNA nucleotide.
#' @param error The desired error rate
#'
#' @return A DNA sequence string potentially containing errors at some
#'   positions.
#' @export
#'
#' @examples
#' DNAseq <- c("C", "G", "T", "G", "T", "A", "G", "A", "A", "T", "G", "T", "C")
#' add_error(DNAseq, 0.05)
add_error <- function(dna, error) {
  num_errors <- round(stats::rnorm(1, (error/0.75)*length(dna)), 0)
  num_errors <- ifelse(num_errors > 0, num_errors, 0)
  num_errors <- ifelse(num_errors < length(dna), num_errors, length(dna))

  bases <- c("A", "C", "G", "T")

  error_pos <- sample(seq(1, length(dna), length.out = length(dna)), num_errors)

  for (i in error_pos) {
    dna[i] <- sample(bases, 1, replace = TRUE)
  }

  dna <- paste(dna, collapse = "")

  return(dna)
}
