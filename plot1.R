## synthesize colClasses
ch<- "character"
nu<- "numeric"
cC<-c(ch,ch,nu,nu,nu,nu,nu,nu,nu)

data<-read.table("household_power_consumption.txt", na.strings="?", sep=";",
			nrows=2100000, header=T, colClasses=cC)

day1.rows <- data$Date == "1/2/2007"
day2.rows <- data$Date == "2/2/2007"
days.rows <- day1.rows | day2.rows
data.days <- data[days.rows,]

main1 <- "Global Active Power"

png(file = "plot1.png" )
hist(data.days$Global_active_power, col="red", main = main1,
	xlab = paste(main1," (kilowatts)")
	)
axis(2,col="gray50",lwd=2)
dev.off()