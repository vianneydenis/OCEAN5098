library(vegan)
library(ape)
library(ade4)
library(gclus)
library(qgraph)
library(factoextra)
library(fpc)
library(ggplot2)
library(gridExtra)
library(e1071)
library(corrplot)
library(tree)
library(rpart)
library(rattle)
library(randomForest)
library(caret)
library(devtools)
library(mvabund)
library(mvpart) # install_github("cran/mvpart", force = T) # after devtools
library(MVPARTwrap) # install_github("cran/MVPARTwrap", force = T) # after devtools

#  functions from Borcard et al. 2011
source('https://www.dipintothereef.com/uploads/3/7/3/5/37359245/coldiss.r') 
source ('https://www.dipintothereef.com/uploads/3/7/3/5/37359245/panelutils.r')
source ('https://www.dipintothereef.com/uploads/3/7/3/5/37359245/cleanplot.pca.r')
source ('https://www.dipintothereef.com/uploads/3/7/3/5/37359245/evplot.r')
#Sys.setlocale("LC_ALL", "English")

# ?varespec
data (varespec)
varespec[1:5,1:5]

# log,  hellinger, and presence/absence transformations
varespec.log<-decostand(varespec,'log')
varespec.hell<-decostand(varespec,'hellinger')
varespec.pa<-decostand(varespec,'pa')
varespec.pa [1:5,1:5]

# using varespec dataset
spe<-varespec

# quantitative data
# Bray-Curtis dissimilarity matrix on raw data
spe.db <- vegdist(spe)

# Bray-Curtis dissimilarity matrix on log-transformed data
spe.dbln <- vegdist(log1p(spe)) # log(x+1)

# Chord distance matrix
spe.norm<-decostand(spe,'nor')
spe.dc <- vegdist(spe.norm)

# Hellinger distance matrix
spe.hel<-decostand(spe,'hel')
spe.dh <- vegdist(spe.hel)

# using environmental dataset varechem,  clear interpretation of double zeros use Euclidean distance D1
data(varechem)
env <- varechem
env.st<-decostand(env,'stan') # standardized [or scale(env)]
env.de<-vegdist(env.st,method='euc') # then compute D1


# binary data
# Jaccard dissimilarity matrix using vegdist()
spe.dj1 <- vegdist(spe,'jac',binary=T)# binary p/a 

# Jaccard dissimilarity matrix using dist()
spe.dj2 <- dist(spe,'binary') 

# Sorensen dissimilarity matrix using vegdist()
spe.ds<-vegdist(spe,binary=T)

# Ochiai dissimilarity matrix using dist.binary() (ade4)
spe.och<-dist.binary(spe, method=7)

coldiss(spe.db,byrank=F,diag=T) # for the bc dissimilarity on raw data 
coldiss(spe.dbln,byrank=F,diag=T) # for the bc dissimilarity on log-transformed data
coldiss(env.de, diag=T) # for the environmental data

qgraph(1-spe.db, layout='spring', vsize=4)

spe.t <- t(spe)# transpose species matrix
spe.t.chi <- decostand(spe.t,'chi.square') # Chi-square transformation
spe.t.D16 <-dist(spe.t.chi)# euclidean distance
coldiss(spe.t.D16, diag=T) # visualization
qgraph(1-spe.t.D16, layout='spring', vsize=4)

#  Pearson r linear correlation among env. variable
env.pearson <- cor(env) # default method = 'pearson')
env.pearson <- round(env.pearson,2)
# re-order the variables prior to plotting
env.o<-order.single(env.pearson)
# need panelutils () on ceiba
pairs (env[,env.o], lower.panel=panel.smooth, upper.panel=panel.cor,diag.panel=panel.hist, main='Pearson Correlation Matrix')

# Step 1: chord distance = normalization + euclidean
spe.norm<-decostand(spe,'normalize') 
spe.ch<-vegdist(spe.norm,'euc') 

# Step 2: single linkage agglomerative clustering
spe.ch.single <-hclust(spe.ch,method='single') 
# plot function
plot(spe.ch.single, main='Single linkage agglomerative clustering' ) 

spe.ch.complete<-hclust(spe.ch,method='complete') 
plot(spe.ch.complete, main='Complete linkage agglomerative clustering') 

spe.ch.UPGMA<-hclust(spe.ch,method='average') 
plot(spe.ch.UPGMA, main='Average (UPGMA) agglomerative clustering') 

spe.ch.ward<-hclust(spe.ch,method='ward.D') 
plot(spe.ch.ward, main='Ward clustering') 

# Single linkage clustering
spe.ch.single.coph <- cophenetic (spe.ch.single)
cor(spe.ch,spe.ch.single.coph)

# complete linkage clustering
spe.ch.complete.coph <- cophenetic (spe.ch.complete)
cor(spe.ch,spe.ch.complete.coph)

# Average clustering
spe.ch.UPGMA.coph <- cophenetic (spe.ch.UPGMA)
cor(spe.ch,spe.ch.UPGMA.coph)

# Ward clustering
spe.ch.ward.coph <- cophenetic (spe.ch.ward)
cor(spe.ch,spe.ch.ward.coph)

par(mfrow=c(2,2))

plot(spe.ch,spe.ch.single.coph,xlab='Chord distance',ylab='Chophenetic distance',asp=1, main=c('Single linkage',paste('Cophenetic correlation',round(cor(spe.ch,spe.ch.single.coph),3))))
abline (0,1)
lines(lowess(spe.ch,spe.ch.single.coph),col='red')

plot(spe.ch,spe.ch.complete.coph,xlab='Chord distance',ylab='Chophenetic distance',asp=1, main=c('Complete linkage',paste('Cophenetic correlation',round(cor(spe.ch, spe.ch.complete.coph),3))))
abline (0,1)
lines(lowess(spe.ch, spe.ch.complete.coph),col='red')

plot(spe.ch,spe.ch.UPGMA.coph,xlab='Chord distance',ylab='Chophenetic distance',asp=1, main=c('UPGMA',paste('Cophenetic correlation',round(cor(spe.ch,spe.ch.UPGMA.coph),3))))
abline (0,1)
lines(lowess(spe.ch,spe.ch.UPGMA.coph),col='red')

plot(spe.ch,spe.ch.ward.coph,xlab='Chord distance',ylab='Chophenetic distance',asp=1, main=c('Ward clustering',paste('Cophenetic correlation',round(cor(spe.ch,spe.ch.ward.coph),3))))
abline (0,1)
lines(lowess(spe.ch,spe.ch.ward.coph),col='red')

dev.off()

plot(spe.ch.UPGMA$height, nrow(spe):2, 
     type='S',main='Fusion levels - chord - UPGMA',
     ylab='k (number of clusters)', xlab='h (node height)', col='grey')
text (spe.ch.UPGMA$height,nrow(spe):2, nrow(spe):2, col='red', cex=0.8)

plot(spe.ch.UPGMA)
rect.hclust(spe.ch.UPGMA, k=6) # number of group
rect.hclust(spe.ch.UPGMA, h=0.79) # with height


par(mfrow=c(2,2))
# fusion level - single linkage clustering
plot(spe.ch.single$height, 
     nrow(spe):2, type='S',main='Fusion levels - chord - single',
     ylab='k (number of clusters)', xlab='h (node height)', col='grey')
text (spe.ch.single$height,nrow(spe):2, nrow(spe):2, col='red', cex=0.8)

# fusion level - complete linkage clustering
plot(spe.ch.complete$height, 
     nrow(spe):2, type='S',main='Fusion levels - chord - complete',
     ylab='k (number of clusters)', xlab='h (node height)', col='grey')
text (spe.ch.complete$height,nrow(spe):2, nrow(spe):2, col='red', cex=0.8)

# fusion level - UPGMA clustering
plot(spe.ch.UPGMA$height, nrow(spe):2, 
     type='S',main='Fusion levels - chord - UPGMA',
     ylab='k (number of clusters)', xlab='h (node height)', col='grey')
text (spe.ch.UPGMA$height,nrow(spe):2, nrow(spe):2, col='red', cex=0.8)

# fusion level - the ward clustering
plot(spe.ch.ward$height, nrow(spe):2,
     type='S',main='Fusion levels - chord - Ward',
     ylab='k (number of clusters)', xlab='h (node height)', col='grey')
text (spe.ch.ward$height,nrow(spe):2, nrow(spe):2, col='red', cex=0.8)

k<-5 # Number of groups (conscensus) 
spe.ch.single.g <- cutree(spe.ch.single, k)
spe.ch.complete.g <- cutree(spe.ch.complete, k)
spe.ch.UPGMA.g <- cutree(spe.ch.UPGMA, k)
spe.ch.ward.g <- cutree(spe.ch.ward, k)

table(spe.ch.single.g,spe.ch.complete.g) # Single vs complete

cutg<-cutree(spe.ch.UPGMA, k=3)
sil<-silhouette (cutg,spe.ch)
plot(sil)

fviz_nbclust(spe.norm, hcut, diss=dist(spe.norm, method='euclidean'),method = "wss",hc_method = "average")
#fviz_nbclust(spe.norm, hcut, diss=dist(spe.norm, method='euclidean'),method = "silhouette",hc_method = "average")

## Mantel test
# Optimal number of clusters
# according to mantel statistic 
# Function to compute a binary distance matrix from groups
grpdist<-function(x){
  require (cluster)
  gr<-as.data.frame(as.factor(x))
  distgr<-daisy(gr,'gower')
  distgr
}
# run based on the UPGMA clustering
kt<-data.frame(k=1:nrow(spe),r=0)
for (i in 2:(nrow(spe)-1)){
  gr<-cutree(spe.ch.UPGMA,i)
  distgr<-grpdist(gr)
  mt<-cor(spe.ch,distgr, method='pearson')
  kt[i,2] <- mt
}
k.best <- which.max (kt$r)
plot(kt$k,kt$r, 
     type='h', main='Mantel-optimal number of clusters - UPGMA',
     xlab='k (number of groups)',ylab="Pearson's correlation")
axis(1,k.best, 
     paste('optimum', k.best, sep='\n'), col='red',font=2, col.axis='red')
points(k.best,max(kt$r),pch=16,col='red',cex=1.5)

plot(spe.ch.UPGMA, main='Average linkage')
rect.hclust(spe.ch.UPGMA, k=3)
rect.hclust(spe.ch.UPGMA, k=8, border = 'blue')

# note on the of Euclidean distance and Ward.D: SS based clustering 
# Bray + UPGMA can be try
# ?doubs
data(doubs)
doubs.spe<-doubs$fish
doubs.spa<-doubs$xy
# remove empty sample 8 from both datasets
doubs.spe <- doubs.spe[-8,]
doubs.spa <- doubs.spa[-8,]
# Calculates hierarchical cluster analysis of species data 
eucl.ward <- hclust (d = dist (doubs.spe), method = 'ward.D')
fviz_nbclust(doubs.spe, hcut, diss=dist(doubs.spe, method='euclidean'),method = "wss",hc_method = "single")
# Dendrogram with the observed groups
par(mfrow=c(1,2))
plot (eucl.ward)
rect.hclust (eucl.ward, k = 4, border = 1:4)
# Spatial distribution of samples with projection of hierarchical classification
eucl.ward.cluster <- cutree (eucl.ward, k = 4)
plot (y ~ x, data = doubs.spa, pch = eucl.ward.cluster, col = eucl.ward.cluster, type = 'b', main = 'Euclidean distance - Ward method')
dev.off()

spe.chwo<-reorder.hclust(spe.ch.ward,spe.ch)
dend<-as.dendrogram(spe.chwo) 
heatmap(as.matrix(spe.ch),Rowv=dend,symm=TRUE, margin=c(3,3))

# k-means partitioning of the pre-transformed species data
spe.kmeans <- kmeans(spe.norm, centers=5, nstart=100)
# k-means group number of each observation spe.kmeans$cluster 
spe.kmeans$cluster
# Comparison with the 5-group classification derived from UPGMA clustering
comparison<-table(spe.kmeans$cluster,spe.ch.UPGMA.g)
comparison
# Visualize k-means clusters 
fviz_cluster(spe.kmeans, data = spe.norm,geom = "point",
             stand = FALSE, ellipse.type = "norm") 

# elbow, UPGMA, chord
fviz_nbclust(spe.norm, hcut, diss=dist(spe.norm, method='euclidean'),method = "wss",hc_method = "average")

# silhouette, UPGMA, chord
fviz_nbclust(spe.norm, hcut, diss=dist(spe.norm, method='euclidean'),method = "silhouette",hc_method = "average")

# elbow, kmeans, chord
fviz_nbclust(spe.norm, kmeans, method = "wss")

# silhouette, kmeans, chord
fviz_nbclust(spe.norm, kmeans, method = "silhouette")

spe.KM.cascade<-cascadeKM(spe.norm,inf.gr=2,sup.gr=10,iter=100,criterion='calinski')
plot(spe.KM.cascade,sortg=TRUE)

fviz_nbclust (spe.norm , pam, method = "silhouette") 
fviz_nbclust (spe.norm , pam, method = "wss")
pamk(spe.norm, krange=2:10, criterion='asw')$nc
pam6<-pam(spe.norm, 6)
pam3<-pam(spe.norm, 3)
plot(silhouette(pam6))
plot(silhouette(pam3))
# plot1<-fviz_nbclust(spe.norm, hcut, method = "silhouette", hc_method = "average")
# plot2 < - fviz_nbclust (spe.norm , pam, method = "silhouette")
# plot3<-fviz_nbclust(spe.norm, kmeans, method = "silhouette")
# grid.arrange(plot1, plot2,plot3, ncol=3)

pam.res<-pam(spe.norm, k=6)
km.res <- kmeans(spe.norm, centers=3)
plot4 <-fviz_cluster(km.res,spe.norm, stand = FALSE,geom = "point",ellipse.type = "norm") 
plot5 <-fviz_cluster(pam.res,spe.norm, stand = FALSE,geom = "point",ellipse.type = "norm")
grid.arrange(plot4, plot5, ncol=2)

set.seed(123)
res.fanny<-fanny(spe.norm, 3)
fviz_cluster(res.fanny, ellipse.type = "norm", repel = TRUE,
             palette = "jco", ggtheme = theme_minimal(),
             legend = "right")
res.fanny # details on membership

fviz_silhouette(res.fanny, palette = "jco",
                ggtheme = theme_minimal())

set.seed(123)
# Load the data
data("USArrests")
# Subset of USArrests
ss <- sample(1:50, 20)
df <- scale(USArrests[ss,])
# Compute fuzzy clustering
cm <- cmeans(df, 4)
# Visualize using corrplot
corrplot(cm$membership, is.corr = FALSE)

my_cols <- c("#00AFBB", "#E7B800", "#FC4E07")  
pairs(iris[,1:4], pch = 19,  cex = 0.5,
      col = my_cols[iris$Species],
      lower.panel=NULL)

fviz_nbclust(iris[, 1:4], kmeans, method = "silhouette")
spe.KM.cascade<-cascadeKM(iris[,1:4],inf.gr=2, sup.gr=10, iter=100, criterion='calinski')
plot(spe.KM.cascade,sortg=TRUE)

set.seed(1)
irisCluster<-kmeans(iris[, 1:4], 3, nstart= 20)
table(irisCluster$cluster, iris$Species)
irisCluster$cluster<-as.factor(irisCluster$cluster)
plot7<-ggplot(iris, aes(Petal.Length, Petal.Width, color = irisCluster$cluster + geom_point()
plot8<-ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point()
grid.arrange(plot7, plot8, ncol=2)

tree1<-tree(Species~Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, data=iris)
summary(tree1 )
plot(tree1)
text(tree1)

tree2 <- rpart(Species ~ ., data=iris, method="class")
fancyRpartPlot(tree2, main="Iris")

# Extra to exciting your curiosity
iris.rf=randomForest(Species~., data=iris, importance=TRUE, proximity=TRUE, ntree=500)
# Required number of trees gives errors for each species and the average for all species (black):
plot(iris.rf,lty=2)
# Misclassification error rates:
iris.rf$confusion
# Importance of individual predictor variables for classification (the further the value is on the right of the plot, the more important):
varImpPlot(iris.rf)
# The membership of a particular class as a function of a variable value can be displayed with this
partialPlot(iris.rf,iris,Petal.Width,"setosa")
# we can predict unclassified observations. We make up some sample new observations from the original dataset to save some time importing (the first three rows are P. setosa, lets see if RandomForest gets that right:
newobs=iris[1:3,1:4]
predict(iris.rf,newobs)
# This last plot conveys the confidence in your predictions for each individual sample. Colors represent species and points are samples. In this case, many samples can be predicted with great certainty (1) and only few classifications are questionable (approaching 0)
plot(margin(iris.rf))

data(doubs)
spe.norm<-decostand(doubs$fish[-8,], 'nor')
env<-doubs$env[-8,]

# par(mfrow=c(1,2))
spe.ch.mvpart <-
  mvpart(data.matrix(spe.norm)~.,
         env,
         margin = 0.08,
         cp=0,
         xv='min', # try 'pick' best number, '1se'
         xval=nrow(spe),
         xvmult = 100
         )

# create a list of 80% of the rows in the original dataset that we can use for training
validation_index <- createDataPartition(iris$Species, p=0.80, list=FALSE)
# select 20% of the data for validation
validation <- iris[-validation_index,]
# use the remaining 80% of data to training and testing the models
idataset <- iris[validation_index,]

# Run algorithms using 10-fold cross validation
control <- trainControl(method="cv", number=10)
metric <- "Accuracy"

# lda
set.seed(10)
fit.lda <- train(Species~., data=idataset, method="lda", metric=metric, trControl=control)
# CART
set.seed(10)
fit.cart <- train(Species~., data=idataset, method="rpart", metric=metric, trControl=control)
# kNN
set.seed(10)
fit.knn <- train(Species~., data=idataset, method="knn", metric=metric, trControl=control)
# Random Forest
set.seed(10)
fit.rf <- train(Species~., data=idataset, method="rf", metric=metric, trControl=control)

# summarize accuracy of models
results <- resamples(list(lda=fit.lda, cart=fit.cart, knn=fit.knn, rf=fit.rf))
summary(results)$statistics$Accuracy

# summarize Best Model
print(fit.lda)

# estimate skill of LDA on the validation dataset
predictions <- predict(fit.lda, validation)
confusionMatrix(predictions, validation$Species)

data(varespec)
decorana(varespec)
data(doubs)
doubspec<-doubs$fish[-8,]
decorana(doubspec)

# PCA on on the full data varechem dataset
# arg scale =T, standardize our variables within the rda function
data(varechem)
env<-varechem
env.pca<-rda(env, scale=T) 
env.pca
summary(env.pca) # default scaling 2

# Plots using biplot
# To help memorize the meaning of the scalings, vegan now accepts argument scaling = "sites" for scaling 1 and scaling="species" for scaling 2. This is true for all vegan functions involving scalings
par(mfrow = c(1, 2))
biplot(env.pca, scaling = 1, main = "PCA - scaling 1")
biplot(env.pca, main = "PCA - scaling 2") # Default scaling 2

# Plots using cleanplot.pca
cleanplot.pca(env.pca)
dev.off()

summary(env.pca)$species

summary(env.pca)$site

screeplot(env.pca, bstick = TRUE, npcs = length(env.pca$CA$eig))

par(mfrow = c(1, 2))
cleanplot.pca(env.pca)
dev.off()

# combining clustering and ordination results
biplot(env.pca, main='PCA - scaling 1',scaling=1) 
ordicluster(env.pca, 
            hclust(dist(scale(env)), 'ward.D'), 
            prune=3, col = "blue", scaling=1)

# Hellinger pre-transformation of the species data
data(varespec)
spe<-varespec
spe.h<-decostand(spe,'hellinger')

# DCA + RDA
decorana (spe.h)
spe.h.pca<-rda(spe.h)
screeplot(spe.h.pca,bstick = TRUE, npcs = length(spe.h.pca$CA$eig))

# plot PCA
cleanplot.pca (spe.h.pca)

#A posteriori projection of environmental variables in a PCA
# A PCA scaling 2 plot is produced in a new graphic window.
biplot(spe.h.pca, main = "PCA - scaling 2")
# Scaling 2 is default
(spe.h.pca.env <- envfit(spe.h.pca, env, scaling = 2))
# Plot significant variables with a user -selected colour
plot(spe.h.pca.env, p.max = 0.05, col = 3)
# This has added the significant environmental variables to the
# last biplot drawn by R.
# BEWARE: envfit() must be given the same scaling as the plot to 
# which its result is added!

carp.chemistry<-read.table ('https://www.dipintothereef.com/uploads/3/7/3/5/37359245/carp.chemistry.txt',header=T, sep=",",row.names=1)
carp.spec<-read.table ('https://www.dipintothereef.com/uploads/3/7/3/5/37359245/carp.vasc_plants.txt',header=T, sep=",",row.names=1)

#environmental data and RDA
chem$slope<-NULL
stand.chem <- scale (chem)
PCA1 <- rda (stand.chem) 

# broken stick
screeplot(PCA1,bstick = TRUE, npcs = length(PCA1$CA$eig))

# Keiser-Guttman Criteron (above average eigen value)
ev<-PCA1$CA$eig
barplot(ev, main='Eigenvalues',col='bisque',las=2)
abline(h=mean(ev),col='red') # average eigenvalue
legend('topright','Average eigenvalue',lwd=1,col=2,bty='n')

#biplot
clean.plot (PCA1)

spe.ca<-cca(spe) #default summary for "scaling = 2" 
screeplot(spe.ca, bstick = TRUE, npcs = length(spe.ca$CA$eig))
ev2<-spe.ca$CA$eig # extract eigen value
evplot(ev2)

# CA biplots
par(mfrow=c(1,2))
# Scaling 1: sites are centroids of species
plot(spe.ca,scaling=1,main='CA - biplot scaling 1')
# Scaling 2: species are centroids of species
plot(spe.ca,main='CA - biplot scaling 2')

# CA biplots
par(mfrow=c(1,2))
# Scaling 1: sites are centroids of species
ordiplot(spe.ca,scaling=1,main='CA - biplot scaling 1')
# Scaling 2: species are centroids of species
ordiplot(spe.ca,main='CA - biplot scaling 2')
dev.off()

# A posteriori projection of environmental variables in a CA
# The last plot produced (CA scaling 2) must be active
plot(spe.ca,main='CA- biplot scaling 2')
spe.ca.env <-envfit(spe.ca,env)
plot(spe.ca.env)
# It added the environment variables to the last biplot drawn

plot(spe.ca, main = "CA - scaling 2",
sub = "Fitted curves: humdepth (red), Baresoil (green)")
spe.ca.env <- envfit(spe.ca ~ Humdepth + Baresoil, env)
plot(spe.ca.env) # Two arrows
ordisurf(spe.ca, env$Humdepth, add = TRUE)
ordisurf(spe.ca, env$Baresoil, add = TRUE, col = "green")

doubs.dca<-decorana(doubspec)
plot(doubs.dca)

# PCoA on a Bray-Curtis dissimilarity matrix of fish species
spe.bray<-vegdist(spe)
spe.b.pcoa<-cmdscale(spe.bray, eig=TRUE, add=T)
# Plot of the sites and weighted average projection of species
ordiplot(spe.b.pcoa, type='t', main='PCoAwith species')
abline(h=0,lty=3)
abline(v=0, lty=3)
# add species (weighted average species abundance)
spe.wa<-wascores(spe.b.pcoa$points[,1:2],spe)
text (spe.wa,rownames(spe.wa),cex=0.7,col='red')

doubspec.bray<-vegdist(doubspec)
doubspec.bray.pcoa<-pcoa(doubspec.bray)
biplot.pcoa(doubspec.bray.pcoa,doubspec)
abline(h=0,lty=3)
abline(v=0,lty=3)

spe.nmds<-metaMDS(spe,distance='bray',trymax=999)
spe.nmds
spe.nmds$stress
plot(spe.nmds,type='t',main=paste('NMDS/Bray–Stress =',round(spe.nmds$stress,3)))

stressplot(spe.nmds, main='Shepard plot')

# goodness of fit
gof<-goodness(spe.nmds)
plot(spe.nmds,type='t',main='Goodness of fit')
points(spe.nmds, display='sites', cex=gof*90)

# Add colours from a clustering results to an NMDS plot
# Ward clustering of Bray-Curtis dissimilarity matrix
spe.bray.ward <- hclust(spe.bray,'ward.D')
spe.bw.groups <- cutree(spe.bray.ward,k=4)
grp.lev <- levels(factor(spe.bw.groups))

# combination with NMDS result 
sit.sc <- scores(spe.nmds)
p <- ordiplot (sit.sc, type='n', main='NMDS/BRAY – clusters Ward/Bray')
for (i in 1:length(grp.lev)) {
  	points(sit.sc$sites[spe.bw.groups==i,],pch=(14+	i),cex=2, col=i+1)
	}
text(sit.sc$sites,row.names(spe),pos=4,cex=0.7)
#add the dendrogram
ordicluster(p,spe.bray.ward,col='dark grey')

# using locator you need to point out where you want to put the legend
# legend(locator(1), paste('Group',c(1:length(grp.lev))),pch=14+c(1:length(grp.lev)), col=1+c(1:length(grp.lev)),pt.cex=2)

data(dune)
data(dune.env)
attach(dune.env)
NMDS.dune<-metaMDS(dune,distance='bray')
plot(NMDS.dune,type='t',main=paste('NMDS/Bray – Stress =',round(NMDS.dune$stress,3)))
pl<-ordihull(NMDS.dune, Management, scaling = 3, draw='polygon',col='grey')
ordispider(pl, col="red", lty=3, label = TRUE)
# ?anosim
# ?adonis

data(varespec)
data(varechem)
vare.dist <- vegdist(varespec)
vare.mds <- metaMDS(vare.dist)
ordisurf(vare.mds ~ Baresoil, varechem, bubble = 5)

RDA <- rda (Y, X, W) 

RDA <- rda (Y ~ var1 + factorA + var2*var3 + Condition (var4), data = XW)

# import the data
data (doubs)
spe <- doubs$fish
env <- doubs$env
spa <- doubs$xy 
# remove empty site 8
spe<-spe[-8,]
env<-env[-8,]
# set aside the variable 'dfs' (distance from the source) for later use
dfs<-env[,1]
#remove the 'dfs' variable from the env dataset
env<-env[,-1]
#recode the slope variable (slo) into a factor (qualitative) variable (to show how these are handled in the ordinations)
slo2<-rep('very_steep',nrow(env))
slo2[env$slo<=quantile(env$slo)[4]] = 'steep'
slo2[env$slo<=quantile(env$slo)[3]] = 'moderate'
slo2[env$slo<=quantile(env$slo)[2]] = 'low'
slo2 <- factor(slo2,levels=c('low','moderate','steep','very_steep'))
# create an env2 data frame with slope as a qualitative variable
env2<-env
env2$slo<-slo2
# create two subsets of explanatory variables
# Physiography (upstream-downstream gradient
envtopo<-env[,c(1:3)] # names(envtopo), covariate matrix isolated form env
# water quality 
envchem <- env[,c(4:10)] # names(envchem), env. matrix isolated form env
# Hellinger-transform the species dataset
spe.hel<-decostand(spe,'hellinger') # spe matrix

spe.rda <- rda(spe.hel~.,env2) 
summary (spe.rda) # scaling 2 (default)

coef(spe.rda)

#Retrieval of the adjusted R2
# Unadjusted R2 retrieve from RDA results
R2<-RsquareAdj(spe.rda)$r.squared
# Adjusted R2 retrieve from RDA object
R2adj<-RsquareAdj(spe.rda)$adj.r.squared

# triplot of the rda results
par(mfrow = c(2, 2))

# site scores are weighted by sum of species
# scaling 1: distance triplot
plot (spe.rda, scaling=1, main='Triplot RDA spe.hel ~ env – scaling 1 – wa scores')
spe.sc <- scores (spe.rda, choices=1:2, scaling=1, display='sp') 
arrows (0,0, spe.sc[,1],spe.sc[,2],length=0,lty=1,col='red') 

# scaling 2 (default)
plot (spe.rda,main='Triplot RDA spe.hel ~ env – scaling 2 – wa scores')
spe2.sc <- scores (spe.rda, choices=1:2, display='sp')
arrows (0,0, spe2.sc[,1],spe2.sc[,2],length=0,lty=1,col='red')

# site scores are linear combinations of the environmental variables
# scaling 1
plot (spe.rda,scaling=1,display=c('sp','lc','cn'),main='Triplot RDA spe.hel ~ env – scaling 1 – lc scores')
arrows (0,0, spe.sc[,1],spe.sc[,2],length=0,lty=1,col='red')
# scaling 2
plot (spe.rda,display=c('sp','lc','cn'),main='Triplot RDA spe.hel ~ env – scaling 2 – lc scores') # cn for centroids
arrows (0,0, spe2.sc[,1],spe2.sc[,2],length=0,lty=1,col='red')

# Global test of the RDA results
anova.cca(spe.rda,step=1000)

# Test of all canonical axes
anova.cca(spe.rda,by='axis',step=1000)

# Partial RDA: effect of water chemistry, holding physiography constant

# simple interface; X and W may be separate tables of quantitative variales

spechem.physio <- rda(spe.hel,envchem,envtopo)
spechem.physio
summary(spechem.physio)

# formula interface; X and W must be in the same data fram
class(env)
spechem.physio2<-rda(spe.hel~pH+har+pho+nit+amm+oxy+bdo+Condition(alt+slo+flo), data=env)
spechem.physio2
summary(spechem.physio2)

# the results of the two analyses are identical
# check in the output: four components in the partitioning variance instead of 3

# Test of the partial RDA (using the results with the formula interface to allow the tests of the axes to be run)

anova.cca(spechem.physio2,step=1000)
anova.cca(spechem.physio2,step=1000,by='axis')

# partial RDA triplots (with fitted site score)
par(mfrow=c(1,2))
#scaling 1
plot(spechem.physio,scaling=1,display=c('sp','lc','cn'), main='Triplot RDA spe.hel ~ chem | topo – scaling 1 – lc scores')
spe3.sc <- scores(spechem.physio,choices=1:2,scaling=1, display='sp')
arrows(0,0,spe3.sc[,1],spe3.sc[,2],length=0,lty=1,col='red')

#scaling 2
plot(spechem.physio,display=c('sp','lc','cn'), main='Triplot RDA spe.hel ~ chem | topo – scaling 2 – lc scores')
spe4.sc <- scores(spechem.physio,choices=1:2,display='sp')
arrows(0,0,spe4.sc[,1],spe4.sc[,2],length=0,lty=1,col='red')

# Variance inflation factor (VIF) in two RDAs 
# First RDA: all environmental variables
vif.cca(spe.rda)
# Second RDA: subset of environmental variables
vif.cca (spechem.physio)
# A reduction is justified !!!

# Forward selection using ordistep() function. This function allows the use of factors. Options are also available for stepwise and backward selection of the explanatory variables
spe.rda.all<-rda(spe.hel~.,data=env)
step.forward1 <- ordistep(rda(spe.hel~1,data=env), scope=formula(spe.rda.all),direction='forward',pstep=1000)
step.forward2 <- ordiR2step(rda(spe.hel~1,data=env), scope=formula(spe.rda.all),direction='forward',pstep=1000)

spe.rda.pars <- rda(spe.hel~alt+oxy+bdo, data=env)
spe.rda.pars
anova.cca(spe.rda.pars,step=1000)
anova.cca(spe.rda.pars,step=1000,by='axis')
vif.cca(spe.rda.pars)
R2a.pars <- RsquareAdj(spe.rda.pars)$adj.r.squared

# Triplots of the parsimonious RDA (with fitted site scores)
# scaling 1

plot(spe.rda.pars,scaling=1,display=c('sp','lc','cn'),main='Triplot RDA spe.hel ~ alt+oxy+bdo – scaling 1 – lc scores')
spe4.sc <- scores(spe.rda.pars, choices=1:2, scaling=1,display='sp')
arrows(0,0,spe4.sc[,1],spe4.sc[,2],length=0,lty=1, col='red')

# scaling 2

plot(spe.rda.pars, display=c('sp','lc','cn'),main='Triplot RDA spe.hel ~ alt+oxy+bdo – scaling 2 – lc scores')
spe5.sc <- scores(spe.rda.pars, choices=1:2,display='sp')
arrows(0,0,spe5.sc[,1],spe5.sc[,2],length=0,lty=1, col='red')

# since there is now a third significant canonical axis, you could compute other combinations: axes 1 and 3, axes 2 and 3

# Variation partitioning with two sets of explanatory variables
# and all explanatory variables
showvarparts(2)# explanation fraction labels for two explanatory matrices
spe.part.all <- varpart(spe.hel,envchem,envtopo)
spe.part.all
plot(spe.part.all, digits=2)

# distance-based redundancy analysis
spe.bray <- vegdist (spe,'bray')
#response matrix can be raw data
dbrda1<-capscale(spe~pH+har+pho+nit+amm+oxy+bdo+ Condition(alt+slo+flo), distance='bray', data=env,add=T) 
# response matrix can be a dissimilarity matrix
dbrda2<-capscale(spe.bray~pH+har+pho+nit+amm+oxy+bdo+ Condition(alt+slo+flo), distance='bray', data=env,add=T) 
```{.r .distill-force-highlighting-css}
```
