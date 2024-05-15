install.packages("tidyverse")
install.packages("textdata")
install.packages("stopwords")
install.packages("syuzhet")

library(tidyverse)
library(textdata)
library(stopwords)
library(syuzhet)
library(readxl)

data <- read_excel("C:/RP Analysis works/rp suggestions.xlsx")
text_data <- data$text

text_data <- gsub("[^[:alnum:]]+\\s*", " ", text_data)

text_data <- tolower(text_data)

stopwords <- stopwords("english")
text_data <- text_data %>%
  str_split(" ") %>% 
  sapply(., function(x) x[!x %in% stopwords]) %>% 
  str_c(collapse = " ")

sentiment <- get_nrc_sentiment(text_data)

dominant_emotion <- sentiment %>% 
  mutate(dominant_emotion = max.col(select(., starts_with("positive|negative|anger|anticipation|disgust|fear|joy|sadness|surprise|trust"))))

result <- head(dominant_emotion, 1)

# Convert the data to long format for plotting
result2 <- pivot_longer(result, cols = -dominant_emotion)

# Plotting the emotions
ggplot(result2, aes(x = name, y = value, fill = name)) +
  geom_bar(stat = "identity") +
  labs(title = "Emotion Distribution in First Row",
       x = "Emotion",
       y = "Count") +
  theme_minimal()
