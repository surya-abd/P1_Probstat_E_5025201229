#dalam program ini memerlukan package ggplot2 dan dplyr, apabila anda belum menginstall, maka silakan diinstall terlebih dahulu
#install.packages("ggplot2")
#install.packages("dplyr")

#NOMOR 1
p = 0.20
n = 3

#A
dgeom(n,p)

#B
mean(rgeom(n = 10000, prob = p) == 3)

#D
library(dplyr)
library(ggplot2)

data.frame(x = 0:10, prob = dgeom(x = 0:10, prob = p)) %>%
  mutate(Failures = ifelse(x == n, n, "other")) %>%
  ggplot(aes(x = factor(x), y = prob, fill = Failures)) +
  geom_col() +
  geom_text(
    aes(label = round(prob,2), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 3,
    vjust = 0
  ) +
  labs(title = "Probabilitas X = 3 tidak hadir sebelum keberhasilan pertama",
       x = "Kegagalan sebelum keberhasilan pertama (x)",
       y = "Probabilitas") 

set_data <- rgeom(n = 10000, prob = p)
mean(set_data)
var(set_data)

#NOMOR 2
x = 4
size = 20
prob = 0.2

#A
dbinom(x, size, prob)

#B
iter = seq(0, size, by = 1)
p = dbinom(iter, size, prob)
plot(iter,p,type='h')

#C
set_data <- rbinom(x, size, prob)
mean(set_data)
var(set_data)

#NOMOR 3 
#A
lambda = 4.5
dpois(6, lambda)

#B
library(dplyr)
library(ggplot2)

set.seed(2)

babies <- data.frame('data' = rpois(365, 4.5))

babies %>% ggplot() +
  geom_histogram(aes(x = data,
                     y = stat(count / sum(count)),
                     fill = data == 6),
                 binwidth = 1,
                 color = 'black',) +
  scale_x_continuous(breaks = 0:10) + 
  labs(x = 'Jumlah bayi per periode',
       y = 'Proporsi',
       title = 'n = 365 hari dengan lambda = 4.5') +
  theme_bw()

babies %>% dplyr::summarize(six_babies = sum(babies$data == 6) / n())

#D
mean(rpois(365, 4.5))
var(rpois(365, 4.5))


#NOMOR 4
x = 2
v = 10

#A
dchisq(x, v)

#B
n = 100
set_data <- rchisq(n, v)
hist(set_data, main = "chi-square histogram")

#C
mean(set_data)
var(set_data)

#NOMOR 5
#A
rate = 3
  #misal start = 1, end = 10
x_dexp <- seq(1, 10, by = 1)
dexp(x_dexp, rate)

#B
# N = 10         
N <- 10
set_data <- rexp(N, rate = 3)
hist(set_data, main = "Eksponensial N = 10")
# N = 100 
N <- 100
set_data <- rexp(N, rate = 3)
hist(y_rexp, main = "Eksponensial N = 100")
# N = 1,000
N <- 1000
set_data <- rexp(N, rate = 3)
hist(y_rexp, main = "Eksponensial N = 1,000")
# N = 10,000  
N <- 10000
set_data <- rexp(N, rate = 3)
hist(y_rexp, main = "Eksponensial N = 10,000")

#C
set.seed(1) 
n <- 100
rate = 3
set_data <- rexp(n, rate)
mean(set_data)
var(set_data)

#NOMOR 6
n = 100
mean = 50
sd = 8
#A
X1 = runif(1, max = mean)
X2 = runif(1, min = mean, max = 100)
x = runif(1, min = X1, max = X2)

x.z <- (x - mean) / sd
x.z

set_data <- rnorm(n, mean, sd)

iter = seq(1, n, by = 1)
plot(iter, set_data, type = 'l')

dnorm(iter, mean, sd)

#B
hist(set_data, breaks = 50, main = "5025201229_Surya_Probstat_E_DNhistogram
")
#C
var(set_data)
