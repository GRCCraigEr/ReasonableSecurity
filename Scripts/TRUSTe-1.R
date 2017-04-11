
library(tm)
setwd("../FTC-Text")

# pdf reader manually used to convert to plain text 

TRUSTe <- VCorpus(DirSource("TRUSTe"),
 readerControl = list(reader = readPlain,
 language = "en",
 load = TRUE)
 )

cleanTRUSTe  <- tm_map(TRUSTe, content_transformer(removeNumbers))
cleanTRUSTe  <- tm_map(cleanTRUSTe, content_transformer(removePunctuation))
cleanTRUSTe  <- tm_map(cleanTRUSTe, content_transformer(tolower))

dtm <- DocumentTermMatrix(cleanTRUSTe)

dtmOutput <- inspect(dtm)
write.csv(dtmOutput, file = "TRUSTe-dtmOutput.csv")

dtmFTOutput <- findFreqTerms(dtm, 80)
write.csv(dtmFTOutput, file = "TRUSTe-dtmFTOutput.csv")

dtmDictOutput <- inspect(DocumentTermMatrix(cleanTRUSTe, list(
 dictionary = c("reasonable", "security", "risk", "harm", "data", "environment", "protect", "systems", "information")
 )))

write.csv(dtmDictOutput, file = "TRUSTe-dtmDictOutput.csv")


tdm <- TermDocumentMatrix(cleanTRUSTe)

a1 <- findAssocs(tdm, "reasonable", 0.98)
write.csv(a1, file = "TRUSTe-Reasonable.csv")

a2 <- findAssocs(tdm, "security", 0.94)
write.csv(a2, file = "TRUSTe-Security.csv")

a3 <- findAssocs(tdm, "risk", 0.98)
write.csv(a3, file = "TRUSTe-Risk.csv")

a4 <- findAssocs(tdm, "harm", 0.98)
write.csv(a4, file = "TRUSTe-Harm.csv")

a5 <- findAssocs(tdm, "data", 0.97)
write.csv(a5, file = "TRUSTe-Data.csv")

a6 <- findAssocs(tdm, "environment", 0.10)
# none

a7 <- findAssocs(tdm, "systems", 0.98)
write.csv(a7, file = "TRUSTe-Systems.csv")

a8 <- findAssocs(tdm, "protect", 0.97)
write.csv(a8, file = "TRUSTe-Protect.csv")

a9 <- findAssocs(tdm, "information", 0.98)
write.csv(a9, file = "TRUSTe-Information.csv")

