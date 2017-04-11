
library(tm)
setwd("../FTC-Text")

# pdf reader manually used to convert to plain text 

ashleyM <- VCorpus(DirSource("AshleyMadison"),
 readerControl = list(reader = readPlain,
 language = "en",
 load = TRUE)
 )

cleanAshleyM  <- tm_map(ashleyM, content_transformer(removeNumbers))
cleanAshleyM  <- tm_map(cleanAshleyM, content_transformer(removePunctuation))
cleanAshleyM  <- tm_map(cleanAshleyM, content_transformer(tolower))

dtm <- DocumentTermMatrix(cleanAshleyM)

dtmOutput <- inspect(dtm)
write.csv(dtmOutput, file = "AshleyM-dtmOutput.csv")

dtmFTOutput <- findFreqTerms(dtm, 15)
write.csv(dtmFTOutput, file = "AshleyM-dtmFTOutput.csv")

dtmDictOutput <- inspect(DocumentTermMatrix(cleanAshleyM, list(
 dictionary = c("reasonable", "security", "risk", "harm", "data", "environment")
 )))

write.csv(dtmDictOutput, file = "AshleyM-dtmDictOutput.csv")

tdm <- TermDocumentMatrix(cleanAshleyM)

a1 <- findAssocs(tdm, "reasonable", 0.94)
write.csv(a1, file = "AshleyM-Reasonable.csv")

a2 <- findAssocs(tdm, "security", 0.95)
write.csv(a2, file = "AshleyM-Security.csv")

a3 <- findAssocs(tdm, "risk", 0.94)
write.csv(a3, file = "AshleyM-Risk.csv")

a4 <- findAssocs(tdm, "harm", 0.94)
write.csv(a4, file = "AshleyM-Harm.csv")

a5 <- findAssocs(tdm, "data", 0.94)
write.csv(a5, file = "AshleyM-Data.csv")

# not run:
# a6 <- findAssocs(tdm, "environment", 0.94)
# write.csv(a6, file = "AshleyM-Environment.csv")

# not run:
# a7 <- findAssocs(tdm, "systems", 0.94)
# write.csv(a7, file = "AshleyM-Systems.csv")

a8 <- findAssocs(tdm, "protect", 0.87)
write.csv(a8, file = "AshleyM-Protect.csv")

a9 <- findAssocs(tdm, "information", 0.94)
write.csv(a9, file = "AshleyM-Information.csv")

