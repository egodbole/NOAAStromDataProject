# Created: 2020-05-15

# question 2
#       Across the United States, which types of events have the greatest
#       economic consequences?

# variables considered
#       crop damage
#       property damage

# helpful functions
fixExp <- function(x){
        isK <- grepl("K", x)
        isM <- grepl("M", x)
        isB <- grepl("B", x)
        if(isK){
                3
        } else if(isM){
                6
        } else if(isB){
                9
        } else {0}
}

reqData <- data %>%
                select(evtype, propdmg, propdmgexp, cropdmg, cropdmgexp)

reqData$propdmgexp <- as.character(reqData$propdmgexp)
reqData$cropdmgexp <- as.character(reqData$cropdmgexp)
for(i in 1:length(reqData$propdmgexp)){
        reqData$propdmgexp[i] <- fixExp(reqData$propdmgexp[i])
        reqData$cropdmgexp[i] <- fixExp(reqData$cropdmgexp[i])
}

reqData$propdmgexp <- as.numeric(reqData$propdmgexp)
reqData$cropdmgexp <- as.numeric(reqData$cropdmgexp)

reqData <- reqData %>%
                mutate(crop=cropdmg*10^cropdmgexp, prop=propdmg*10^propdmgexp, total=crop + prop) %>%
                select(evtype, total) %>%
                group_by(evtype) %>%
                summarise(sum=sum(total))

reqData <- reqData[order(reqData$sum, decreasing=TRUE), ]

print(head(reqData))