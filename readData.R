## This first line will likely take a few seconds. Be patient!
setwd("~/Coursera//Exploratory Data Analysis//Project2/")
NEI <- readRDS("Data/summarySCC_PM25.rds")
SCC <- readRDS("Data/Source_Classification_Code.rds")
head(NEI)
head(SCC)
totEmissionsGroupByYear <- aggregate(Emissions~year, NEI, sum)
# Q1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# Plot total emissions per year from all sources
with(totEmissionsGroupByYear, plot(year,Emissions))
title(main="Total Emissions from All Sources by Year")
lmodel <- lm(Emissions~year, totEmissionsGroupByYear)
abline(lmodel, lwd=3, col = "green")

# Q2: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?
# subset to Baltimore City
BaltimoreCity <- subset(NEI, fips ==24510)
# sum by year
totEmissionsGroupByYear <- aggregate(Emissions~year, BaltimoreCity, sum)
# Plot total emissions per year from all sources for Baltimore City
with(totEmissionsGroupByYear, plot(year,Emissions))
title(main="Total Emissions from All Sources by Year for Baltimore City")
lmodel <- lm(Emissions~year, totEmissionsGroupByYear)
abline(lmodel, lwd=3, col = "green")
