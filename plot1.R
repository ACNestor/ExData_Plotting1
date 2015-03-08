setwd("C:\\Users\\Néstor\\Desktop\\Exploratory Data Analysis\\Project 1")

# Importing the data
data0 <- read.table(".\\household_power_consumption.txt",header=TRUE, sep=";")

# Subsetting the two dates needed for the project: 01/02/2007 and 02/02/2007
data1<-data0[data0$Date == "1/2/2007" | data0$Date == "2/2/2007",]

# Changing the classes of Date and Time variables

# First I'll paste Date and Time vars, and then transform them in a Date class variable
data1$datetime = paste(data1$Date, data1$Time, sep=" ")

data1$datetime = strptime(data1$datetime, format="%e/%m/%Y %H:%M:%S")
data1$Date = as.Date(data1$Date,"%e/%m/%Y")

# Creating Plot 1

# First, I need to convert Global_active_power 
data1$Global_active_power = as.numeric(as.character(data1$Global_active_power))

hist(data1$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Copying Plot 1 to a png file with the width and height wanted in the instructions:
dev.copy(png,file="plot1.png",width=480,height=480) 
dev.off()

