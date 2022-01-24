
#' Get DNA sequence from binary string
#'
#' @param binary A binary code string (containing only '0's and '1's). It must
#'   contain an even number of characters.
#' @param codevect A vector of length 4 with the correspondence
#'   binary-to-quaternary code. The first element has the binary code
#'   corresponding to A, the second to C, third to G, and fourth to T.
#'
#' @return A DNA-sequence string
#' @export
#'
#' @examples
#' binary <- "0110111011001000001110110111111010111001110000101100101100111011"
#' bin_to_quat(binary, example_codevect)
#'
bin_to_quat <- function(binary, codevect) {
  sub_bin <- substring(binary, seq(1, nchar(binary), 2), seq(2, nchar(binary), 2))
  DNAseq <- ""

  for (i in 1:length(sub_bin)) {
    if (sub_bin[i] == codevect[1]) {
      DNAseq <- paste0(DNAseq, "A")
    }
    else if (sub_bin[i] == codevect[2]) {
      DNAseq <- paste0(DNAseq, "C")
    }
    else if (sub_bin[i] == codevect[3]) {
      DNAseq <- paste0(DNAseq, "G")
    }
    else if (sub_bin[i] == codevect[4]) {
      DNAseq <- paste0(DNAseq, "T")
    }
    else {
      stop("Input must be a string of binary code")
    }
  }

  return(DNAseq)
}
