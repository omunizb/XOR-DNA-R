
pdf_print <- function(x) {
  substring(paste(x), seq(1, nchar(x), 75), seq(75, nchar(x)+74, 75))
}
