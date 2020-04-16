#Finding Andy's Data
#Jazmyn Winzer
#jiwinzer@email.arizona.com
#2020/3/23

library(tidyverse)

eBut <- read_csv("eBut Data.csv")

glimpse(eBut)

eBut.AH = eBut %>% filter(Observer == "Andrew Hogan")

write.csv(eBut.AH, "eBut_ah.csv")
