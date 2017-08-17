#RMACC 2017
#Intro to R
#Demo 2

#I'm going to reimplement demo 1 with my my preferred pipeline


# Preamble ----------------------------------------------------------------

rm(list = ls()) #I prefer to clear my workspace whenever I start a new script
library(tidyverse) #loads some common packages I like to use. We won't need most of these...
library(forcats)

# Data Import -------------------------------------------------------------

dat <- read.csv(file = "./2015_fuel_econ.csv") 
head(dat)
glimpse(dat)


# Clean up the data -------------------------------------------------------

#Let's make a class that combines like vehicles
dat2 <- dat %>%
  mutate(class2 = fct_recode(class,
                             "Small Sport SUV" = "Small Sport Utility Vehicle 2WD",
                             "Small Sport SUV" = "Small Sport Utility Vehicle 4WD",
                             "Pickup Truck" = "Standard Pickup Trucks 2WD",
                             "Pickup Truck" = "Standard Pickup Trucks 4WD",
                             "SUV" = "Standard Sport Utility Vehicle 2WD",
                             "SUV" = "Standard Sport Utility Vehicle 4WD"))

levels(dat2$class)

# Visualization -----------------------------------------------------------

#vehicle make
ggplot(dat2, aes(x = make, fill = class2)) +
  geom_bar(alpha = .5) +
  labs(x = "Make", fill = "Class", y = "# of Vehicles",
       title = "Breakdown of Vehicle Makes") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 30, vjust = .65, hjust =.9))

#city vs hwy
ggplot(dat2, aes(x = hwy, y = cty, colour = fuel)) +
  geom_point() +
  theme_bw() +
  labs(x = "Highway MPG", y = "City MPG", colour = "Fuel") +
  scale_colour_brewer(palette = "Set1") +
  facet_wrap(~class2)

#Histogram of all fuel economies side by side
dat2 %>%
  select(id, hwy, cty) %>%
  gather(Type, Value, -id) %>%
  ggplot(., aes(x = Value, fill = Type)) +
    facet_wrap(~Type) +
    geom_histogram(alpha = .5, colour = "white") +
    scale_fill_brewer(palette = "Spectral") +
    theme_dark()
