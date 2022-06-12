
library(data.table)
library(ggplot2)
library(factoextra)
library(cluster)

movies1 = read.csv("/Users/merve.oncel/Downloads/HW4_data/ETM58D_Spring22_HW4_movie_titles.txt", 
                   header=FALSE,sep="|")
colnames(movies1) = c("Title")

moviesdata=read.table("/Users/merve.oncel/Downloads/HW4_data/ETM58D_Spring22_HW4_Netflix_data.dat", 
                      header=FALSE, sep="")

#merging data
mergedata <- data.frame(c1 = movies1,  
                        c2 = moviesdata)
#Distances and applying hierarchical clustering
distances = dist(mergedata[2:100], method = "euclidean")
#fviz_dist(distances, gradient = list(low = "#00AFBB", mid = "white", high = "#FC4E07"))


head(mergedata)


set.seed(123) 
#Ward's method 
cluster_Movies = hclust(distances, method = "ward.D2")
plot(cluster_Movies)

plot(cluster_Movies, cex = 0.6, hang = -1)


hc.complete=hclust(dist(moviesdata), method="complete")
plot(hc.complete,main="Complete Linkage", xlab="", cex=.9)

#cluster evaluation
fviz_nbclust(moviesdata, kmeans, method = "silhouette")

#divided tree into 2 groups
subgrp <- cutree(cluster_Movies, k = 2)
plot(cluster_Movies)
rect.hclust(cluster_Movies , k = 2, border = 2:6)
#visualization
fviz_dend(cluster_Movies, rect = TRUE, cex = 0.5,
          k_colors = c("#00AFBB","#2E9FDF", "#E7B800", "#FC4E07"))
