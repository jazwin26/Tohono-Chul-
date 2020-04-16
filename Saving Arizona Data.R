#Saving eBut-AZ Data
#Jazmyn Winzer
#jiwinzer@email.arizona.edu
#2020/3/27

library(tidyverse)
library(dplyr)

eBut <- read_csv("eBut Data.csv")

eBut.AZ <- eBut %>% filter(between(Latitude, 32.20, 32.35) & (between(Longitude, -110.83, -110.05)))
                          
#remember that | means or not and 
#remember that || means or not and
#remember that & means and 
#remember && means and 

write.csv(eBut.AZ, "eBut_az.csv")
