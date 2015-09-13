# Read in power file.
writeLines("Reading Data...")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", comment.char = "")

# Subset to grab just the few days of interest.  Feb 1, 2007 and Feb 2, 2007.
writeLines("Subsetting...")
data.subset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Reduce memory by removing large data set.
rm(data)

# Convert Date and Time factors into a single datetime field in the correct format.
data.subset$Date_time <- strptime(paste0(data.subset$Date, " ", data.subset$Time), "%d/%m/%Y %H:%M:%S")

# Build plot and save as png.
writeLines("Saving plot to png...")
png("plot3.png", width = 480, height = 480)
plot(data.subset$Date_time, data.subset$Sub_metering_1, type = "l", col = "black", main = "", xlab = "", ylab = "Energy sub metering")
lines(data.subset$Date_time, data.subset$Sub_metering_2, col = "red")
lines(data.subset$Date_time, data.subset$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()
writeLines("Done.")
