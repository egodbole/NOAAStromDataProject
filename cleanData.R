# Created: 2020-05-14

# for cleaning data

evtype <- tolower(as.character(data$evtype))

# COASTAL FLOOD
isCoast <- grepl("^c", evtype)
isFlood <- grepl("flood", evtype)
evtype[isCoast & isFlood] <-  "coastal flood"
# JUST FLOOD
isLake <- grepl("lake", evtype)
isFlash <- grepl("flash", evtype)
evtype[isFlood & !(isCoast | isFlash | isLake)] <- "flood"


# COLD/WIND CHILL
isCold <- grepl("cold", evtype)
isExtreme <- grepl("extreme", evtype)
evtype[isCold & !isExtreme] <- "cold/wind chill"
# EXTREME COLD/WIND CHILL
evtype[isCold & isExtreme] <- "extreme cold/wind chill"

# DROUGHT
isDrought <- grepl("drought", evtype)
evtype[isDrought] <- "drought"

# DUST DEVIL
isDust <- grepl("dust", evtype)
isStorm <- grepl("storm", evtype)
evtype[isDust & !isStorm] <- "dust devil"

# FREEZING FOG
isFreeze <- grepl("freez", evtype)
isFog <- grepl("fog", evtype)
evtype[isFreeze & isFog] <- "freezing fog"
# DENSE FOG
evtype[isFog & !isFreeze] <- "dense fog"

# FROST/FREEZE
isFrost <- grepl("frost", evtype)
evtype[(isFreeze & !isFog) | isFrost] <- "frost/freeze"

# FUNNEL CLOUD
isFunnel <- grepl("funnel", evtype)
evtype[isFunnel] <- "funnel cloud"

# HAIL
isMarine <- grepl("marine", evtype)
isHail <- grepl("hail", evtype)
evtype[isHail & !isMarine] <- "hail"

# HEAT
isExcessive <- grepl("excess", evtype)
isHeat <- grepl("heat", evtype)
evtype[isHeat & !isExcessive] <-"heat"

# HIGH SURF
isSurf <- grepl("surf", evtype)
evtype[isSurf] <- "high surf"

# TSTM --> THUNDERSTORM
evtype <- sub("tstm", "thunderstorm", evtype)

# STORM TIDE
isTide <- grepl("tide|surge", evtype)
evtype[isStorm & isTide] <- "storm tide"

# WINTER WEATHER
isWeather <- grepl("weath", evtype)
evtype[isWeather] <- "winter weather"

# VOLCANIC ASH
isVolcano <- grepl("volc", evtype)
evtype[isVolcano] <- "volcanic ash"

writeLines(as.character(unique(evtype)), con=file("evtype_names.txt"))
fctr <- as.factor(evtype)