allData <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

allData$Date <- as.Date(allData$Date, format="%d/%m/%Y")

subsetDates <- subset(allData, Date >= "2007-02-01" & Date <= "2007-02-02")

rm(allData)

subsetDates$Datetime <- as.POSIXct(paste(as.Date(subsetDates$Date), subsetDates$Time))

plot(meow$Global_active_power~subsetDates$Date, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
