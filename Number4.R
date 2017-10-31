#load library
library(tidyverse)

#load data from the internet, using tabs to seperate and replacing -999, etc with NA's 
dat <- read.csv(url("http://www.esapubs.org/archive/ecol/E088/096/avian_ssd_jan07.txt"),
                sep = "\t", na.strings = c("-999.00", "999.00", "-999", "999"))

#histogram of females
ggplot(data = dat, aes(x = F_mass)) + labs(x = "Female Mass g") +
  geom_histogram()

#scaled to log
ggplot(data = dat, aes(x = F_mass)) + labs(x = "Female Mass g") +
  geom_histogram() +  scale_x_log10()

#add the males
ggplot(data = dat, aes(x = F_mass)) + labs(x = "Female Mass g") +
  geom_histogram(fill = "cyan", alpha = 0.3) +  geom_histogram(aes(x = M_mass), alpha = 0.3) + 
  scale_x_log10()