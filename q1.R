# Created: 2020-05-15

# question 1
#       Across the United States, which types of events (as indicated in the
#       EVTYPE are most harmful with respect to population health?

# variables considered:
#       fatalities
#       injuries

# libraries
library(dplyr)
library(ggplot2)

reqData <- data %>%
                select(evtype, injuries, fatalities) %>%
                mutate(total = injuries + fatalities) %>%
                select(evtype, total) %>%
                group_by(evtype) %>%
                summarise(sum=sum(total))

reqData <- reqData[order(reqData$sum, decreasing=TRUE), ]

# barplot visualisation
par(mar=c(12, 4, 2, 1))
barplot(reqData$sum, names.arg=reqData$evtype, las=2, cex.names=0.7,
        ylab="Injuries and Fatalities",
        main="Effect of Weather Events on Population Health")

print(head(reqData))