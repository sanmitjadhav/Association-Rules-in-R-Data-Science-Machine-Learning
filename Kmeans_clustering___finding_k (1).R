getwd()
setwd("C:/Users/varun/Desktop")

install.packages("plyr")
library(plyr)

x <-  runif(50) # generating 50 random numbers
x

y <-  runif(50) # generating 50 random numbers 
y

data <- cbind(x,y) 
data
plot(data)
plot(data, type = 'n')
text(data,rownames(data))
km <- kmeans(data,4) #kmeans clustering
str(km)
km$cluster
km$centers

install.packages("animation")
library(animation)
km <- kmeans.ani(data, 4)

# selecting K for kmeans clustering using kselection
install.packages("kselection")
library(kselection)
data()
?iris
data(iris)
View(iris)
k <- kselection(iris[,-5], parallel = TRUE)
k
?kselection

input <- read.csv("Universities_Clustering.csv")
View(input)
mydata <- input[1:25,c(2:7)] 
View(mydata)
normalized_data <- scale(mydata[,1:6])
View(normalized_data)
fit <- kmeans(normalized_data, 6) # 3 cluster solution
str(fit)
final2<- data.frame(input, fit$cluster) # append cluster membership
View(final2)
final3 <- final2[,c(ncol(final2),1:(ncol(final2)-1))]
View(final3)
aggregate(mydata[,1:6], by=list(fit$cluster), FUN=mean)

#elbow curve & k ~ sqrt(n/2) to decide the k value
install.packages("factoextra")
library(factoextra)
fviz_nbclust(mydata,kmeans,method="wss")+labs(subtitle = "Elbow method")


# k clustering alternative for large dataset - Clustering Large Applications (Clara)
install.packages("cluster")
library(cluster)
xds <- rbind(cbind(rnorm(5000, 0, 8), rnorm(5000, 0, 8)), cbind(rnorm(5000, 50, 8), rnorm(5000, 50, 8)))
xds
xcl <- clara(xds, 2, sample = 100)
clusplot(xcl)


#Partitioning around medoids
xpm <- pam(xds, 2)
clusplot(xpm)
