install.packages("readxl")
library(readxl)
# Read the Excel file from your desktop
file_path <- "C:/Users/X_FENG/Desktop/chapt26.xlsx"
library(dplyr)
df <- read_excel(file_path, sheet = "Data")
df <- slice(df, 11:254)
df <- select(df, 1,2,5,9)
colnames(df)<-c('year','SPCSPI','IR','pc_consumption')
df$year<-as.numeric(df$year)
df$SPCSPI<-as.numeric(df$SPCSPI) #SPCSPI: the real return on the S&P composite stock price index
df$IR<-as.numeric(df$IR) #IR:the real one-year interest rate
df$pc_consumption<-as.numeric(df$pc_consumption) #pc_consumption: real per capita consumption.
Shiller <- na.omit(df)

# Read CSV file of Fama-French data - annual return begins from row 2240
FF <- read.csv("C:/Users/X_FENG/Desktop/5_Industry_Portfolios.csv", header = TRUE, skip = 2439, nrows = 96, colClasses=c('numeric','numeric','numeric','numeric','numeric','numeric'))
FF<-rename(FF,'year'=X)
#Merge the two database and delete NA value rows
data=merge(FF,Shiller,by='year')

