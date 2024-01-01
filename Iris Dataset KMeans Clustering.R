
#===============================================================
# K Means Clustering | unsupervised learning for the IRIS dataset
# Data Scientist: KINDOLI EDWARD
# Machine learning
#================================================================

# Loading the IRIS dataset 

data("iris")

# Adding a feature to the IRIS dataset

iris.features <- iris

# Eliminating the categorical variable species in the IRIS dataset

iris.features$Species<-NULL

View(iris.features)

# Running Kmeans on Iris.features dataset

results <- kmeans(iris.features,3)
results

# Exploring the results dataframe
results$size
results$totss

#Exploring the results dataframe with the iris datasets

table(iris$Species,results$cluster)

#Plotting petal length and petal width
plot(iris[c("Petal.Length","Petal.Width")], col=results$cluster)

#Plotting sepal length and sepal width
plot(iris[c("Sepal.Length","Sepal.Width")], col=results$cluster)
