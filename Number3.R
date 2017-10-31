#load library
library(tidyverse)

#load data
dat <- read.csv(url("http://esapubs.org/archive/ecol/E084/093/Mammal_lifehistories_v2.txt"), 
                sep = "\t", nrows = 1440, na.strings = c("-999.00", "999.00"))

ggplot(data = dat, aes(x = mass.g., y = newborn.g.)) +
  labs(x = "Adult Mass", y = "Newborn Mass") +
  geom_point()


#scale logarithmically
ggplot(data = dat, aes(x = mass.g., y = newborn.g.)) +
  labs(x = "Adult Mass", y = "Newborn Mass") +
scale_x_log10() +
  scale_y_log10() +
  geom_point()

#same but with colors
ggplot(data = dat, aes(x = mass.g., y = newborn.g.)) +
  labs(x = "Adult Mass", y = "Newborn Mass") +
  scale_x_log10() +
  scale_y_log10() +
  geom_point(aes(color= order))

#add facet wrap thing
ggplot(data = dat, aes(x = mass.g., y = newborn.g.)) +
  labs(x = "Adult Mass", y = "Newborn Mass") +
  scale_x_log10() +
  scale_y_log10() +
  geom_point(aes(color= order)) +   facet_wrap(~ order, nrow = 4, ncol = 5)

#smoothing
ggplot(data = dat, aes(x = mass.g., y = newborn.g.)) +
  labs(x = "Adult Mass", y = "Newborn Mass") +
  scale_x_log10() +
  scale_y_log10() +
  geom_point(aes(color= order)) + geom_smooth(method = "lm")

