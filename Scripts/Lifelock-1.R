
library(tm)
setwd("../FTC-Text")

# pdf reader manually used to convert to plain text 

lifeLock <- VCorpus(DirSource("LifeLock"),
 readerControl = list(reader = readPlain,
 language = "en",
 load = TRUE)
 )

cleanlifeLock  <- tm_map(lifeLock, content_transformer(removeNumbers))
cleanlifeLock  <- tm_map(cleanlifeLock, content_transformer(removePunctuation))
cleanlifeLock  <- tm_map(cleanlifeLock, content_transformer(tolower))

dtm <- DocumentTermMatrix(cleanlifeLock)

dtmOutput <- inspect(dtm)
write.csv(dtmOutput, file = "lifeLock-dtmOutput.csv")

dtmFTOutput <- findFreqTerms(dtm, 150)
write.csv(dtmFTOutput, file = "lifeLock-dtmFTOutput.csv")

dtmDictOutput <- inspect(DocumentTermMatrix(cleanlifeLock, list(
 dictionary = c("reasonable", "security", "risk", "harm", "data", "environment", "protect", "systems", "information")
 )))

write.csv(dtmDictOutput, file = "lifeLock-dtmDictOutput.csv")


tdm <- TermDocumentMatrix(cleanlifeLock)

a1 <- findAssocs(tdm, "reasonable", 0.94)
write.csv(a1, file = "lifeLock-Reasonable.csv")

a2 <- findAssocs(tdm, "security", 0.89)
write.csv(a2, file = "lifeLock-Security.csv")

a3 <- findAssocs(tdm, "risk", 0.94)
write.csv(a3, file = "lifeLock-Risk.csv")

a4 <- findAssocs(tdm, "harm", 0.94)
write.csv(a4, file = "lifeLock-Harm.csv")

a5 <- findAssocs(tdm, "data", 0.94)
write.csv(a5, file = "lifeLock-Data.csv")

a6 <- findAssocs(tdm, "environment", 0.10)
# none

a7 <- findAssocs(tdm, "systems", 0.94)
write.csv(a7, file = "lifeLock-Systems.csv")

a8 <- findAssocs(tdm, "protect", 0.94)
write.csv(a8, file = "lifeLock-Protect.csv")

a9 <- findAssocs(tdm, "information", 0.94)
write.csv(a9, file = "lifeLock-Information.csv")
