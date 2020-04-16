#Making A Stacked Plot
#Jazmyn Winzer
#jiwinzer@email.arizona.edu 
#2020/4/2

library(tidyverse)
library(dplyr)
library(ggplot2)
library(forcats)
library(stringr)

andy <- read_csv("eBut_ah.csv")
az <- read_csv("eBut_az.csv")

glimpse(andy)

andy_summary = andy %>% 
  group_by(Genus, Species) %>%
  summarise(sum_occ = sum(`Number of individuals`))

az_summary = az %>% 
  group_by(Genus, Species) %>%
  summarise(sum_occ = sum(`Number of individuals`)) %>%
  mutate(Species = str_remove(Species, "Limenitis"))

all_butterflies = bind_rows(andy_summary, az_summary, .id = "Andy_vs_Az") %>%
  ungroup() %>%
  mutate(name = factor(paste(Genus, Species))) %>%
  drop_na()

all_butterflies %>%
  mutate(name = factor(name)) %>%
  mutate(name = fct_reorder(name,sum_occ)) %>%
  ggplot( aes(x = name, y = log(sum_occ), fill = Andy_vs_Az)) +
  geom_bar(position = "stack", stat = "identity") +
  xlab("Species") +
  ylab(" Log Sum of Individuals per Species") +
  scale_fill_manual(name = "",
                     values = c("cadetblue1", "deeppink3"),
                     labels = c("Tohono Chul", "Arizona")) +
  theme_light() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
