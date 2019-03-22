#######################################
## dplyr with Mary Donovan
######################################
# Load packages, read in data
library(tidyverse)
gapminder <- read.csv("data-shell/gapminder_data.csv", header = TRUE)

# Subset of data
africa <- gapminder %>% 
  filter(continent == "Africa") %>% 
  select(lifeExp, country, year)
africa

##how many rows in africa?
nrow(africa)
##how many rows and columns in africa?
str(africa)

# Summarizing data
gdp_by_continent <- gapminder %>% 
  group_by(continent) %>% 
  summarize(
    mean_gdp = mean(gdpPercap)
  )
gdp_by_continent

# Mutate
gdp <- gapminder %>% 
  mutate(gpd_billions = gdpPercap*pop/10^9)
gdp

# String with ggplot
gapminder %>% 
  mutate(gdp_billions = gdpPercap*pop/10^9) %>% 
  group_by(continent, year) %>% 
  summarize(
    mean_gdp_billions = mean(gdp_billions)
  ) %>% 
  ggplot(aes(x = year, y = mean_gdp_billions, color = continent)) +
  geom_point()
