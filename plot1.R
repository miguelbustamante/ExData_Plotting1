allData <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

allData$Date <- as.Date(allData$Date, format="%d/%m/%Y")

subsetDates <- subset(allData, Date >= "2007-02-01" & Date <= "2007-02-02")

rm(allData)

hist(subsetDates$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()