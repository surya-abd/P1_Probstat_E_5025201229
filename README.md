## P1_Probstat_E_5025201229
- Nama : Surya Abdillah
- NRP : 5025201229
- Kelas : Probabilitas dan Statistika E

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
![image](https://user-images.githubusercontent.com/103357229/162622544-29f087e0-30ff-4e36-9b0f-7cc7ffe43cfa.png)
### 1.B.
mean Distribusi Geometrik dengan 10000 data random , prob = 0,20 dimana distribusi geometrik acak tersebut X = 3 ( distribusi geometrik acak () == 3 )
> Untuk mendapatkan data random distribusi geometrik kita dapat menggunakan fungsi `rgeom()`. Dari niali tersebut kita gunakan sebagai argumen pada fungsi `mean()` untuk mendapatkan rata-ratanya
```sh
mean(rgeom(n = 10000, prob = p) == 3)
```
![image](https://user-images.githubusercontent.com/103357229/162622633-0a275969-022d-4480-bbf8-4706dac44afe.png)
### 1.C.
Bandingkan Hasil poin a dan b , apa kesimpulan yang bisa didapatkan?
> Pada suatu percobaan nilai yang didapatkan dari poin a adalah 0.1024 dan poin b adalah 0.1029. Kedua nilai tersebut saling mendekati. Dari percobaan tersebut dapat disimpulkan bahwa nilai peluang kejadian A adalah sama dengan nilai mean distribusi geometrik kejadian itu sendiri.
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
HASIL
![Rplot](https://user-images.githubusercontent.com/103357229/162616317-ad8cf82e-ca96-4b39-9d1f-4defd16e2627.png)

### 1.E.
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Geometrik.
>Untuk mencari rataan kita dapat menggunakan fungsi `mean()` dan untuk varian dapat menggunakan fungsi `var()`

Disini kita membuat variabel `set_data` yang akan menyimpan hasil random data untuk distribusi geometrik
```sh
set_data <- rgeom(n = 10000, prob = p)
mean(set_data)
var(set_data)
```
![image](https://user-images.githubusercontent.com/103357229/162622785-48ef4093-83c0-4846-982c-403b7c12cd24.png)
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
![image](https://user-images.githubusercontent.com/103357229/162622916-90fc2e5b-d8d9-4397-acb1-e664fab2ca9a.png)
### 2.B.
Gambarkan grafik histogram berdasarkan kasus tersebut.
> Dalam pengerjaan soal ini, praktikan membuat terlebih dahulu 2 variabel bantuan, yakni iter yang berisi iterasi dan p sebagai hasil distribusi dari setiap iterasi
```sh
iter = seq(0, size, by = 1)
p = dbinom(iter, size, prob)

plot(iter,p,type='h')
```
fungsi `plot()` digunakan untuk membuat plot dimana `type = 'h'` menandakan bahwa plot berupa histogram
HASIL
![2](https://user-images.githubusercontent.com/103357229/162616354-cb34fd1b-9423-4690-8beb-7b274337da99.png)

### 2.C.
Nilai Rataan (μ) dan Varian (σ²) dari DistribusiBinomial.
> Seperti soal 1, kita akan menggunakan fungsi `mean()` dan `var()` dengan code berikut:
```sh
set_data <- rbinom(x, size, prob)

mean(set_data)
var(set_data)
```
![image](https://user-images.githubusercontent.com/103357229/162622984-7ff4e58d-8cf5-4fd0-8c4e-b8439e478308.png)
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
![image](https://user-images.githubusercontent.com/103357229/162623003-64d6f8c9-d8ce-4b92-a04b-8f0e8854a04c.png)
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

babies %>% dplyr::summarize(six_babies = sum(babies$data == 6) / n())
```
HASIL
![3](https://user-images.githubusercontent.com/103357229/162616377-4b023cba-2f2c-4523-8dad-ae4149f74458.png)

### 3.C.
dan bandingkan hasil poin a dan b , Apa kesimpulan yang bisa didapatkan
> Dalam suatu percobaan didapatkan nilai dari poin (a) adalah 0.1281201 dan poin (b) adalah 0.1150685. Kedua nilai ini sangat dekat. Sehingga, dapat ditarik kesimpulan bahwa peluang kejadian A sama dengan nilai jumlah distribusi Poissonnya.
### 3.D.
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Poisson.
> Seperti soal sebelumnya kita akan menggunakan fungsi `mean()` dan `var()`
```sh
mean(rpois(365, 4.5))
var(rpois(365, 4.5))
```
![image](https://user-images.githubusercontent.com/103357229/162623104-74a74017-9f9e-4d2a-b3a3-e6077cded7c8.png)

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
![image](https://user-images.githubusercontent.com/103357229/162623128-82f766b6-b19c-4cb3-8444-1fafd381b6cc.png)
### 4.B.
Histogram dari Distribusi Chi-Square dengan 100 data random.
> Kita akan membuat data random, lalu akan dibuat histogramnya
```sh
n = 100
set_data <- rchisq(n, v)
hist(set_data, main = "chi-square histogram")
```
![4b](https://user-images.githubusercontent.com/103357229/162616397-3bfc27a7-75e4-40e0-953f-266d6a81e13e.png)

### 4.C.
Nilai Rataan (μ) dan Varian (σ²) dari DistribusiChi-Square.
> Seperti soal sebelumnya akan digunakan fungsi `mean()` dan `var()`
```sh
mean(set_data)
var(set_data)
```
![image](https://user-images.githubusercontent.com/103357229/162623165-145382bf-7396-46f1-990f-01d028c118a1.png)

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
![image](https://user-images.githubusercontent.com/103357229/162623195-02d374b0-8360-4129-a16a-234a168026f4.png)
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
HASIL secara urut dengan N 10, 100, 1000, dan 10000
![5BFIX1](https://user-images.githubusercontent.com/103357229/162623509-bc052edb-b38e-4a54-b2de-0b2104bc4ac1.png)

![5BFIX2](https://user-images.githubusercontent.com/103357229/162623508-fdb320bf-74de-4dd3-af94-667247bdd17b.png)

![5BFIX3](https://user-images.githubusercontent.com/103357229/162623531-0f54c8bf-92dd-4199-bd94-64fec9cb085c.png)

![5BFIX4](https://user-images.githubusercontent.com/103357229/162623511-927b58b7-7f6a-44e1-aff5-06fb0db862a5.png)

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
![image](https://user-images.githubusercontent.com/103357229/162623626-dc8af74c-20c3-4e1f-9d9c-09c57acee28e.png)

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
![image](https://user-images.githubusercontent.com/103357229/162623691-dee3a5e1-7961-4410-ae6e-9c8fc43ddaa0.png)
Untuk menghitung nilai baku dapat dijalankan code berikut:
```sh
x.z <- (x - mean) / sd
x.z
```
![image](https://user-images.githubusercontent.com/103357229/162623712-3c558333-ce83-4c33-a295-6d5ddf839873.png)
> Untuk membuat histogram, kita akan membuat data random dan menggunakan fungsi `plot()` dengan type 'l' agar menghasilkan plot grafik
```sh
set_data <- rnorm(n, mean, sd)

iter = seq(1, n, by = 1)
plot(iter, set_data, type = 'l')
```
HASIL
![6a](https://user-images.githubusercontent.com/103357229/162616460-d8942cc3-19cd-47ac-abdf-d7c6fd80eb89.png)


Untuk fungsi distribusi kita menggunakan fungsi `dnorm()`
```sh
dnorm(iter, mean, sd)
```
![image](https://user-images.githubusercontent.com/103357229/162623738-69d2895c-64d6-4f20-a0ae-8dd3314260a2.png)
### 6.B.
Generate Histogram dari Distribusi Normal dengan breaks 50 dan format penamaan:
NRP_Nama_Probstat_{Nama Kelas}_DNhistogram
Contoh :
312312312_Rola_Probstat_A_DNhistogram
```sh
hist(set_data, breaks = 50, main = "5025201229_Surya_Probstat_E_DNhistogram
")
```
HASIL
![6b](https://user-images.githubusercontent.com/103357229/162616478-05872b61-4b08-463f-832e-6c1c486b1fd3.png)

### 6.C.
Nilai Varian (σ²) dari hasil generate random nilai Distribusi Normal.
> Seperti soal sebelumnya, kita akan menggunakan fungsi `var()` untuk mendapatkan nilai varian
```sh
var(set_data)
```
![image](https://user-images.githubusercontent.com/103357229/162623774-ac8c80b0-bf0f-4ec0-ad2e-71d4314fb769.png)
## REFERENSI
[https://rpubs.com/mpfoley73/458721]
[https://www.statology.org/plot-binomial-distribution-r/]
[https://bookdown.org/gabriel_butler/ECON41Labs/tutorial-5-the-poisson-distribution.html]

## Dokumentasi Pengerjaan
![image](https://user-images.githubusercontent.com/103357229/162618071-a876a77c-00e6-4e0d-b8d4-11f5321ca44e.png)

![image](https://user-images.githubusercontent.com/103357229/162618117-f46932c5-ed76-467c-96f1-022d3e691bd4.png)

![image](https://user-images.githubusercontent.com/103357229/162618154-ddbf477d-1af6-4ae7-9a31-551e85c34fa2.png)
