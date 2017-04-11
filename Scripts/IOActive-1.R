
library(tm)
setwd("../FTC-Text")

# pdf reader manually used to convert to plain text
 
IOActive <- VCorpus(DirSource("IOActive"),
 readerControl = list(reader = readPlain,
 language = "en",
 load = TRUE)
 )

cleanIOActive  <- tm_map(IOActive, content_transformer(removeNumbers))
cleanIOActive  <- tm_map(cleanIOActive, content_transformer(removePunctuation))
cleanIOActive  <- tm_map(cleanIOActive, content_transformer(tolower))

dtm <- DocumentTermMatrix(cleanIOActive)

dtmOutput <- inspect(dtm)
write.csv(dtmOutput, file = "IOActive-dtmOutput.csv")

dtmFTOutput <- findFreqTerms(dtm, 20)
write.csv(dtmFTOutput, file = "IOActive-dtmFTOutput.csv")

dtmDictOutput <- inspect(DocumentTermMatrix(cleanIOActive, list(
 dictionary = c("reasonable", "security", "risk", "harm", "data", "environment", "protect", "systems", "information")
 )))

write.csv(dtmDictOutput, file = "IOActive-dtmDictOutput.csv")

tdm <- TermDocumentMatrix(cleanIOActive)

a1 <- findAssocs(tdm, "reasonable", 0.10)
# none

a2 <- findAssocs(tdm, "security", 0.90)
write.csv(a2, file = "IOActive-Security.csv")

a3 <- findAssocs(tdm, "risk", 0.10)
# none

a4 <- findAssocs(tdm, "harm", 0.10)
# none

a5 <- findAssocs(tdm, "data", 0.96)
write.csv(a5, file = "IOActive-Data.csv")

a6 <- findAssocs(tdm, "environment", 0.10)
# none

a7 <- findAssocs(tdm, "systems", 0.10)
# none

a8 <- findAssocs(tdm, "protect", 0.10)
# none

a9 <- findAssocs(tdm, "information", 0.90)
write.csv(a9, file = "IOActive-information.csv")
