library("reshape2")
library("plyr")

features <- read.table("features.txt")

activities <- rbind(read.table("test/y_test.txt"), 
                    read.table("train/y_train.txt"))

subjects <- rbind(read.table("test/subject_test.txt"),
                  read.table("train/subject_train.txt"))

measurements <- rbind(read.table("test/X_test.txt"), 
                      read.table("train/X_train.txt"))

measurements <- cbind(measurements,
                      subjects,
                      merge(activities, activity_labels)$V2)

names(measurements) <- append(gsub("[(),-]", "_", features$V2), "subject", "activity")

measure.vars <- grep("(mean|std)", names(measurements), value=TRUE)

melted <- melt(measurements, id=c("subject","activity"), measure.vars=measure.vars)

tidy <- ddply(melted, c("activity", "subject", "variable"), summarise, mean = mean(value))

write.table(tidy, "tidy.txt", row.names = FALSE)

