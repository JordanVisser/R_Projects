
rm(list = ls())

library(tidyverse) 
msleep

Q0 <- msleep %>%
  select(name, vore, conservation, sleep_total) %>%
  filter(vore=="carni", !is.na(conservation)) %>% 
  group_by(conservation) %>% 
  summarize(sleep_time_med = round(median(sleep_total, na.rm=TRUE),2)) %>%
  as.data.frame()

Q0

Q1 <- msleep |>
  filter(vore == 'carni' & conservation == 'lc') |>
  summarise(var = var(sleep_total)) |>
  mutate(var = round(var, 2)) |>
  as.data.frame()

Q1

Q2 <- msleep |>
  mutate( ratio = sleep_total / sleep_rem) |>
  filter(order == 'Rodentia', rna.rm = TRUE) |>
  arrange(desc(ratio)) |>
  head(1) |>
  select(name) |>
  as.data.frame()

Q2

Q3 <- msleep |>
  mutate(ratio = bodywt/brainwt) |>
  filter(ratio > 100 & order == 'Primates') |>
  nrow() |>
  as.data.frame()

Q3

