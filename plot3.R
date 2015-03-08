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

main1 <- "Energy sub metering"
tt <- strptime( paste(data.days[,1],data.days[,2]), "%d/%m/%Y %H:%M:%S" )

png( file = "plot3.png" )
plot( tt, data.days$Sub_metering_1, "l", ylab = main1, xlab = NA )
lines( tt, data.days$Sub_metering_2, "l", col = "red" )
lines( tt, data.days$Sub_metering_3, "l", col = "blue" )
legend("topright", lty = 1, col = c("black", "red", "blue"),
      box.lwd = 2, box.col = "gray50", cex = 0.9,
	legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" )
	)
dev.off()