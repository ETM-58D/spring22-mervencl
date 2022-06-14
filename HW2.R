library(readxl)
library(ggplot2)
library(data.table)
require(openxlsx) 
require(skimr)
require(GGally)
require(ggcorrplot)
library(skimr)

setwd("/Users/merve.oncel/Downloads/")
data=read_xlsx("data.xlsx")
str(data)

sum_data=skim(data)
print(sum_data)
data=data.table(data)
str(data)

ggplot(data,aes(x=Date,y=USDRate, group=1))+ 
  geom_line(color="orange")+
  ggtitle(" Exchange Rate USD/TRY",
          subtitle=" 2018-2022")



ggplot(data,aes(x=Date,y=Avg_Expense, group=1))+ 
  geom_line(color="red")+
  ggtitle("Time Series of Price Index",
          subtitle="Between the Years 2018-2022")


ggplot(data,aes(x=Date,y=Income, group=1))+ 
  geom_line(color="black")+
  ggtitle("Time Series of Price Index",
          subtitle="Between the Years 2018-2022")
#This graph indicate the USDRate, Average Expense and Total Tourism Income 

cols <- c("USDRate","Avg_Expense","Income")
ggplot(data)+
  geom_line(aes(x=Date, y=USDRate, group=1, color="USD Exchange Rate"))+
  geom_line(aes(x=Date, y=Avg_Expense ,group=1,color="Average Expense of per Person"))+
  geom_line(aes(x=Date, y=Income , group=1,color= "Total Tourism Income"))+
  
  labs(title = "USD Exchange Rate Average Expense and Total Tourism Income",
       subtitle = "From 2018 to 2021",
       x = "Date",
       y = "USD Exchange Rate Average Expense and Total Tourism Income") +
  theme_minimal()

res1 <- cor.test(data$USDRate, data$Avg_Expense,  method="kendall")
res1
res2 <- cor.test(data$USDRate, data$Income,  method="kendall")
res2
res3 <- cor.test(data$Income, data$Avg_Expense,  method="kendall")
res3

# Change in Dollar against Turkish Lira

ggplot(data,aes(x=Date,y=USDRate))+ geom_bar(stat="identity",fill="#0FEC4951")+
  xlab("Period") + ylab("Dollar Exhange Rate")+ ggtitle(" Dollar Exchange Rate in Turkey between 2018 & 2022")


