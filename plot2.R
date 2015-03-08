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

tt <- strptime( paste(data.days[,1],data.days[,2]), "%d/%m/%Y %H:%M:%S" )

png(file = "plot2.png" )
plot( tt, data.days$Global_active_power, "l",
	ylab = paste(main1," (kilowatts)"), xlab = NA
)
dev.off()