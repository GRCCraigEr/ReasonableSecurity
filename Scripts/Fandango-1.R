
library(tm)
setwd("../FTC-Text")

# pdf reader manually used to convert to plain text 

Fandango <- VCorpus(DirSource("Fandango"),
 readerControl = list(reader = readPlain,
 language = "en",
 load = TRUE)
 )

cleanFandango  <- tm_map(Fandango, content_transformer(removeNumbers))
cleanFandango  <- tm_map(cleanFandango, content_transformer(removePunctuation))
cleanFandango  <- tm_map(cleanFandango, content_transformer(tolower))

dtm <- DocumentTermMatrix(cleanFandango)

dtmOutput <- inspect(dtm)
write.csv(dtmOutput, file = "Fandango-dtmOutput.csv")

dtmFTOutput <- findFreqTerms(dtm, 40)
write.csv(dtmFTOutput, file = "Fandango-dtmFTOutput.csv")

dtmDictOutput <- inspect(DocumentTermMatrix(cleanFandango, list(
 dictionary = c("reasonable", "security", "risk", "harm", "data", "environment", "protect", "systems", "information")
 )))

write.csv(dtmDictOutput, file = "Fandango-dtmDictOutput.csv")

tdm <- TermDocumentMatrix(cleanFandango)

a1 <- findAssocs(tdm, "reasonable", 0.86)
write.csv(a1, file = "Fandango-Reasonable.csv")

a2 <- findAssocs(tdm, "security", 0.86)
write.csv(a2, file = "Fandango-Security.csv")

a3 <- findAssocs(tdm, "risk", 0.98)
write.csv(a3, file = "Fandango-Risk.csv")

a4 <- findAssocs(tdm, "harm", 0.98)
write.csv(a4, file = "Fandango-Harm.csv")

a5 <- findAssocs(tdm, "data", 0.98)
write.csv(a5, file = "Fandango-Data.csv")

a6 <- findAssocs(tdm, "environment", 0.10)
# none

a7 <- findAssocs(tdm, "systems", 0.96)
write.csv(a7, file = "Fandango-Systems.csv")

a8 <- findAssocs(tdm, "protect", 0.88)
write.csv(a8, file = "Fandango-Protect.csv")

a9 <- findAssocs(tdm, "information", 0.86)
write.csv(a9, file = "Fandango-Information.csv")
