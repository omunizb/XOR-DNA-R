#' Transform binary code to DNA
#'
#' @param bin A character vector representing a binary sequence, where each
#'   element contains a binary code corresponding to a single DNA nucleotide.
#' @param codevect A vector of length 4 with the correspondence
#'   binary-to-quaternary code. The first element has the binary code
#'   corresponding to A, the second to C, third to G, and fourth to T.
#'
#' @return A character vector representing a DNA sequence, where each element is
#'   a single DNA nucleotide.
#' @export
#'
#' @examples
#' binseq <- c(1, 10, 11, 10, 11, 0, 10, 0, 0, 11, 10, 11, 1, 11, 11, 10, 10)
#' bin_to_dna(binseq, example_codevect)
bin_to_dna <- function(bin, codevect) {
  dna <- vector(mode = "character", length = length(bin))
  for (i in 1:(length(bin))) {
    if (bin[i] == as.numeric(codevect[1])) {
      dna[i] <- "A"
    }
    else if (bin[i] == as.numeric(codevect[2])) {
      dna[i] <- "C"
    }
    else if (bin[i] == as.numeric(codevect[3])) {
      dna[i] <- "G"
    }
    else {
      dna[i] <- "T"
    }
  }
  return(dna)
}
