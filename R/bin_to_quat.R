
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
