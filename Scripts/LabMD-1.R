
library(tm)
setwd("../FTC-Text")

# pdf reader manually used to convert to plain text 

labMD <- VCorpus(DirSource("LabMD"),
 readerControl = list(reader = readPlain,
 language = "en",
 load = TRUE)
 )

cleanLabMD  <- tm_map(labMD, content_transformer(removeNumbers))
cleanLabMD  <- tm_map(cleanLabMD, content_transformer(removePunctuation))
cleanLabMD  <- tm_map(cleanLabMD, content_transformer(tolower))

dtm <- DocumentTermMatrix(cleanLabMD)

dtmOutput <- inspect(dtm)
write.csv(dtmOutput, file = "LabMD-dtmOutput.csv")

dtmFTOutput <- findFreqTerms(dtm, 150)
write.csv(dtmFTOutput, file = "LabMD-dtmFTOutput.csv")

dtmDictOutput <- inspect(DocumentTermMatrix(cleanLabMD, list(
 dictionary = c("reasonable", "security", "risk", "harm", "data", "environment", "protect", "systems")
 )))

write.csv(dtmDictOutput, file = "LabMD-dtmDictOutput.csv")

tdm <- TermDocumentMatrix(cleanLabMD)

a1 <- findAssocs(tdm, "reasonable", 0.94)
write.csv(a1, file = "LabMD-Reasonable.csv")

a2 <- findAssocs(tdm, "security", 0.94)
write.csv(a2, file = "LabMD-Security.csv")

a3 <- findAssocs(tdm, "risk", 0.94)
write.csv(a3, file = "LabMD-Risk.csv")

a4 <- findAssocs(tdm, "harm", 0.94)
write.csv(a4, file = "LabMD-Harm.csv")

a5 <- findAssocs(tdm, "data", 0.94)
write.csv(a5, file = "LabMD-Data.csv")

a6 <- findAssocs(tdm, "environment", 0.94)
write.csv(a6, file = "LabMD-Environment.csv")

a7 <- findAssocs(tdm, "systems", 0.94)
write.csv(a7, file = "LabMD-Systems.csv")

a8 <- findAssocs(tdm, "protect", 0.94)
write.csv(a8, file = "LabMD-Protect.csv")

a9 <- findAssocs(tdm, "information", 0.89)
write.csv(a9, file = "LabMD-Information.csv")

