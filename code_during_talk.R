
# Libraries ---------------------------------------------------------------

install.packages("tidyverse")
library(tidyverse)


# Help --------------------------------------------------------------------

?mean
help("mean")
help.search("mea")

# Operators ---------------------------------------------------------------

x <- 10 #user workspace
x = 10 #scope of a function

2 * 4 
2 / 4
2 - 4
2 + 4

4 %% 2 #4 mod 2

#boolean
2 == 4
2 != 4

#combinations
(2 == 4) & (3 == 3) #and
(2 == 4) | (3 == 3) #or

2 < 4
4 <= 4
4 > 2
4 >= 4

# Control Flow ------------------------------------------------------------
bool <- TRUE
if (bool) {
  print("Hello World")
}

if (!bool) {
  print("Hello World") 
} else {
  print("Pineapple!")
}

#ifelse function
ifelse(!bool, "Hello World", "Pineapple")

#Loops
iter <- 1:5
for (i in iter) {
  msg <- paste("Value:", i)
  print(msg)
}

msgs <- paste("Value:", 1:5)
for (m in msgs) {
  print(m)
}

#while loop
x <- 1
while (x <= 10) {
  print(x)
  x = x + 1
}


# Defining functions ------------------------------------------------------

my_func <- function(x, y, z) {
  msg <- paste("X:", x, "Y:", y, "Z:", z)
  print(msg)
}

my_func(1, 2, 3)


# Apply functions ---------------------------------------------------------

#If time allows...


