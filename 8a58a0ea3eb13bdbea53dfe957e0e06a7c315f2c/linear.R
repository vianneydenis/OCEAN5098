xaringanExtra::use_clipboard()









library(Hmisc)
library(corrplot)
library(MASS)
library(car)
library(interactions)
library(yarrr)
library(tidyr)
library(readr)
library(lme4)
library (lmerTest)
library(nlme)
library(gvlma)
library(simpleboot)
library(DAAG)
library(bootstrap)
library(MBESS)
library(leaps)
library(sandwich)
library(dplyr)

# correlation
rairuoho<-read.table('https://www.dipintothereef.com/uploads/3/7/3/5/37359245/rairuoho.txt',header=T, sep="\t", dec=".")
cor.test(rairuoho$day6, rairuoho$day7)

corr<-cor(rairuoho[,1:6])
corr # cor.test does not work on Matrix

p.val<-rcorr(as.matrix(rairuoho[,1:6]))$P
corrplot(corr,type='upper',method='color', addCoef.col = "black", p.mat=as.matrix(p.val), sig.level = 0.05,title = "Correlation Matrix", mar = c(2,0,2,0), diag=F)

plot(rairuoho$day6, rairuoho$day7)
abline(lm(rairuoho$day7~rairuoho$day6), col="red", lwd=2)
# remember `ggplot`
# ggplot(rairuoho, aes(x = day6, y = day7)) + 
#  geom_point() +
#  stat_smooth(method = "lm", col = "red")

model1 <- lm(Petal.Width ~ Petal.Length, data = iris)
model1$coefficients

ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) +
  geom_point(aes(fill=Species),shape = 21, size=5) +
  stat_smooth(method = "lm", col = "blue")

summary(model1)

confint(model1)

sigma(model1)*100/mean(iris$Petal.Width)

fit1 <- lm(Petal.Width ~ Petal.Length + Sepal.Width + Sepal.Length, data = iris)
summary(fit1)

# Other useful functions
coefficients(fit1) # model coefficients
confint(fit1, level=0.95) # CIs for model parameters
fitted(fit1) # predicted values
residuals(fit1) # residuals
anova(fit1) # anova table
vcov(fit1) # covariance matrix for model parameters
influence(fit1) # regression diagnostics

# diagnostic plots
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page
plot(fit1)

# Assessing Outliers
outlierTest(fit1) # Bonferonni p-value for most extreme obs
qqPlot(fit1, main="QQ Plot") #qq plot for studentized resid
leveragePlots(fit1) # leverage plots

# Influential Observations
# added variable plots
avPlots(fit1)
# Cook's D plot
# identify D values > 4/(n-k-1)
cutoff <- 4/((nrow(iris)-length(fit1$coefficients)-2))
plot(fit1, which=4, cook.levels=cutoff)
# Influence Plot
influencePlot(fit1, id.method="identify", main="Influence Plot", sub="Circle size is proportial to Cook's Distance" )

# Normality of Residuals
# qq plot for studentized resid
qqPlot(fit1, main="QQ Plot")
# distribution of studentized residuals
sresid <- studres(fit1)
hist(sresid, freq=FALSE,
   main="Distribution of Studentized Residuals")
xfit<-seq(min(sresid),max(sresid),length=40)
yfit<-dnorm(xfit)
lines(xfit, yfit)

# Evaluate homoscedasticity
# non-constant error variance test
ncvTest(fit1)
# plot studentized residuals vs. fitted values
spreadLevelPlot(fit1)

corr<-cor(iris[,1:3])
p.val<-rcorr(as.matrix(iris[,1:3]))$P
corrplot(corr,type='upper',method='color', addCoef.col = "black",  p.mat=as.matrix(p.val), sig.level = 0.05,diag=F)

# Evaluate Collinearity
car::vif(fit1) # variance inflation factors
sqrt(car::vif(fit1)) > 2 # problem?

# Evaluate Nonlinearity
# component + residual plot
crPlots(fit1)
# Ceres plots
ceresPlots(fit1)

# Test for Autocorrelated Errors
durbinWatsonTest(fit1)

gvmodel <- gvlma(fit1)
summary(gvmodel)

boxcoxfit <- boxcox(fit1,plotit=T)
# also see `boxCox` from **car**
# also see `BoxCoxTrans` from **caret** for individual variable

lambda <- boxcoxfit$x[which.max(boxcoxfit$y)]

#fit new linear regression model using the Box-Cox transformation
new_fit <- lm(((iris$Petal.Width^lambda-1)/lambda) ~ Petal.Length + Sepal.Width + Sepal.Length, data = iris)

gvlma(new_fit)
# not better at all

set.seed(2021)
n <- 1000
x <- rnorm(n)
y <- x + rnorm(n)
population.data <- as.data.frame(cbind(x, y))

sample.data <- population.data[sample(nrow(population.data), 20, replace = TRUE),]

population.model <- lm(y~x, population.data)
summary (population.data)

sample.model <- lm(y~x, sample.data)
summary (sample.model)

#Plotting the models
plot(y ~ x, col = "gray", main = 'Population and Sample Regressions')
abline(coef(population.model)[1], coef(population.model)[2], col = "red")
abline(coef(sample.model)[1],
       coef(sample.model)[2],
       col = "blue",
       lty = 2)
legend(
  "topleft",
  legend = c("Sample", "Population"),
  col = c("red", "blue"),
  lty = 1:2,
  cex = 0.8)

# Containers for the coefficients
sample_coef_intercept <- NULL
sample_coef_x1 <- NULL

for (i in 1:1000) {
  #Creating a resampled dataset from the sample data
  sample_d = sample.data[sample(1:nrow(sample.data), nrow(sample.data), replace = TRUE), ]
  
  #Running the regression on these data
  model_bootstrap <- lm(y ~ x, data = sample_d)
  
  #Saving the coefficients
  sample_coef_intercept <-
    c(sample_coef_intercept, model_bootstrap$coefficients[1])
  
  sample_coef_x1 <-
    c(sample_coef_x1, model_bootstrap$coefficients[2])
}

coefs <- rbind(sample_coef_intercept, sample_coef_x1)

# Combining the results in a table
means.boot = c(mean(sample_coef_intercept), mean(sample_coef_x1))
knitr::kable(round(
  cbind(
    population = coef(summary(population.model))[, 1],
    sample = coef(summary(sample.model))[, 1],
    bootstrap = means.boot),4), 
  "simple", caption = "Coefficients in different models")

a <-
  cbind(
    quantile(sample_coef_intercept, prob = 0.025),
    quantile(sample_coef_intercept, prob = 0.975))
b <-
  cbind(quantile(sample_coef_x1, prob = 0.025),
        quantile(sample_coef_x1, prob = 0.975))

c <-
  round(cbind(
    population = confint(population.model),
    sample = confint(sample.model),
    boot = rbind(a, b)), 4)
colnames(c) <- c("2.5 %", "97.5 %",
                 "2.5 %", "97.5 %",
                 "2.5 %", "97.5 %")
knitr::kable(rbind(
  c('population',
    'population',
    'sample',
    'sample',
    'bootstrap',
    'bootstrap'),c),caption = "Precision of the confidence intervals")


#Predicting on new data
new.data = seq(min(x), max(x), by = 0.05)
conf_interval <-
  predict(
    sample.model,
    newdata = data.frame(x = new.data),
    interval = "confidence",
    level = 0.95)

#Plotting the results on the project step-by-spep
plot(
  y ~ x,
  col = "gray",
  xlab = "x",
  ylab = "y",
  main = "Compare regressions")
apply(coefs, 2, abline, col = rgb(1, 0, 0, 0.03))

plot(
  y ~ x,
  col = "gray",
  xlab = "x",
  ylab = "y",
  main = "Compare regressions")
apply(coefs, 2, abline, col = rgb(1, 0, 0, 0.03))
abline(coef(population.model)[1], coef(population.model)[2], col = "blue")
abline(coef(sample.model)[1],
       coef(sample.model)[2],
       col = "black",
       lty = 2, lwd=3)
abline(mean(sample_coef_intercept),
       mean(sample_coef_x1),
       col = "green",
       lty = 4, lwd=3)

plot(
  y ~ x,
  col = "gray",
  xlab = "x",
  ylab = "y",
  main = "Compare regressions")
apply(coefs, 2, abline, col = rgb(1, 0, 0, 0.03))
abline(coef(population.model)[1], coef(population.model)[2], col = "blue")
abline(coef(sample.model)[1],
       coef(sample.model)[2],
       col = "black",
       lty = 2, lwd=3)
abline(mean(sample_coef_intercept),
       mean(sample_coef_x1),
       col = "green",
       lty = 4, lwd=3)
lines(new.data, conf_interval[, 2], col = "black", lty = 3, lwd=3)
lines(new.data, conf_interval[, 3], col = "black", lty = 3, lwd=3)
legend("topleft",
       legend = c("Bootstrap", "Population", 'Sample'),
       col = c("red", "blue", 'green'),
       lty = 1:3,
       cex = 0.8)

fit1 <- lm(Petal.Width ~ Petal.Length + Sepal.Width + Sepal.Length, data = iris) # sqrt(vif(fit1)) >2 not good
fit2 <- lm(Petal.Width ~ Sepal.Width + Sepal.Length, data = iris)
sqrt(car::vif(fit2)) >2 # okay
gvlma(fit2)
boxcoxfit2 <- boxcox(fit2,plotit=T)
lambda2 <- boxcoxfit2$x[which.max(boxcoxfit2$y)]
new_fit2 <- lm(((iris$Petal.Width^lambda2-1)/lambda2) ~  Sepal.Width + Sepal.Length, data = iris)
gvlma(new_fit2)

fit2.boot<-lm.boot(fit2, R=1000)
summary(fit2.boot)

# can specify casewise or residual sampling with the method argument
fit3.boot <- Boot(fit2, f=coef, R=1000, method=c("case"))
summary(fit3.boot, high.moments=T)

# K-fold cross-validation
cv.lm(iris, fit2, m=3) # 3 fold cross-validation

# Assessing R2 shrinkage using 10-Fold Cross-Validation
# define functions
theta.fit <- function(x,y){lsfit(x,y)}
theta.predict <- function(fit,x){cbind(1,x)%*%fit$coef}
# matrix of predictors
X <- as.matrix(iris[c("Sepal.Width","Sepal.Length")])
# vector of predicted values
y <- as.matrix(iris[c("Petal.Width")])
results <- crossval(X,y,theta.fit,theta.predict,ngroup=3)
cor(y, fit2$fitted.values)**2 # raw R2
cor(y,results$cv.fit)**2 # cross-validated R2

data(prof.salary)

fit.prof1 <- lm(salary~pub, data=prof.salary)
fit.prof2  <- lm(salary~citation, data=prof.salary)
fit.prof3 <- lm(salary~pub+citation, data=prof.salary)
fit.prof4  <- lm(salary~citation+pub, data=prof.salary)

# compare model 3 to model 1 - stepping approach, evaluating a new variable (cits)
anova(fit.prof1,fit.prof3)# note this is anova, not Anova

# compare model 3 to model 2 - stepping approach, evaluating a new variable (pubs)
anova(fit.prof2,fit.prof3)# note this is anova, not Anova

BIC(fit.prof1); BIC(fit.prof2);BIC(fit.prof3)
AIC(fit.prof1); AIC(fit.prof2);AIC(fit.prof3)

# Stepwise Selection based on AIC
fit.prof5  <- lm(salary~citation+pub+time, data=prof.salary)
step1 <- stepAIC(fit.prof5, direction="both")
step1$anova # display results


#Stepwise Selection with BIC
n<-dim(prof.salary)[1]
step2 <- stepAIC(fit.prof5, k=log(n), direction="both")
step2$anova # display results

# All Subsets Regression
leaps<-regsubsets(salary~citation+pub+time, data=prof.salary,nbest=10)
# view results
summary(leaps)
# plot a table of models showing variables in each model.
# models are ordered by the selection statistic.
plot(leaps,scale="r2")
# plot statistic by subset size
# subsets(leaps, statistic="rsq")

fit.prof6  <- lm(salary~citation+time, data=prof.salary)
# gvlma(fit.prof6)
summary(fit.prof6)

summary(fit.prof6)$coefficient

confint(fit.prof6)

sigma(fit.prof6)/mean(prof.salary$salary)

model.full <- lm(salary ~., data = prof.salary)

model.partial1 <- lm(salary ~. -sex, data = prof.salary)

model.partial2 <-  update(model.full,  ~. -sex)

students<-read.table('https://www.dipintothereef.com/uploads/3/7/3/5/37359245/students.txt',header=T, sep="\t", dec='.') 
lm.cat<-lm(shoesize~gender, data=students)
anova(lm.cat)

iris.lm<-lm(Petal.Width ~ Species, data=iris)
summary(iris.lm)
anova(iris.lm)

pirateplot(formula = time ~ cleaner + type,
           data = poopdeck,
           ylim = c(0, 150),
           xlab = "Cleaner",
           ylab = "Cleaning Time (minutes)",
           main = "poopdeck data",
           back.col = gray(.97), 
           cap.beans = TRUE, 
           theme = 2)

# Step 1: Create an aov object
mod.aov <- aov(formula = y ~ x1 + x2 + ..., data = data)

# Step 2: Look at a summary of the aov object
summary(mod.aov)

# Step 3: Calculate post-hoc tests
TukeyHSD(mod.aov)

# Step 4: Look at coefficients
mod.lm <- lm(formula = y ~ x1 + x2 + ..., data = data)
summary(mod.lm)

pirateplot(time ~ cleaner, 
                  data = poopdeck, 
                  theme = 2, 
                  cap.beans = TRUE,
                  main = "formula = time ~ cleaner")

# Step 1: aov object with time as DV and cleaner as IV
cleaner.aov <- aov(formula = time ~ cleaner, data = poopdeck)

# Step 2: Look at the summary of the anova object
summary(cleaner.aov)

# Step 3: Conduct post-hoc tests
TukeyHSD(cleaner.aov)

# Step 4: Create a regression object
cleaner.lm <- lm(formula = time ~ cleaner, data = poopdeck)
summary(cleaner.lm)

# Step 1: aov object with time as DV and cleaner and type as IV
cleaner.type.aov <- aov(formula = time ~ cleaner + type, data = poopdeck)

# Step 2: Get ANOVA table with summary()
summary(cleaner.type.aov)

# Step 3: Conduct post-hoc tests
TukeyHSD(cleaner.type.aov)

# Step 4: Look at regression coefficients
cleaner.type.lm <- lm(formula = time ~ cleaner + type, data = poopdeck)
summary(cleaner.type.lm)

# Step 1: Create ANOVA object with interactions
cleaner.type.int.aov <- aov(formula = time ~ cleaner * type, data = poopdeck)
# Step 2: Look at summary table
summary(cleaner.type.int.aov)

# Step 4: Calculate regression coefficients
cleaner.type.int.lm <- lm(formula = time ~ cleaner * type, data = poopdeck)
summary(cleaner.type.int.lm)

cat_plot(cleaner.type.int.lm, pred = cleaner, modx = type, interval = TRUE)

# Step 1: Calculate regression object with lm()
time.lm <- lm(formula = time ~ type + cleaner, data = poopdeck)

# Type I ANOVA - aov()
time.I.aov <- aov(time.lm)
# or anova(time.lm)

# Type II ANOVA - Anova(type = 2)
time.II.aov <- car::Anova(time.lm, type = 2)

# Type III ANOVA - Anova(type = 3)
time.III.aov <- car::Anova(time.lm, type = 3)

# Are observations in the poopdeck data balanced?
with(poopdeck, table(cleaner, type)) 

names(cleaner.type.int.aov)

poopdeck$int.fit <- cleaner.type.int.aov$fitted.values
poopdeck$me.fit <- cleaner.type.aov$fitted.values

mean(abs(poopdeck$int.fit - poopdeck$time))
mean(abs(poopdeck$me.fit - poopdeck$time))

shapiro.test(cleaner.type.int.aov$residuals) # test our residuals vs a normal distribution
bartlett.test(cleaner.type.int.aov$residuals ~ interaction(cleaner, type), data = poopdeck) # test variance of our residuals in the different groups.

AWARD <- read.csv("https://stats.idre.ucla.edu/stat/data/poisson_sim.csv")
AWARD <- within(AWARD,{
  prog <- factor(prog, levels=1:3, labels=c("General", "Academic","Vocational"))
  id <- factor(id)
})
summary(AWARD)

AWARD.hist <- ggplot(AWARD, aes(num_awards, fill=prog)) +
  geom_histogram(binwidth = .5,  position="dodge") 

AWARD.hist

summary(m1 <- glm(num_awards ~ prog + math, family="poisson", data=AWARD))

cov.m1 <- vcovHC(m1, type="HC0")
std.err <- sqrt(diag(cov.m1))
r.est <- cbind(Estimate= coef(m1), "Robust SE" = std.err,
"Pr(>|z|)" = 2 * pnorm(abs(coef(m1)/std.err), lower.tail=FALSE),
LL = coef(m1) - 1.96 * std.err,
UL = coef(m1) + 1.96 * std.err)
r.est

with(m1, cbind(res.deviance = deviance, df = df.residual,
  AWARD = pchisq(deviance, df.residual, lower.tail=FALSE)))

## calculate and store predicted values
AWARD$phat <- predict(m1, type="response")

## order by program and then by math
AWARD <- AWARD[with(AWARD, order(prog, math)), ]

## create the plot
ggplot(AWARD, aes(x = math, y = phat, colour = prog)) +
  geom_point(aes(y = num_awards), alpha=.5, position=position_jitter(h=.2)) +
  geom_line(size = 1) +
  labs(x = "Math Score", y = "Expected number of awards")

Weevil_damage <- read.csv("Data/Weevil_damage.csv")
Weevil_damage$block <- as.factor(Weevil_damage$block) # Making block a factor
weevil.m <- glm(damage_T_F ~ block, family = binomial, data = Weevil_damage)
summary(weevil.m)

rairuoho$ID<-rownames(rairuoho)
rai<-rairuoho %>% pivot_longer(day3:day8, names_to = "day", values_to = "length")
rai$day<-parse_number(rai$day)
rai


ggplot(rai, aes(x = day, y = length)) +
  geom_point() +
  scale_x_continuous(breaks = 0:9)+
  facet_wrap(~ID)

lmer.rai<-lmer(length ~ day + (1|ID), data=rai, REML=TRUE) # REML default
summary(lmer.rai)


newdata <- crossing(ID = rai %>% pull(ID),
  day = 3:8)

head(newdata)

newdata2 <- newdata %>%
  mutate(length = predict(lmer.rai, newdata))

# plot
ggplot(rai, aes(x = day, y = length)) +
  geom_line(data = newdata2,
            color = 'blue') +
  geom_point() +
  scale_x_continuous(breaks = 0:7) +
  facet_wrap(~ID) +
  labs(y = "Length", x = "Days")

anova(lmer.rai)

rand(lmer.rai)

lme.rai = lme(length ~ day, random=~1|ID, data=rai)
summary(lme.rai)

lm.rai<-lm(length ~ day, data= rai)
anova (lme.rai, lm.rai)
```{.r .distill-force-highlighting-css}
```
