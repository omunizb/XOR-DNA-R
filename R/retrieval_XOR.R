#' Recover original DNA sequence from XOR fragments
#'
#' This function simulates the retrieval step posterior to the DNA sequencing of
#' the three fragments created during encoding. The consensus method presented
#' here is not optimal for error correction; the best approach is not detailed
#' by Sharma et al.
#'
#' @param infile The path of the FASTA file containing the sequences of the
#'   three DNA fragments obtained by XOR encoding.
#' @param codevect A vector of length 4 with the correspondence
#'   binary-to-quaternary code. The first element has the binary code
#'   corresponding to A, the second to C, third to G, and fourth to T.
#'
#' @export
retrieval_XOR <- function(infile, codevect) {
  frags_DNA <- Biostrings::readDNAStringSet(infile)

  fragment1 <- frags_DNA[[1]]
  fragment2 <- frags_DNA[[2]]
  fragment3 <- frags_DNA[[3]]

  # https://stackoverflow.com/a/32399977
  tensiSplit <- function(string, size) {
    stringr::str_extract_all(string, paste0('.{1,', size, '}'))
  }

  fragment1_split_3 <- unlist(tensiSplit(fragment1, 3))
  fragment1_split_1 <- unlist(tensiSplit(fragment1, 1))
  fragment2_split <- unlist(tensiSplit(fragment2, 1))
  fragment3_split <- unlist(tensiSplit(fragment3, 1))

  fragment1_bin <- dna_to_bin(fragment1_split_1, codevect)
  fragment2_bin <- dna_to_bin(fragment2_split, codevect)
  fragment3_bin <- dna_to_bin(fragment3_split, codevect)

  # temp2
  frag2_recov_bin <- bitwXor(fragment1_bin, fragment3_bin)
  frag2_recov <- bin_to_dna(frag2_recov_bin[seq(1, length(frag2_recov_bin), by = 3)],
                            codevect)

  # temp1
  fragment2_bin_trp <- rep(fragment2_bin, each = 3)
  frag3_recov_bin <- bitwXor(fragment1_bin, fragment2_bin_trp[1:length(fragment1_bin)])
  frag3_recov <- bin_to_dna(frag3_recov_bin[seq(1, length(frag3_recov_bin), by = 3)],
                            codevect)

  # recovering frag1
  frag1_recov_bin <- bitwXor(frag2_recov_bin, frag3_recov_bin)
  frag1_recov <- bin_to_dna(frag1_recov_bin, codevect)
  frag1_recov_split <- unlist(tensiSplit(paste(frag1_recov, collapse = ""), 3))

  # DNA1
  DNA1 <- vector(mode = "numeric",
                 length = length(fragment1_split_3))

  for (i in 1:length(fragment1_split_3)) {
    DNA1[i] <- paste0(frag2_recov[i], fragment1_split_3[i])
  }

  DNA1 <- paste(DNA1, collapse = "")
  print(paste("DNA1:", DNA1))

  # DNA2
  DNA2 <- vector(mode = "numeric",
                 length = length(fragment1_split_3))

  for (i in 1:length(fragment1_split_3)) {
    DNA2[i] <- paste0(fragment2_split[i], fragment1_split_3[i])
  }

  DNA2 <- paste(DNA2, collapse = "")
  print(paste("DNA2:", DNA2))

  # DNA3
  DNA3 <- vector(mode = "numeric",
                 length = length(frag1_recov_split))

  for (i in 1:length(frag1_recov_split)) {
    DNA3[i] <- paste0(fragment2_split[i], frag1_recov_split[i])
  }

  DNA3 <- paste(DNA3, collapse = "")
  print(paste("DNA3:", DNA3))

  # The following method by consensus is just an illustration; the actual
  # error-free method for recovering the original DNA from DNA1-3 is not
  # detailed by Sharma et al. so it is not reproduced here.

  DNA_recov <- Biostrings::consensusString(c(DNA1, DNA2, DNA3))

  print(paste("Recovered DNA (consensus):", DNA_recov))
}
