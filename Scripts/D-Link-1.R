
library(tm)
setwd("../FTC-Text")

# pdf reader manually used to convert to plain text 

DLink <- VCorpus(DirSource("D-Link"),
 readerControl = list(reader = readPlain,
 language = "en",
 load = TRUE)
 )

cleanDLink  <- tm_map(DLink, content_transformer(removeNumbers))
cleanDLink  <- tm_map(cleanDLink, content_transformer(removePunctuation))
cleanDLink  <- tm_map(cleanDLink, content_transformer(tolower))

dtm <- DocumentTermMatrix(cleanDLink)

dtmOutput <- inspect(dtm)
write.csv(dtmOutput, file = "DLink-dtmOutput.csv")

dtmFTOutput <- findFreqTerms(dtm, 20)
write.csv(dtmFTOutput, file = "DLink-dtmFTOutput.csv")

dtmDictOutput <- inspect(DocumentTermMatrix(cleanDLink, list(
 dictionary = c("reasonable", "security", "risk", "harm", "data", "environment", "protect", "systems", "information")
 )))

write.csv(dtmDictOutput, file = "DLink-dtmDictOutput.csv")

tdm <- TermDocumentMatrix(cleanDLink)

a1 <- findAssocs(tdm, "reasonable", 0.10)
# none

a2 <- findAssocs(tdm, "security", 0.10)
# none

a3 <- findAssocs(tdm, "risk", 0.10)
# none

a4 <- findAssocs(tdm, "harm", 0.10)
# none

a5 <- findAssocs(tdm, "data", 0.10)
# none

a6 <- findAssocs(tdm, "environment", 0.10)
# none

a7 <- findAssocs(tdm, "systems", 0.10)
# none

a8 <- findAssocs(tdm, "protect", 0.10)
# none

a9 <- findAssocs(tdm, "information", 0.10)
# none
