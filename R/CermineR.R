library(xml2)

source("R/runCermine.R")

theDir <- c("/Users/jason/readpdf")
cmd <- paste("ls ", theDir, "/*.pdf", sep = "")
pdfs <- try(system(cmd, intern = TRUE))

# override<-TRUE
# outputs <- c("jats,images")

files <- pdf_to_convert(c("/Users/jason/readpdf"))

xmlfiles <-  lapply(files, read_xml)

