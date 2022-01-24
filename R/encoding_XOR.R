#' XOR encoding algorithm
#'
#' Simulating XOR encoding algorithm in DNA-based data storage process. The
#' process starts with data in binary to be stored into DNA. Using a 'key' that
#' provides the binary code that corresponds to each one of the four DNA
#' nucleotides, a DNA sequence is obtained, which is the synthesized. Using a
#' XOR algorithm (see [Sharma et al.
#' (2020)](https://doi.org/10.1049/iet-nbt.2020.0157)), the sequences are cut
#' into three fragments and then stored. During this process, some errors may occur that change some nucleotides in the fragments. Thanks to the XOR algorithm, the original DNA can be perfectly recovered despite these errors.
#'
#' The resulting three DNA fragments are
#' written to a FASTA file.
#'
#' @inheritParams bin_to_quat
#' @param outfile The path where the FASTA file with the fragments will be
#'   saved.
#'
#' @export
#'
#' @examples
#' encoding_XOR(example_bin, example_codevect, "../fragments.fa")
encoding_XOR <- function(binary, codevect, outfile) {
  if (nchar(binary) %% 2) {
    binary <- substr(binary, 1, nchar(binary) - 1)
  }

  pdf_print(paste("Binary source:", binary))

  sub_bin <- substring(binary, seq(1, nchar(binary), 2), seq(2, nchar(binary), 2))

  DNAseq <- bin_to_quat(binary, codevect)
  pdf_print(paste("DNA sequence:", DNAseq))

  DNA_split <- unlist(stringr::str_split(DNAseq, stringr::boundary("character")))

  fragment1 <- DNA_split[-seq(from = 1, to = length(DNA_split), by = 4)]
  fragment2 <- DNA_split[seq(from = 1, to = length(DNA_split), by = 4)]

  fragment1_bin <- dna_to_bin(fragment1, codevect)
  fragment2_bin <- dna_to_bin(fragment2, codevect)
  fragment3_bin <- vector(mode = "numeric", length = length(fragment1))

  j = 1
  for (i in seq(from = 0, to = length(fragment1)-1, by = 3)) {
    for (c in 1:3) {
      fragment3_bin[i+c] <- bitwXor(fragment1_bin[i+c], fragment2_bin[j])
    }
    j = j + 1
  }

  fragment3_bin <- fragment3_bin[!is.na(fragment3_bin)]

  fragment3 <- bin_to_dna(fragment3_bin, codevect)

  fragment1_err <- add_error(fragment1, 0.01)
  fragment2_err <- add_error(fragment2, 0.01)
  fragment3_err <- add_error(fragment3, 0.01)

  frags <- c(fragment1_err, fragment2_err, fragment3_err)
  frags_DNA <- Biostrings::DNAStringSet(x = frags)
  Biostrings::writeXStringSet(frags_DNA, outfile)
}
