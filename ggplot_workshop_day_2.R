#######################################
## Plotting with ggplot2 with Sharon Solis
#######################################

# Load packages
library(tidyverse)

# Initiate new variable called gapminder, to read gapminder file in data folder
gapminder <- read.csv("data-shell/gapminder_data.csv", header = TRUE)

# Data subsetting
## look at row 1, column 1
gapminder[1,1]

## look at row 1, all columns
gapminder[1,]

## look at first few lines of gapminder
head(gapminder)

## look at last few lines of gapminder
tail(gapminder)

## look at the middle
gapminder[900:905,]

# Call ggplot function to create new plot, GLOBAL option, applies to ALL layers
##aes -- aesthetic properties, x and y locaitons; looks for column headings
##geom -- this layer tells how we want to visually represent data
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

## Change color according to continent
ggplot(data = gapminder, aes(x = year, y = lifeExp)) +
  geom_point(aes(color = continent))

# Layers
## scatterplot is hard to visualize change over time --> use line plot instead
ggplot(data = gapminder, aes(x = year, y = lifeExp)) +
  geom_line(aes(by = country, color = continent))

## plot for line for each continent
ggplot(data = gapminder, aes(x = year, y = lifeExp, color = continent)) +
  geom_line() +
  geom_point()

## switch order of point and line layers
ggplot(data = gapminder, aes(x = year, y = lifeExp, color = continent)) +
  geom_point(color = "black") +
  geom_line()

# Transformation and Statistics
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point(aes(color = continent))
## change scale of units on x axis using scale function
## log 10 function applies transforation to values of gdpPercap column
## each multiple of 10 now corresponds to an increase in 1 on transformed scale
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point(aes(color = continent)) +
  scale_x_log10()

## lm
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = continent, font = "bold")) +
  geom_point(aes(color = continent), alpha = .5, shape = 5) +
  scale_x_log10() +
  geom_smooth(method = "lm") +
  geom_label(label = "point", fontface = 3)

