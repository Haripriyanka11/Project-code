install.packages("psych")
install.packages("dplyr")

library(psych)
library(readxl)
library(dplyr)

data = read_excel("C:/WM/RP responses_sum.xlsx")
data

head(data)
str(data)
summary(data)
length(data)

r(data)

model = lm(CAI1 ~ EC1+EC2+EC3+EC4+PEB1+PEB2+PEB3+PEB4+SI1+SI2+SI3+SI4+CI1+CI2+CI3+CI4+CI5+A1+A2+A3+A4+A5+TF1+TF2+TF3+TF4+TF5+TF6, data)
model
summary(model)
cronbach = alpha(data)
cronbach