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
png("plot1.png", width = 480, height = 480)
hist(data.subset$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
writeLines("Done.")
