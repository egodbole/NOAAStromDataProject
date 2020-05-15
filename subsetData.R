# Created: 2020-05-14

# loading relevant libraries
library(dplyr)
library(lubridate)

# converting names to lowercase
names(stormData) <- tolower(names(stormData))

# subsetting data 2006 onwards
isSelected <- year(mdy_hms(stormData$bgn_date)) > 2005

data <- stormData[isSelected, ]