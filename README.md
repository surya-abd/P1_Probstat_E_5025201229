## _Soal 1_
Seorang penyurvei secara acak memilih orang-orang di jalan sampai dia bertemu dengan seseorang yang menghadiri acara vaksinasi sebelumnya.
### 1.A.
Berapa peluang penyurvei bertemu x = 3 orang yang tidak menghadiri acara vaksinasi sebelum keberhasilan pertama ketika p = 0,20 dari populasi menghadiri acara vaksinasi ? (distribusi Geometrik)
> Dari soal dapat diketahui: x = 3, p = 0,2. Untuk mendapatkan nilai peluang yang dicari maka kita dapat menggunakan fungsi `dgeom()`
```sh
p = 0.20
n = 3
dgeom(n,p)
```
### 1.B.
mean Distribusi Geometrik dengan 10000 data random , prob = 0,20 dimana distribusi geometrik acak tersebut X = 3 ( distribusi geometrik acak () == 3 )
> Untuk mendapatkan data random distribusi geometrik kita dapat menggunakan fungsi `rgeom()`. Dari niali tersebut kita gunakan sebagai argumen pada fungsi `mean()` untuk mendapatkan rata-ratanya
```sh
mean(rgeom(n = 10000, prob = p) == 3)
```
### 1.C. BELUM SELESAI
Bandingkan Hasil poin a dan b , apa kesimpulan yang bisa didapatkan?
> Pada suatu percobaan nilai yang didapatkan dari poin a adalah 0.1024 dan poin b adalah 0.1029. Kedua nilai tersebut saling mendekati. Dari percobaan tersebut dapat disimpulkan bahwa jumlah percobaan pada 
### 1.D.
Histogram Distribusi Geometrik , Peluang X = 3 gagal Sebelum Sukses Pertama
> Histogram yang dicari dapat dicari melalui code berikut. Sebelum menjalankan program, kita perlu menginstall package    `dplyr` dan `ggplot2` dengan cara
```sh
install.packages("ggplot2")
install.packages("dplyr")
```
> Apabila package telah terinstall, maka code dapat dijalankan
```sh
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
```
### 1.E.
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Geometrik.
>Untuk mencari rataan kita dapat menggunakan fungsi `mean()` dan untuk varian dapat menggunakan fungsi `var()`

Disini kita membuat variabel `set_data` yang akan menyimpan hasil random data untuk distribusi geometrik
```sh
set_data <- rgeom(n = 10000, prob = p)
mean(set_data)
var(set_data)
```
## Soal 2 
Terdapat 20 pasien menderita Covid19 dengan peluang sembuh sebesar 0.2. Tentukan :
> Dari pernyataan soal, dapat dideklarasikan variabel-variabel berikut:
```sh
x = 4
size = 20
prob = 0.2
```
### 2.A.
Peluang terdapat 4 pasien yang sembuh.
> Untuk mendapatkan peluang tepat 4 pasien yang sembuh dapat digunakan fungsi `dbinom()`
```sh
dbinom(x, size, prob)
```
### 2.B.
Gambarkan grafik histogram berdasarkan kasus tersebut.
> Dalam pengerjaan soal ini, praktikan membuat terlebih dahulu 2 variabel bantuan, yakni iter yang berisi iterasi dan p sebagai hasil distribusi dari setiap iterasi
```sh
iter = seq(0, size, by = 1)
p = dbinom(iter, size, prob)

plot(iter,p,type='h')
```
fungsi `plot()` digunakan untuk membuat plot dimana `type = 'h'` menandakan bahwa plot berupa histogram
### 2.C.
Nilai Rataan (μ) dan Varian (σ²) dari DistribusiBinomial.
> Seperti soal 1, kita akan menggunakan fungsi `mean()` dan `var()` dengan code berikut:
```sh
set_data <- rbinom(x, size, prob)

mean(set_data)
var(set_data)
```
## Soal 3
Diketahui data dari sebuah tempat bersalin di rumah sakit tertentu menunjukkan rata-rata historis 4,5 bayi lahir di rumah sakit ini setiap hari. (gunakan Distribusi Poisson)
```sh
lambda = 4.5
```
### 3.A.
Berapa peluang bahwa 6 bayi akan lahir di rumah sakit ini besok?
> Kita dapat menggunakan fungsi `dpois()`
```sh
dpois(6, lambda)
```
### 3.B.
simulasikan dan buatlah histogram kelahiran 6 bayi akan lahir di rumah sakit ini selama setahun (n = 365)
> Untuk membuha histograf tersebut dapat menggunakan code berikut.
```sh
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

babies %>% dplyr::summarize(six_babies = sum(babies$data > 6) / n())
```
### 3.C.
dan bandingkan hasil poin a dan b , Apa kesimpulan yang bisa didapatkan
### 3.D.
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Poisson.
> Seperti soal sebelumnya kita akan menggunakan fungsi `mean()` dan `var()`
```sh
mean(rpois(365, 4.5))
var(rpois(365, 4.5))
```

## Soal 4
Diketahui nilai x = 2 dan v = 10. Tentukan:
```sh
x = 2
v = 10
```
### 4.A.
Fungsi Probabilitas dari Distribusi Chi-Square.
> Untuk mendapatkan fungsi probabilitas dapat digunakan fungsi `dchisq()`
```sh
dchisq(x, v)
```
### 4.B.
Histogram dari Distribusi Chi-Square dengan 100 data random.
> Kita akan membuat data random, lalu akan dibuat histogramnya
```sh
n = 100
set_data <- rchisq(n, v)
hist(set_data, main = "chi-square histogram")
```
### 4.C.
Nilai Rataan (μ) dan Varian (σ²) dari DistribusiChi-Square.
> Seperti soal sebelumnya akan digunakan fungsi `mean()` dan `var()`
```sh
mean(set_data)
var(set_data)
```

## Soal 5
Diketahui bilangan acak (random variable) berdistribusi exponential (λ = 3). Tentukan
```sh
rate = 3
```
### 5.A.
Fungsi Probabilitas dari Distribusi Exponensial
> Pada soal tidak dijelaskan untuk intervalnya, maka praktikan membuat asumsi bahwa interval ada pada 1 hingga 10 dengan increment 1
```sh
  #misal start = 1, end = 10
x_dexp <- seq(1, 10, by = 1)
dexp(x_dexp, rate)
```
### 5.B.
Histogram dari Distribusi Exponensial untuk 10, 100, 1000 dan 10000 bilangan random
> Kita akan membuat 4 histogram untuk masing-masing banyak bilangan. Alur pengerjaan adalah, membuat data random lalu membuat histogram menggunakan fungsi `hist()`
```sh
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
```
### 5.C.
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Exponensial untuk n = 100 dan λ = 3
Petunjuk:
- Gunakan set.seed(1)
- Gunakan fungsi bawaan R
> Dengan menggunakan pernyataan dalam soal dan petunjuk yang ada, maka dapat pertanyaan dapat diselesaikan dengan code berikut:
```sh
set.seed(1) 
n <- 100
rate = 3
set_data <- rexp(n, rate)
mean(set_data)
var(set_data)
```
## Soal 6
Diketahui generate random nilai sebanyak 100 data, mean = 50, sd = 8. Tentukan
```sh
n = 100
mean = 50
sd = 8
```
### 6.A.
Fungsi Probabilitas dari Distribusi Normal P(X1 ≤ x ≤ X2), hitung Z-Score Nya dan plot data generate randomnya dalam bentuk grafik. Petunjuk(gunakan fungsi plot()).
Keterangan :
X1 = Dibawah rata-rata
X2 = Diatas rata-rata
Contoh data :
1,2,4,2,6,3,10,11,5,3,6,8
rata-rata = 5.083333
X1 = 5
X2 = 6
> X1, X2, dan x didapat dari random nilai

Untuk mendapatkan nilai random untuk X1, X2, dan x, maka kita dapat menggunakan fungsi `runif()` dengan parameter yang sesuai
```sh
X1 = runif(1, max = mean)
X2 = runif(1, min = mean, max = 100)
x = runif(1, min = X1, max = X2)
```
Untuk menghitung nilai baku dapat dijalankan code berikut:
```sh
x.z <- (x - mean) / sd
x.z
```
> Untuk membuat histogram, kita akan membuat data random dan menggunakan fungsi `plot()` dengan type 'l' agar menghasilkan plot grafik
```sh
set_data <- rnorm(n, mean, sd)

iter = seq(1, n, by = 1)
plot(iter, set_data, type = 'l')
```

Untuk fungsi distribusi kita menggunakan fungsi `dnorm()`
```sh
dnorm(iter, mean, sd)
```
### 6.B.
Generate Histogram dari Distribusi Normal dengan breaks 50 dan format penamaan:
NRP_Nama_Probstat_{Nama Kelas}_DNhistogram
Contoh :
312312312_Rola_Probstat_A_DNhistogram
```sh
hist(set_data, breaks = 50, main = "5025201229_Surya_Probstat_E_DNhistogram
")
```
### 6.C.
Nilai Varian (σ²) dari hasil generate random nilai Distribusi Normal.
> Seperti soal sebelumnya, kita akan menggunakan fungsi `var()` untuk mendapatkan nilai varian
```sh
var(set_data)
```
