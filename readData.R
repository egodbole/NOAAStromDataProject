# Created: 2020-05-04

# loading relevant libraries
library(dplyr)

# this code downloads and reads the NOAA Sotrm data.
if(!file.exists("stormData.csv.bz2")) {
        url <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
        download.file(url, "stormData.csv.bz2")
}

stormData <- read.csv("stormData.csv.bz2")
stormData <- as_tibble(stormData)

if(!file.exists("stormDataDocumentation.pdf")) {
        url2 <- "https://d396qusza40orc.cloudfront.net/repdata%2Fpeer2_doc%2Fpd01016005curr.pdf"
        download.file(url2, "stormDataDocumentation.pdf")
}

date.accessed <- Sys.time()
print(date.accessed)