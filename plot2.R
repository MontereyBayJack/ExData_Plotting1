# Project 1, Plot 4 for exdata-014
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
# Produce Plot 2.
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
plot(d$datetime,d$globalactivepower,type="l",pch=0,
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
