
library(tm)
setwd("../FTC-Text")

# pdf reader manually used to convert to plain text 

Guidance <- VCorpus(DirSource("Guidance"),
 readerControl = list(reader = readPlain,
 language = "en",
 load = TRUE)
 )

cleanGuidance  <- tm_map(Guidance, content_transformer(removeNumbers))
cleanGuidance  <- tm_map(cleanGuidance, content_transformer(removePunctuation))
cleanGuidance  <- tm_map(cleanGuidance, content_transformer(tolower))

dtm <- DocumentTermMatrix(cleanGuidance)

dtmOutput <- inspect(dtm)
write.csv(dtmOutput, file = "Guidance-dtmOutput.csv")

dtmFTOutput <- findFreqTerms(dtm, 30)
write.csv(dtmFTOutput, file = "Guidance-dtmFTOutput.csv")

dtmDictOutput <- inspect(DocumentTermMatrix(cleanGuidance, list(
 dictionary = c("reasonable", "security", "risk", "harm", "data", "environment", "protect", "systems", "information")
 )))

write.csv(dtmDictOutput, file = "Guidance-dtmDictOutput.csv")

tdm <- TermDocumentMatrix(cleanGuidance)

a1 <- findAssocs(tdm, "reasonable", 0.90)
write.csv(a1, file = "Guidance-Reasonable.csv")

a2 <- findAssocs(tdm, "security", 0.90)
write.csv(a2, file = "Guidance-Security.csv")

a3 <- findAssocs(tdm, "risk", 0.92)
write.csv(a3, file = "Guidance-Risk.csv")

a4 <- findAssocs(tdm, "harm", 0.10)
# none

a5 <- findAssocs(tdm, "data", 0.96)
write.csv(a5, file = "Guidance-Data.csv")

a6 <- findAssocs(tdm, "environment", 0.10)
# none

a7 <- findAssocs(tdm, "systems", 0.96)
write.csv(a7, file = "Guidance-Systems.csv")

a8 <- findAssocs(tdm, "protect", 0.97)
write.csv(a8, file = "Guidance-Protect.csv")

a9 <- findAssocs(tdm, "information", 0.98)
write.csv(a9, file = "Guidance-Information.csv")
