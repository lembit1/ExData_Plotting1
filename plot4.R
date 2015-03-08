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
tt <- strptime( paste(data.days[,1],data.days[,2]), "%d/%m/%Y %H:%M:%S" )

png( file = "plot4.png" )
par( mfcol = c(2,2) )

plot( tt, data.days$Global_active_power, "l",
	ylab = "Global Active Power", xlab = NA
	)

plot( tt, data.days$Sub_metering_1,
	"l", ylab = "Energy sub metering", xlab = NA
	)
lines( tt, data.days$Sub_metering_2, "l", col = "red" )
lines( tt, data.days$Sub_metering_3, "l", col = "blue" )
legend("topright", lty = 1, col = c("black", "red", "blue"), bty = "n",
	cex = 0.90,
	legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" )
	)

plot( tt, data.days$Voltage, "l",
	ylab = "Voltage", xlab = "datetime"
	)

plot( tt, data.days$Global_reactive_power, "l",
	ylab = "Global_reactive_power", xlab = "datetime"
	)
dev.off()