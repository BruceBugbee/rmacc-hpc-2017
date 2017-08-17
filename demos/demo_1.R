#RMACC 2017
#Intro to R
#Demo 1


# Preamble ----------------------------------------------------------------

rm(list = ls()) #I prefer to clear my workspace whenever I start a new script
library(tidyverse) #loads some common packages I like to use. We won't need most of these...


# Data Import -------------------------------------------------------------

dat <- read.csv(file = "./2015_fuel_econ.csv") 
head(dat)
glimpse(dat)


# Initial Exploration -----------------------------------------------------

#What exactly is in this data set?

dim(dat)
N_cars = nrow(dat)

#Lots of categories...
table(dat$make)
table(dat$model)
table(dat$class)
table(dat$drive)
table(dat$fuel)
table(dat$cyl) #notice how it is an int but should be a category

#Let's change the cyl column to be an ordered factor
cyl <- dat$cyl
dat$cyl <- factor(cyl, ordered = T)
dat$cyl

#Some numerical data
summary(dat$hwy)
summary(dat$cty)


# Visual exploration ------------------------------------------------------

#Can only get so far looking at ranges and summaries. Let's look at some pretty pictures!
hist(dat$hwy)
boxplot(dat$cty)
plot(dat$hwy, dat$cty, col = "red", pch = 20, cex = 1.5,
     xlab = "Highway MPG", ylab = "City MPG")

#What if I want to color by fuel type?
plot(dat$hwy, dat$cty, col = dat$fuel, pch = 20, cex = 1.5,
     xlab = "Highway MPG", ylab = "City MPG")
legend(x = "topleft", legend = levels(dat$fuel), pch = 20,
       col = 1:length(levels(dat$fuel)))

# Stat Question 1: Model for City MPG ----------------------------------

#Can we build a simple model for predicting City MPG?

#linear regression for hwy only
mod <- lm(cty ~ hwy, data = dat)
mod
summary(mod) #lots of stats information

plot(mod) #diagnostic plots

plot(dat$hwy, dat$cty, col = dat$fuel, pch = 20, cex = 1.5,
     xlab = "Highway MPG", ylab = "City MPG")
abline(a = mod$coeff[1], b = mod$coeff[2], col = "gray", lty = 2)
legend(x = "topleft", legend = levels(dat$fuel), pch = 20,
       col = 1:length(levels(dat$fuel)))


# Stat Question 2: Are Subcompact Cars More Efficient than Compact --------

#Let's get the highway mpg for both classes

compact_hwy <- subset(dat, class == "Compact Cars", select = "hwy")
mean(compact_hwy$hwy)
subcompact_hwy <- subset(dat, class == "Subcompact Cars", select = "hwy")
mean(subcompact_hwy$hwy)
#use a standard t.test to see if the means are different
t.test(compact_hwy, subcompact_hwy)

#pvalue > 0.05...not enough evidence to say they are different