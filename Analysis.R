library(ggplot2)
library(dplyr)
library(gridExtra)
library(chron)

p1 = read.table("p1_csv.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
p2 = read.table("p2_csv.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)


a = ggplot(p1, aes(BPM)) +geom_density(fill = "cyan", alpha = .3) + labs(x = "Beats per Minute", y = "Distribution of Data")
b = ggplot(p2, aes(BPM)) +geom_density(fill = "red", alpha = .3) + labs(x = "Beats per Minute", y = "Distribution of Data")
c = ggplot()+ geom_density(aes(x=BPM), fill = "cyan", alpha = .3, data=p1) + 
  geom_density(aes(x = BPM), fill = "red", alpha = .3, data=p2)

BPMDiff = mean(p2[["BPM"]]) - mean(p1[["BPM"]])
EnergyDiff = mean(p2[["Energy"]]) - mean(p1[["Energy"]])
DanceDiff = mean(p2[["Dance"]]) - mean(p1[["Dance"]])
LoudDiff = mean(p2[["Loud"]]) - mean(p1[["Loud"]])
ValenceDiff = mean(p2[["Valence"]]) - mean(p1[["Valence"]])
AcousticDiff = mean(p2[["Acoustic"]]) - mean(p1[["Acoustic"]])
PopDiff = mean(p2[["Popularity"]]) - mean(p1[["Popularity"]])

features <- c("BPM", "Energy", "Dance", "Loud", "Valence", "Acoustic", "Popular")
values <- c(BPMDiff, EnergyDiff, DanceDiff, LoudDiff, ValenceDiff, AcousticDiff, PopDiff)
diff.data <- data.frame(features, values)

d <- ggplot(data = diff.data, aes(x = features, y = values, fill = values > 0)) +  geom_bar(stat = "identity") + coord_flip()
