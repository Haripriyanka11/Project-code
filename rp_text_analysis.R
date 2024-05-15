install.packages("tidyverse")
install.packages("textdata")
install.packages("stopwords")
install.packages("wordcloud")
install.packages("tm")
install.packages("slam")

library(tidyverse)
library(textdata)
library(stopwords)
library(wordcloud)
library(readxl)
library(tm)
library(slam)

data <- read_excel("C:/WM/rp suggestions.xlsx")

text_data <- data$text

text_data <- gsub("[^[:alnum:]]+\\s*", " ", text_data)

text_data <- tolower(text_data)

stopwords <- stopwords("english")
text_data <- text_data %>%
  str_split(" ") %>% 
  sapply(., function(x) x[!x %in% stopwords]) %>%
  str_c(collapse = " ")

set.seed(123)

all_words <- unlist(str_split(text_data, " "))
wordcloud(all_words, min.freq = 2)

positive_text <- text_data[data$text == "positive"]
positive_words <- unlist(str_split(positive_text, ""))
cleaned_text <- str_c(text_data)
wordcloud(cleaned_text, min.freq = 2,colors = c("blue","green","red"))
