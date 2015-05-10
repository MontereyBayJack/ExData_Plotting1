# Project 1, Plot 3 for exdata-014
# Read data and transform for plotting.
setwd("C:/Users/lajackso/exdata")
dt <- read.table("household_power_consumption.txt", header=TRUE, 
                 sep=";", na.strings="?")
# Clean up the variable names.
cnames <- gsub("_","",tolower(names(dt)))
require(data.table)
setnames(dt,cnames)
# Format the data-time variable from date and time variables.
dt$datetime<-strptime(paste(dt[,'date'],dt[,'time']),
                      format="%d/%m/%Y %H:%M:%S")
# Filter data for the appropriate dates.
d<- dt[(as.Date(dt$datetime)==as.Date("2007-02-01"))
       | (as.Date(dt$datetime)==as.Date("2007-02-02")),]
d <- within(d,rm('date','time'))
# Produce Plot 3.
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
with(d,plot(datetime,submetering1,xlab="",ylab="Energy sub metering",type="n"))
with(d, lines(datetime,submetering1,col="black"))
with(d, lines(datetime,submetering2,col="red"))
with(d, lines(datetime,submetering3,col="blue"))
legend("topright", pch=NA, lty=1, col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
