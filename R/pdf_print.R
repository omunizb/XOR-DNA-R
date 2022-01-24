
#' Split strings for PDF
#'
#' Split long strings so that they do not surpass margins in R markdown PDF
#' output.
#'
#' @param x String to be split
#'
#' @export
pdf_print <- function(x) {
  print(substring(paste(x), seq(1, nchar(x), 75), seq(75, nchar(x)+74, 75)))
}
