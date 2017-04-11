
library(tm)
setwd("../FTC-Text")

# pdf reader manually used to convert to plain text 

wyndham <- VCorpus(DirSource("wyndham"),
 readerControl = list(reader = readPlain,
 language = "en",
 load = TRUE)
 )

cleanWyndham  <- tm_map(wyndham, content_transformer(removeNumbers))
cleanWyndham  <- tm_map(cleanWyndham, content_transformer(removePunctuation))
cleanWyndham  <- tm_map(cleanWyndham, content_transformer(tolower))

dtm <- DocumentTermMatrix(cleanWyndham)

dtmOutput <- inspect(dtm)
write.csv(dtmOutput, file = "Wyndham-dtmOutput.csv")

dtmFTOutput <- findFreqTerms(dtm, 150)
write.csv(dtmFTOutput, file = "Wyndham-dtmFTOutput.csv")

dtmDictOutput <- inspect(DocumentTermMatrix(cleanWyndham, list(
 dictionary = c("reasonable", "security", "risk", "harm", "data", "environment", "protect", "systems", "information")
 )))

write.csv(dtmDictOutput, file = "Wyndham-dtmDictOutput.csv")

tdm <- TermDocumentMatrix(cleanWyndham)

a1 <- findAssocs(tdm, "reasonable", 0.94)
write.csv(a1, file = "Wyndham-Reasonable.csv")

a2 <- findAssocs(tdm, "security", 0.70)
write.csv(a2, file = "Wyndham-Security.csv")

a3 <- findAssocs(tdm, "risk", 0.94)
write.csv(a3, file = "Wyndham-Risk.csv")

a4 <- findAssocs(tdm, "harm", 0.96)
write.csv(a4, file = "Wyndham-Harm.csv")

a5 <- findAssocs(tdm, "data", 0.80)
write.csv(a5, file = "Wyndham-Data.csv")

a6 <- findAssocs(tdm, "environment", 0.85)
write.csv(a6, file = "Wyndham-Environment.csv")

a7 <- findAssocs(tdm, "systems", 0.10)
# none

a8 <- findAssocs(tdm, "protect", 0.94)
write.csv(a8, file = "Wyndham-Protect.csv")

a9 <- findAssocs(tdm, "information", 0.80)
write.csv(a9, file = "Wyndham-Information.csv"
