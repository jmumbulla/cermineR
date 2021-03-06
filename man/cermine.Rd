% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cermine.R
\name{cermine}
\alias{cermine}
\title{Converts a PDF to a JATS file.}
\usage{
cermine(path, outputs, exts, override, timeout, configuration)
}
\arguments{
\item{path}{path to a directory containing PDF files.}

\item{outputs}{(optional) list of extraction
output(s); possible values:
"jats" (document metadata and content in NLM JATS format),
"text" (raw document text),
"zones" (text zones with their labels),
"trueviz" (geometric structure in TrueViz format),
"images" (images from the document);
default: "jats,images".}

\item{exts}{(optional) a comma-separated list of
extensions of the resulting files;
the list has to have the same length as output list;
default: "cermxml,images".}

\item{override}{(optional) Boolean whether to override previous created files or not.
Default: FALSE}

\item{timeout}{(optional) approximate maximum allowed processing
time for a PDF file in seconds; by default, no timeout is used;
the value is approximate because in some cases,
the program might be allowed to slightly exceeded this time,
say by a second or two.}

\item{configuration}{(optional) path to configuration properties file
see https://github.com/CeON/CERMINE
for description of available configuration properties.}
}
\value{
A vector containing the file reference to the JATS xml file.
}
\description{
Reads a PDF and converts it's content to a Journal Article Tag Suite (JATS) xml file.
}
\examples{
cermine(c("~/pdfdir"))

# overwrite any existing converted JATS files.
cermine(c("~/pdfdir"),override=TRUE)

# convert pdfs in the directory ~/pdfdir, overwriting
# any existing files, outputs as text with the file extension txt.
cermine(c("~/pdfdir"),override=TRUE,outputs=c("text"),ext=c("txt"))

}
\author{
Jason Mumbulla, \email{jasonmumbulla@gmail.com}
}
