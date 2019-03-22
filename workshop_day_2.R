#################################
##RStudio Intro with Yuen
#################################

cats <- data.frame(coat = c("calico", "black", "tabby"), weight = c(2.1, 5.0, 3.2), likes_string = c(1, 0, 1))
cats
write.csv(cats, file = "feline.csv", row.names = FALSE)
cats <- read.csv(file = "feline.csv")
cats$weight
cats$weight+2
cats$weight+cats$coat
typeof(cats$weight)
cats2 <- read.csv(file = "data-shell/feline2.csv")
cats2
cats2$weight+2
typeof(cats2$weight)
class(cats)
my_vector <- vector(length = 3)
my_vector
another_vector <- vector(mode = "character", length = 3)
another_vector
str(cats$weight)
quiz_vector <- c(2, 6, "3")
quiz_vector
gapminder <- read.csv("data-shell/gapminder_data.csv")
