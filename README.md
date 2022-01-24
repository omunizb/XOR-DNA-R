
# dnasim

<!-- badges: start -->
<!-- badges: end -->

A XOR encoding algorithm in R, based on [Sharma et
al. (2020)](https://doi.org/10.1049/iet-nbt.2020.0157).

## Installation

You can install the development version of dnasim from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("omunizb/dnasim")
```

## Encoding of data to DNA and its retrieval

The functions `encoding_XOR()` and `retrieval_XOR()` can be used to
simulate the DNA-based data storage process using the XOR algorithm as a
method for error correction:

``` r
library(dnasim)
encoding_XOR(example_bin, example_codevect, "../fragments.fa")
#> [1] "Binary source: 011011101100100000111011011111101011100111000010110010110011"
#> [2] "101101001100000111100101111010111000000100000000111100000001011000110001000"
#> [3] "100100111010101100111110011100100101110000110010010001111000010011010000000"
#> [4] "001101110111010001000000101000010111111010011011101001110111000010001011101"
#> [5] "100110110110010110010000010100111011010111111111111101101011101110010000001"
#> [6] "0001000011110100110100010011"                                               
#> [1] "DNA sequence: CGTGTAGAATGTCTTGGTGCTAAGTAGTATGTCATAACTGCCTGGTGAACAAAATTAAACC"
#> [2] "GATACACAGCTCCCGCTTATGCAGTGACGCAGATTAAGCGGAAAATCTCTCACAAAGGACCTTGGCGTGGCTCTA"
#> [3] "AGAGTGTATCGTAGTAGAAGGCTCGGTTTTTTGTCCTCTAGAACACAATTCATCACAT"
retrieval_XOR("../fragments.fa", example_codevect)
#> [1] "DNA1: CGTGTAGAATGTCTTGGTGCTAAGTAGTATGTCATAACTGCCTGGTGAACAAAATTAAATCGCTACACA"
#> [2] "GCTACCGCTTATGAAGTGACGCAGATTAAGCGGAAAATCTCTCACAAAGGACCTTCGCGTGGCTCTAAGAGTGTA"
#> [3] "TCTTAGTAGAAGGCTCGGTTTTTTGTCCTCTAGAACACAATTCATCACAT"                         
#> [1] "DNA2: CGTGTAGAATGTCTTGGTGCTAAGTAGTATGTCATAACTGCCTGGTGAACAAAATTAAATCGCTACACA"
#> [2] "GCTCCCGCTTATGAAGTGACGCAGATTAAGCGGAAAATCTCTCACAAAGGACCTTGGCGTGGCTCTAAGAGTGTA"
#> [3] "TCTTAGTAGAAGGCTCGGTTTTTTGTCCTCTAGAACACAATTCATCACAT"                         
#> [1] "DNA3: CGTGTAGAATGTCTTGGTGCTAAGTAGTATGTCATAACTGCCTGGTGAACAAAATTAAACCGATACACA"
#> [2] "GCTCACGCTTATGCAGTGACGCAGATTAAGCGGAAAATCTCTCACAAAGGACCTTGCCGTGGCTCTAAGCGTGTA"
#> [3] "TCGTAGTAGAAGGCTCGGTTTTTTGTCCTCTAGAACACAATTAATCACAT"                         
#> [1] "Consensus sequence: CGTGTAGAATGTCTTGGTGCTAAGTAGTATGTCATAACTGCCTGGTGAACAAAAT"
#> [2] "TAAATCGCTACACAGCTCCCGCTTATGAAGTGACGCAGATTAAGCGGAAAATCTCTCACAAAGGACCTTGGCGTG"
#> [3] "GCTCTAAGAGTGTATCTTAGTAGAAGGCTCGGTTTTTTGTCCTCTAGAACACAATTCATCACAT"
```

Other functions from `dnasim` that may prove useful outside of this
specific application are `pdf_print()` and `add_error()`. The first is
useful to split long strings so that they do not surpass the margins of
PDF output files such as R Markdown knit, whereas the second simulates
errors in DNA, changing some of its nucleotides using a user-provided
error rate.

``` r
DNAseq <- c("C", "G", "T", "G", "T", "A", "G", "A", "A", "T", "G", "T", "C")
add_error(DNAseq, 0.05)
#> [1] "CGTGTAGAATGTC"
```

Other functions proveded in the package encable the conversion from
binary to quaternary DNA code, and vice versa.
