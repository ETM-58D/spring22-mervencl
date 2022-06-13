library(tidyverse)
library(scatterplot3d)
library(tibble)
library(ggplot2)
library(data.table)
library(plotly)
library(TSstudio)
library(readxl)


#reading data as a table 
x_train <- read.table("/Users/merve.oncel/Downloads/uWaveGestureLibrary_X_TRAIN")
y_train <- read.table("/Users/merve.oncel/Downloads/uWaveGestureLibrary_Y_TRAIN")
z_train <- read.table("/Users/merve.oncel/Downloads/uWaveGestureLibrary_Z_TRAIN")
ecg <- read.table("/Users/merve.oncel/Downloads/ecgTrain")

#combining tables in three different columns. 
mergedata <- data.frame(c1 = x_train,  
                    c2 = y_train,
                    c3=  z_train)

ts.plot(mergedata)

x=x_train$V2
y=y_train$V2
z=z_train$V2


#plot result
p=plot_ly(ecg,x=~x,y=~y,z=~z)
p

#Part 3/b

library(readxl)

#read and check ilmesafe data
distance = read_xlsx("/Users/merve.oncel/Downloads/ilmesafe.xlsx")
distance
str(distance)
head(distance)
# remove first row storing the names
distance1=distance[, -1]
distance1


distance2=distance1[, -1]
str(distance2)
distance2
head(distance2)

# apply multidimensional scaling
#mds_fit=cmdscale(distance2, k = 2, )

# getting coordinates
#x=mds_fit[, 1]
#y=mds_fit[, 2]

# plotting
plot(x, y, pch = 19)
distance
text(x, y, pos = 4, labels =colnames(distance2))

