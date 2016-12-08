library(plyr)
library(gdata)

getAvg <- function(tbl) {

}


movieFile='movie_titles.txt'


# Read in list of movies, movie's ratings, 
# movies <- read.table(movieFile, header = FALSE, sep=",")
movies <- read.csv(movieFile) #, header = FALSE, sep=",")
colnames(movies) <- c("ID","Year","Title");

# ratingFile='mv_0000001.txt'
# rating <- read.csv(ratingFile, skip=1)
ratingNames<- c("User","Rating","Date");
# colnames(rating) <- ratingCol

print("Start")
start <- proc.time()
setwd("training_set")
rfiles = list.files(pattern="*.txt")
mr = lapply(rfiles, read.csv, skip=1, col.names=ratingNames)

k <- function(vec) { colMeans(vec["Rating"]) }
netflixMean <- data.frame(unlist(lapply(mr,k)))

setwd("/home/users/scrasmussen/db-project/netflix/test")


# write data to file
write.table(format(netflixMean, digits=4), quote=FALSE, file="wtest.txt", sep=",", col.names=FALSE)

t <- proc.time() - start
print(t)
print("Fin")

