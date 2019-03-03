#' Run cermine on a PdF.
#'
#' Reads a PDF and converts it's content to a Journal Article Tag Suite (JATS) xml file.
#'
#' @param path path to a directory containing PDF files
#'
#' @param outputs (optional) list of extraction
#' output(s); possible values:
#' "jats" (document metadata and content in NLM JATS format),
#' "text" (raw document text),
#' "zones" (text zones with their labels),
#' "trueviz" (geometric structure in TrueViz format),
#' "images" (images from the document);
#' default: "jats,images"
#'
#' @param exts (optional) comma-separated list of
#' extensions of the resulting files;
#' the list has to have the same length as output list;
#' default: "cermxml,images"
#'
#' @param override Boolean whether to override previous created files or not
#'
#' @param timeout (optional) approximate maximum allowed processing
#' time for a PDF file in seconds; by default, no timeout is used;
#' the value is approximate because in some cases,
#' the program might be allowed to slightly exceeded this time,
#' say by a second or two.
#'
#' @param configuration (optional) path to configuration properties file
#' see https://github.com/CeON/CERMINE
#' for description of available configuration properties
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
# library(devtools)
# document()

pdf_to_convert <-function(directory,outputs,exts,override,timeout,configuration)
{
  if(missing(override)) {override <- FALSE}
  cmd <- paste("java -cp cermine-impl-1.13-jar-with-dependencies.jar pl.edu.icm.cermine.ContentExtractor",
               if(override){c("-override")},
               c("-path"), directory,
               if(!missing(outputs)){paste(c("-outputs"),outputs)},
               if(!missing(exts)){paste(c("-exts"),exts)},
               if(!missing(timeout)){paste(c("-timeout"),timeout)},
               if(!missing(configuration)){paste(c("-configuration"),configuration)}

               )
  output <- try(system(cmd, intern = TRUE))
  cmd2 <- paste("ls ", theDir, "/*.cermxml", sep = "")
  cermxmlFile <- try(system(cmd2, intern = TRUE))
  return(cermxmlFile)
}
