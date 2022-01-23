#' Transform DNA code to binary
#'
#' @param dna A character vector representing a DNA sequence, where each element
#'   is a single DNA nucleotide
#' @param codevect A vector of length 4 with the correspondence
#'   binary-to-quaternary code. The first element has the binary code
#'   corresponding to A, the second to C, third to G, and fourth to T.
#'
#' @return A character vector representing a binary sequence, where each element
#'   contains a binary code corresponding to a single DNA nucleotide.
#' @export
#'
#' @examples
#' DNAseq <- "CGTGTAGAATGTCTTGGTGCTAAGTAGTATGT"
#' v <- c("00", "01", "10", "11")
#' dna_to_bin(DNAseq, v)
dna_to_bin <- function(dna, codevect) {
  bin <- vector(mode = "numeric", length = length(dna))
  for (i in 1:length(dna)) {
    if (dna[i] %in% "A") {
      bin[i] <- as.numeric(codevect[1])
    }
    else if (dna[i] %in% "C") {
      bin[i] <- as.numeric(codevect[2])
    }
    else if (dna[i] %in% "G") {
      bin[i] <- as.numeric(codevect[3])
    }
    else {
      bin[i] <- as.numeric(codevect[4])
    }
  }
  return(bin)
}
