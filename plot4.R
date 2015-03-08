setwd("C:\\Users\\Néstor\\Desktop\\Exploratory Data Analysis\\Project 1")

# Importing the data
data0 <- read.table(".\\household_power_consumption.txt",header=TRUE, sep=";")

# Subsetting the two dates needed for the project: 01/02/2007 and 02/02/2007
data1<-data0[data0$Date == "1/2/2007" | data0$Date == "2/2/2007",]

# Changing the classes of Date and Time variables

# First I'll paste Date and Time vars, and then transform them in a Date class variable
data1$datetime = paste(data1$Date, data1$Time, sep=" ")

data1$datetime = strptime(data1$datetime, format="%e/%m/%Y %H:%M:%S", tz="GMT")
data1$Date = as.Date(data1$Date,"%e/%m/%Y")

# Creating Plot 4

# First, I need to convert the variables that will be represented in the y axis: 
data1$Global_active_power = as.numeric(as.character(data1$Global_active_power))
data1$Global_reactive_power = as.numeric(as.character(data1$Global_reactive_power))
data1$Sub_metering_1 = as.numeric(as.character(data1$Sub_metering_1))
data1$Sub_metering_2 = as.numeric(as.character(data1$Sub_metering_2))
data1$Sub_metering_3 = as.numeric(as.character(data1$Sub_metering_3))
data1$Voltage = as.numeric(as.character(data1$Voltage))


# Now I'll set the locales to the default north-american ones, because if I don't do this I will obtain in
# the horizontal axis of plot 2, the spanish of "Thu, Fri, Sat" - as I am in Seville, Spain : ) -
Sys.setlocale(category = "LC_ALL", locale = "C")


png(file="plot4.png",width=480,height=480)
# Prepare the grid to show 4 graphs, by columns:
par(mfcol=c(2,2)) 

# first plot (top-left)
plot(data1$datetime,data1$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="n")
lines(data1$datetime,data1$Global_active_power)

# second plot (bottom-left)
plot(data1$datetime,data1$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n",yaxt="n")
axis(side=2, at=seq(0, 40, by=10))
lines(data1$datetime,data1$Sub_metering_1)
lines(data1$datetime,data1$Sub_metering_2,col="red")
lines(data1$datetime,data1$Sub_metering_3,col="blue")

legend("topright",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# third plot (top-right)
plot(data1$datetime,data1$Voltage,xlab="datetime",ylab="Voltage",type="n")
lines(data1$datetime,data1$Voltage)

# fourth plot (bottom-right)
plot(data1$datetime,data1$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="n")
lines(data1$datetime,data1$Global_reactive_power)

# Copying Plot 1 to a png file with the width and height wanted in the instructions:
dev.off()

