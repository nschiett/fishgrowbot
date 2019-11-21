-   [fishgrowbot: Fish growth curves through back-calculation of
    otoliths rings in a Bayesian
    framework](#fishgrowbot-fish-growth-curves-through-back-calculation-of-otoliths-rings-in-a-bayesian-framework)
-   [Installing and loading
    fishgrowbot](#installing-and-loading-fishgrowbot)
-   [Use](#use)
-   [Citation](#citation)
-   [References](#references)

<!-- badges: start -->
[![Build
Status](https://api.travis-ci.org/nschiett/fishualize.png?branch=master)](https://travis-ci.org/nschiett/fishgrowbot)
<!-- badges: end -->

fishgrowbot: Fish growth curves through back-calculation of otoliths rings in a Bayesian framework
==================================================================================================

The `fishgrowbot` package provides a tool to conduct back-calculation
based on otolith readings and fit the Von Bertalanffy growth curve, both
in a Bayesian framework.

Installing and loading fishgrowbot
==================================

`fishgrowbot` uses Markov Chain Monte Carlo simulations provided by
[stan](https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started).
Therefore, the first step is to install
[stan](https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started).

### GitHub

The best way to install the latest version of `fishgrowbot` is to
install it from GitHub.

``` r
install.packages("devtools")
devtools::install_github("nschiett/fishgrowbot", dependencies=TRUE)
library(fishflux)
```

### CRAN

`fishgrowbot` will be available on CRAN in the future:

``` r
install.packages("fishgrowbot")
library(fishgrowbot)
```

Use
===

Let’s look at an example for *Epinephelus merra*

``` r
library(fishgrowbot)
library(dplyr)

# get data
em <- dplyr::filter(fishgrowbot::coral_reef_fishes_data, species == "Epinephelus merra", location == "Moorea")

# back-calculation
bc <- fishgrowbot::bcalc(data = em)$lengths
```

    ## 
    ## SAMPLING FOR MODEL 'stan_bcalc' NOW (CHAIN 1).
    ## Chain 1: 
    ## Chain 1: Gradient evaluation took 9.8e-05 seconds
    ## Chain 1: 1000 transitions using 10 leapfrog steps per transition would take 0.98 seconds.
    ## Chain 1: Adjust your expectations accordingly!
    ## Chain 1: 
    ## Chain 1: 
    ## Chain 1: Iteration:    1 / 2000 [  0%]  (Warmup)
    ## Chain 1: Iteration:  200 / 2000 [ 10%]  (Warmup)
    ## Chain 1: Iteration:  400 / 2000 [ 20%]  (Warmup)
    ## Chain 1: Iteration:  600 / 2000 [ 30%]  (Warmup)
    ## Chain 1: Iteration:  800 / 2000 [ 40%]  (Warmup)
    ## Chain 1: Iteration: 1000 / 2000 [ 50%]  (Warmup)
    ## Chain 1: Iteration: 1001 / 2000 [ 50%]  (Sampling)
    ## Chain 1: Iteration: 1200 / 2000 [ 60%]  (Sampling)
    ## Chain 1: Iteration: 1400 / 2000 [ 70%]  (Sampling)
    ## Chain 1: Iteration: 1600 / 2000 [ 80%]  (Sampling)
    ## Chain 1: Iteration: 1800 / 2000 [ 90%]  (Sampling)
    ## Chain 1: Iteration: 2000 / 2000 [100%]  (Sampling)
    ## Chain 1: 
    ## Chain 1:  Elapsed Time: 1.89961 seconds (Warm-up)
    ## Chain 1:                0.624762 seconds (Sampling)
    ## Chain 1:                2.52437 seconds (Total)
    ## Chain 1: 
    ## 
    ## SAMPLING FOR MODEL 'stan_bcalc' NOW (CHAIN 2).
    ## Chain 2: 
    ## Chain 2: Gradient evaluation took 6.3e-05 seconds
    ## Chain 2: 1000 transitions using 10 leapfrog steps per transition would take 0.63 seconds.
    ## Chain 2: Adjust your expectations accordingly!
    ## Chain 2: 
    ## Chain 2: 
    ## Chain 2: Iteration:    1 / 2000 [  0%]  (Warmup)
    ## Chain 2: Iteration:  200 / 2000 [ 10%]  (Warmup)
    ## Chain 2: Iteration:  400 / 2000 [ 20%]  (Warmup)
    ## Chain 2: Iteration:  600 / 2000 [ 30%]  (Warmup)
    ## Chain 2: Iteration:  800 / 2000 [ 40%]  (Warmup)
    ## Chain 2: Iteration: 1000 / 2000 [ 50%]  (Warmup)
    ## Chain 2: Iteration: 1001 / 2000 [ 50%]  (Sampling)
    ## Chain 2: Iteration: 1200 / 2000 [ 60%]  (Sampling)
    ## Chain 2: Iteration: 1400 / 2000 [ 70%]  (Sampling)
    ## Chain 2: Iteration: 1600 / 2000 [ 80%]  (Sampling)
    ## Chain 2: Iteration: 1800 / 2000 [ 90%]  (Sampling)
    ## Chain 2: Iteration: 2000 / 2000 [100%]  (Sampling)
    ## Chain 2: 
    ## Chain 2:  Elapsed Time: 1.77852 seconds (Warm-up)
    ## Chain 2:                0.639177 seconds (Sampling)
    ## Chain 2:                2.4177 seconds (Total)
    ## Chain 2: 
    ## 
    ## SAMPLING FOR MODEL 'stan_bcalc' NOW (CHAIN 3).
    ## Chain 3: 
    ## Chain 3: Gradient evaluation took 6.7e-05 seconds
    ## Chain 3: 1000 transitions using 10 leapfrog steps per transition would take 0.67 seconds.
    ## Chain 3: Adjust your expectations accordingly!
    ## Chain 3: 
    ## Chain 3: 
    ## Chain 3: Iteration:    1 / 2000 [  0%]  (Warmup)
    ## Chain 3: Iteration:  200 / 2000 [ 10%]  (Warmup)
    ## Chain 3: Iteration:  400 / 2000 [ 20%]  (Warmup)
    ## Chain 3: Iteration:  600 / 2000 [ 30%]  (Warmup)
    ## Chain 3: Iteration:  800 / 2000 [ 40%]  (Warmup)
    ## Chain 3: Iteration: 1000 / 2000 [ 50%]  (Warmup)
    ## Chain 3: Iteration: 1001 / 2000 [ 50%]  (Sampling)
    ## Chain 3: Iteration: 1200 / 2000 [ 60%]  (Sampling)
    ## Chain 3: Iteration: 1400 / 2000 [ 70%]  (Sampling)
    ## Chain 3: Iteration: 1600 / 2000 [ 80%]  (Sampling)
    ## Chain 3: Iteration: 1800 / 2000 [ 90%]  (Sampling)
    ## Chain 3: Iteration: 2000 / 2000 [100%]  (Sampling)
    ## Chain 3: 
    ## Chain 3:  Elapsed Time: 1.89366 seconds (Warm-up)
    ## Chain 3:                0.597622 seconds (Sampling)
    ## Chain 3:                2.49128 seconds (Total)
    ## Chain 3: 
    ## 
    ## SAMPLING FOR MODEL 'stan_bcalc' NOW (CHAIN 4).
    ## Chain 4: 
    ## Chain 4: Gradient evaluation took 6.4e-05 seconds
    ## Chain 4: 1000 transitions using 10 leapfrog steps per transition would take 0.64 seconds.
    ## Chain 4: Adjust your expectations accordingly!
    ## Chain 4: 
    ## Chain 4: 
    ## Chain 4: Iteration:    1 / 2000 [  0%]  (Warmup)
    ## Chain 4: Iteration:  200 / 2000 [ 10%]  (Warmup)
    ## Chain 4: Iteration:  400 / 2000 [ 20%]  (Warmup)
    ## Chain 4: Iteration:  600 / 2000 [ 30%]  (Warmup)
    ## Chain 4: Iteration:  800 / 2000 [ 40%]  (Warmup)
    ## Chain 4: Iteration: 1000 / 2000 [ 50%]  (Warmup)
    ## Chain 4: Iteration: 1001 / 2000 [ 50%]  (Sampling)
    ## Chain 4: Iteration: 1200 / 2000 [ 60%]  (Sampling)
    ## Chain 4: Iteration: 1400 / 2000 [ 70%]  (Sampling)
    ## Chain 4: Iteration: 1600 / 2000 [ 80%]  (Sampling)
    ## Chain 4: Iteration: 1800 / 2000 [ 90%]  (Sampling)
    ## Chain 4: Iteration: 2000 / 2000 [100%]  (Sampling)
    ## Chain 4: 
    ## Chain 4:  Elapsed Time: 1.67959 seconds (Warm-up)
    ## Chain 4:                0.565575 seconds (Sampling)
    ## Chain 4:                2.24517 seconds (Total)
    ## Chain 4:

``` r
head(bc)
```

    ##                   id age      l_m         l_sd     l_q1     l_q3
    ## 1 EP_ME_MO_03_16_001   0   1.5000 1.079212e-15   1.5000   1.5000
    ## 2 EP_ME_MO_03_16_001   1 154.3180 4.740338e+00 145.2198 163.9285
    ## 3 EP_ME_MO_03_16_001   2 178.4179 3.747859e+00 171.1741 185.9641
    ## 4 EP_ME_MO_03_16_001   3 192.1858 3.068385e+00 186.2340 198.3418
    ## 5 EP_ME_MO_03_16_001   4 205.6838 2.329776e+00 201.1499 210.3425
    ## 6 EP_ME_MO_03_16_001   5 217.7802 1.610710e+00 214.6370 220.9919

``` r
# fit growth model
growthmodel <-fishgrowbot::growthreg(length = bc$l_m/10, age = bc$age, id = bc$id, lmax = 32, linf_m = 30, chains = 1)
```

    ## 
    ## SAMPLING FOR MODEL 'vonbert' NOW (CHAIN 1).
    ## Chain 1: Rejecting initial value:
    ## Chain 1:   Error evaluating the log probability at the initial value.
    ## Chain 1: Exception: normal_lpdf: Location parameter[14] is -nan, but must be finite!  (in 'model_vonbert' at line 56)
    ## 
    ## Chain 1: 
    ## Chain 1: Gradient evaluation took 0.000263 seconds
    ## Chain 1: 1000 transitions using 10 leapfrog steps per transition would take 2.63 seconds.
    ## Chain 1: Adjust your expectations accordingly!
    ## Chain 1: 
    ## Chain 1: 
    ## Chain 1: Iteration:    1 / 2000 [  0%]  (Warmup)
    ## Chain 1: Iteration:  200 / 2000 [ 10%]  (Warmup)
    ## Chain 1: Iteration:  400 / 2000 [ 20%]  (Warmup)
    ## Chain 1: Iteration:  600 / 2000 [ 30%]  (Warmup)
    ## Chain 1: Iteration:  800 / 2000 [ 40%]  (Warmup)
    ## Chain 1: Iteration: 1000 / 2000 [ 50%]  (Warmup)
    ## Chain 1: Iteration: 1001 / 2000 [ 50%]  (Sampling)
    ## Chain 1: Iteration: 1200 / 2000 [ 60%]  (Sampling)
    ## Chain 1: Iteration: 1400 / 2000 [ 70%]  (Sampling)
    ## Chain 1: Iteration: 1600 / 2000 [ 80%]  (Sampling)
    ## Chain 1: Iteration: 1800 / 2000 [ 90%]  (Sampling)
    ## Chain 1: Iteration: 2000 / 2000 [100%]  (Sampling)
    ## Chain 1: 
    ## Chain 1:  Elapsed Time: 14.7512 seconds (Warm-up)
    ## Chain 1:                12.4857 seconds (Sampling)
    ## Chain 1:                27.2369 seconds (Total)
    ## Chain 1:

![](README_files/figure-markdown_github/growthmodel-1.png)

``` r
# summary growth parameters
growthmodel$summary
```

    ##             mean     se_mean         sd       2.5%         25%         50%
    ## k     0.64432255 0.002795529 0.05081098  0.5537151  0.60826130  0.64139445
    ## linf 14.89355586 0.084392034 0.95335325 12.9533160 14.27998005 14.88719110
    ## t0   -0.04787671 0.001025379 0.02581336 -0.1025174 -0.06372038 -0.04718211
    ## sl   -0.63483219 0.007808378 0.13546057 -0.8861674 -0.73268223 -0.63656936
    ## gp    1.27046482 0.021599777 0.38545075  0.4743465  1.00602424  1.27524445
    ## kmax  0.39678555 0.002071610 0.04115834  0.3254801  0.36790344  0.39516817
    ##              75%         97.5%
    ## k     0.67665467  0.7579053331
    ## linf 15.56141182 16.6688098239
    ## t0   -0.03029733  0.0002627525
    ## sl   -0.54233405 -0.3661309495
    ## gp    1.53664984  2.0088021238
    ## kmax  0.42269735  0.4870906924

Citation
========

**add citation data paper **

References
==========
