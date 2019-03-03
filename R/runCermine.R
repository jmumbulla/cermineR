#' Run cermine on a PdF.
#'
#' Reads a PDF and converts it's content to a Journal Article Tag Suite (JATS) xml file.
#'
#' @param directory a directory containing the the PDF to convert.
#'
#' @return A vector containing the file reference to the JATS xml file.
#'
#' @author Jason Mumbulla, \email{jasonmumbulla@@gmail.com}
#'
#' @examples
#'
#' RunCermine(directory)
#'
#' @export
#'
pdf_to_convert <-function(directory)
{
  cmd <- paste("java -cp cermine-impl-1.13-jar-with-dependencies.jar pl.edu.icm.cermine.ContentExtractor -path", directory)
  output <- try(system(cmd, intern = TRUE))
  return(output)
}
