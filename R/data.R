#' Example of binary encoding DNA
#'
#' A binary string that encodes a DNA sequence. In order to retrieve the DNA
#' sequence it contains, use the 'key' `example_codevect`:
#' `dna_to_quat(example_bin, example_codevect)`.
#'
#' @format A binary string containing 389 characters (0 or 1).
#' @source \url{https://doi.org/10.1049/iet-nbt.2020.0157}
"example_bin"

#' Correspondence between binary and quaternary DNA code
#'
#' A vector of length 4 with the correspondence binary-to-quaternary code. The
#' first element has the binary code corresponding to A, the second to C, third
#' to G, and fourth to T. In this example, it is "00", "01", "10" and "11",
#' respectively.
#'
#' @format A vector of length 4 with binary strings as elements.
#' @source \url{https://doi.org/10.1049/iet-nbt.2020.0157}
"example_codevect"
