
library(tm)
setwd("../FTC-Text")

# pdf reader manually used to convert to plain text 

ftcCorpus2 <- VCorpus(DirSource("Iteration-2"),
 readerControl = list(reader = readPlain,
 language = "en",
 load = TRUE)
 )

cleanftcCorpus2  <- tm_map(ftcCorpus2, content_transformer(removeNumbers))
cleanftcCorpus2  <- tm_map(cleanftcCorpus2, content_transformer(removePunctuation))
cleanftcCorpus2  <- tm_map(cleanftcCorpus2, content_transformer(tolower))

dtm <- DocumentTermMatrix(cleanftcCorpus2)
myDtm <- as.matrix(dtm)
nrow(myDtm); ncol(myDtm)
write.csv(myDtm, file = "ftcCorpus2-mydtmOutput.csv")

# we want as close to but under 100 terms...
dtmR <- removeSparseTerms(dtm, 0.30)
write.csv(dtmR, file = "ftcCorpus2-dtmROutput.csv")

myDtmR <- as.matrix(dtmR) 

# we want as close to but under 100 terms...
dtmFTOutput <- findFreqTerms(dtmR, 100)
write.csv(dtmFTOutput, file = "ftcCorpus2-dtmFTOutput-100.csv")

dtmDictOutput <- DocumentTermMatrix(cleanftcCorpus2, list(
 dictionary = c("reasonable", "security", "risk", "harm", "data", "environment", "protect", "systems", "information")
 )))
myDtmDictOutput <- as.matrix(dtmDictOutput)
write.csv(myDtmDictOutput, file = "ftcCorpus2-dtmDictOutput.csv")

tdm <- TermDocumentMatrix(cleanftcCorpus2)

a1 <- findAssocs(tdm, "reasonable", 0.86)
write.csv(a1, file = "ftcCorpus2-reasonable.csv")

a2 <- findAssocs(tdm, "security", 0.66)
write.csv(a2, file = "ftcCorpus2-security.csv")

a3 <- findAssocs(tdm, "risk", 0.96)
write.csv(a3, file = "ftcCorpus2-risk.csv")

a4 <- findAssocs(tdm, "harm", 0.80)
write.csv(a4, file = "ftcCorpus2-harm.csv")

a5 <- findAssocs(tdm, "data", 0.70)
write.csv(a5, file = "ftcCorpus2-data.csv")

a6 <- findAssocs(tdm, "environment", 0.84)
write.csv(a6, file = "ftcCorpus2-environment.csv")

a7 <- findAssocs(tdm, "systems", 0.70)
write.csv(a7, file = "ftcCorpus2-systems.csv")

a8 <- findAssocs(tdm, "protect", 0.76)
write.csv(a8, file = "ftcCorpus2-protect.csv")

a9 <- findAssocs(tdm, "information", 0.67)
write.csv(a9, file = "ftcCorpus2-information.csv")

