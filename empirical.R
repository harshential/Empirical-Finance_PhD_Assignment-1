install.packages("readxl")
library(readxl)
# Read the Excel file from your desktop
file_path <- "C:/Users/George Wu/Documents/Empirical-Finance_PhD_Assignment-1-main/chapt26.xlsx"
library(dplyr)
df <- read_excel(file_path, sheet = "Data")
df <- slice(df, 11:254)
df <- select(df, 1,2,5,7, 8, 9, 16)
colnames(df)<-c('year','SPCSPI','IR', "CPI", "Real_1yr",'real_pc_consumption', "real_SP_return")
df$year<-as.numeric(df$year)
df$SPCSPI<-as.numeric(df$SPCSPI) #SPCSPI: the real return on the S&P composite stock price index
df$IR<-as.numeric(df$IR) #IR:the Nominal one-year interest rate
df$real_pc_consumption<-as.numeric(df$real_pc_consumption) #pc_consumption: real per capita consumption.
df$CPI<-as.numeric(df$CPI)
df$Real_1yr<-as.numeric(df$Real_1yr)
df$real_SP_return<-as.numeric(df$real_SP_return)

Shiller <- na.omit(df)

# Read CSV file of Fama-French data - annual return begins from row 2240
FF <- read.csv("C:/Users/George Wu/Documents/Empirical-Finance_PhD_Assignment-1-main/5_Industry_Portfolios.csv", header = TRUE, skip = 2439, nrows = 96, colClasses=c('numeric','numeric','numeric','numeric','numeric','numeric'))
FF<-rename(FF,'year'=X)
#Merge the two database and delete NA value rows
data=merge(FF,Shiller,by='year')

