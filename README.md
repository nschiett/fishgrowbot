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
[![R build
status](https://github.com/nschiett/fishgrowbot/workflows/R-CMD-check/badge.svg)](https://github.com/nschiett/fishgrowbot/actions)
<!-- badges: end -->
<img src="man/figures/fishgrowbot_logo_white.png" width = 120 alt="fishgrowbot logo"/>

fishgrowbot: Fish growth curves through back-calculation of otoliths rings in a Bayesian framework
==================================================================================================

The `fishgrowbot` package provides a tool to conduct back-calculation
based on otolith readings and fit the Von Bertalanffy growth curve with
a hierarchical structure, both in a Bayesian framework.

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
library(fishgrowbot)
```

Use
===

undefined exports: bcalc

Let’s look at an example for *Epinephelus merra*

``` r
library(fishgrowbot)
library(dplyr)

# get data
em <- dplyr::filter(fishgrowbot::coral_reef_fishes_data, species == "Epinephelus merra", location == "Moorea")

# back-calculation
bc <- fishgrowbot::bcalc(data = em)
```

    ## 
    ## SAMPLING FOR MODEL 'stan_bcalc' NOW (CHAIN 1).
    ## Chain 1: 
    ## Chain 1: Gradient evaluation took 3.8e-05 seconds
    ## Chain 1: 1000 transitions using 10 leapfrog steps per transition would take 0.38 seconds.
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
    ## Chain 1:  Elapsed Time: 0.644955 seconds (Warm-up)
    ## Chain 1:                0.204636 seconds (Sampling)
    ## Chain 1:                0.849591 seconds (Total)
    ## Chain 1: 
    ## 
    ## SAMPLING FOR MODEL 'stan_bcalc' NOW (CHAIN 2).
    ## Chain 2: 
    ## Chain 2: Gradient evaluation took 2.1e-05 seconds
    ## Chain 2: 1000 transitions using 10 leapfrog steps per transition would take 0.21 seconds.
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
    ## Chain 2:  Elapsed Time: 0.624194 seconds (Warm-up)
    ## Chain 2:                0.200124 seconds (Sampling)
    ## Chain 2:                0.824318 seconds (Total)
    ## Chain 2: 
    ## 
    ## SAMPLING FOR MODEL 'stan_bcalc' NOW (CHAIN 3).
    ## Chain 3: 
    ## Chain 3: Gradient evaluation took 2.2e-05 seconds
    ## Chain 3: 1000 transitions using 10 leapfrog steps per transition would take 0.22 seconds.
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
    ## Chain 3:  Elapsed Time: 0.63502 seconds (Warm-up)
    ## Chain 3:                0.311621 seconds (Sampling)
    ## Chain 3:                0.946641 seconds (Total)
    ## Chain 3: 
    ## 
    ## SAMPLING FOR MODEL 'stan_bcalc' NOW (CHAIN 4).
    ## Chain 4: 
    ## Chain 4: Gradient evaluation took 2.1e-05 seconds
    ## Chain 4: 1000 transitions using 10 leapfrog steps per transition would take 0.21 seconds.
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
    ## Chain 4:  Elapsed Time: 0.664005 seconds (Warm-up)
    ## Chain 4:                0.225267 seconds (Sampling)
    ## Chain 4:                0.889272 seconds (Total)
    ## Chain 4:

``` r
head(bc$lengths)
```

    ##                   id age      l_m         l_sd     l_lb     l_ub
    ## 1 EP_ME_MO_03_16_001   0   1.5000 1.345088e-15   1.5000   1.5000
    ## 2 EP_ME_MO_03_16_001   1 154.3433 6.045563e+00 142.8137 166.4680
    ## 3 EP_ME_MO_03_16_001   2 178.4268 4.774458e+00 169.2306 187.9305
    ## 4 EP_ME_MO_03_16_001   3 192.1884 3.906893e+00 184.6252 199.9343
    ## 5 EP_ME_MO_03_16_001   4 205.6826 2.965197e+00 199.9160 211.5397
    ## 6 EP_ME_MO_03_16_001   5 217.7774 2.049353e+00 213.7766 221.8126

``` r
# fit growth model
growthmodel <-fishgrowbot::growthreg(length = bc$lengths$l_m/10, age = bc$length$age, id = bc$length$id, lmax = 32, linf_m = 30, chains = 1)
```

    ## 
    ## SAMPLING FOR MODEL 'vonbert' NOW (CHAIN 1).
    ## Chain 1: Rejecting initial value:
    ## Chain 1:   Error evaluating the log probability at the initial value.
    ## Chain 1: Exception: normal_lpdf: Location parameter[1] is -nan, but must be finite!  (in 'model_vonbert' at line 56)
    ## 
    ## Chain 1: Rejecting initial value:
    ## Chain 1:   Error evaluating the log probability at the initial value.
    ## Chain 1: Exception: normal_lpdf: Location parameter[1] is -nan, but must be finite!  (in 'model_vonbert' at line 56)
    ## 
    ## Chain 1: Rejecting initial value:
    ## Chain 1:   Error evaluating the log probability at the initial value.
    ## Chain 1: Exception: normal_lpdf: Location parameter[22] is -nan, but must be finite!  (in 'model_vonbert' at line 56)
    ## 
    ## Chain 1: Rejecting initial value:
    ## Chain 1:   Error evaluating the log probability at the initial value.
    ## Chain 1: Exception: normal_lpdf: Location parameter[14] is -nan, but must be finite!  (in 'model_vonbert' at line 56)
    ## 
    ## Chain 1: Rejecting initial value:
    ## Chain 1:   Error evaluating the log probability at the initial value.
    ## Chain 1: Exception: normal_lpdf: Location parameter[1] is -nan, but must be finite!  (in 'model_vonbert' at line 56)
    ## 
    ## Chain 1: Rejecting initial value:
    ## Chain 1:   Error evaluating the log probability at the initial value.
    ## Chain 1: Exception: normal_lpdf: Location parameter[9] is -nan, but must be finite!  (in 'model_vonbert' at line 56)
    ## 
    ## Chain 1: Rejecting initial value:
    ## Chain 1:   Error evaluating the log probability at the initial value.
    ## Chain 1: Exception: normal_lpdf: Location parameter[1] is -nan, but must be finite!  (in 'model_vonbert' at line 56)
    ## 
    ## Chain 1: Rejecting initial value:
    ## Chain 1:   Error evaluating the log probability at the initial value.
    ## Chain 1: Exception: normal_lpdf: Location parameter[1] is -nan, but must be finite!  (in 'model_vonbert' at line 56)
    ## 
    ## Chain 1: Rejecting initial value:
    ## Chain 1:   Error evaluating the log probability at the initial value.
    ## Chain 1: Exception: normal_lpdf: Location parameter[1] is -nan, but must be finite!  (in 'model_vonbert' at line 56)
    ## 
    ## Chain 1: Rejecting initial value:
    ## Chain 1:   Error evaluating the log probability at the initial value.
    ## Chain 1: Exception: normal_lpdf: Location parameter[1] is -nan, but must be finite!  (in 'model_vonbert' at line 56)
    ## 
    ## Chain 1: Rejecting initial value:
    ## Chain 1:   Error evaluating the log probability at the initial value.
    ## Chain 1: Exception: normal_lpdf: Location parameter[1] is -nan, but must be finite!  (in 'model_vonbert' at line 56)
    ## 
    ## Chain 1: Rejecting initial value:
    ## Chain 1:   Error evaluating the log probability at the initial value.
    ## Chain 1: Exception: normal_lpdf: Location parameter[1] is -nan, but must be finite!  (in 'model_vonbert' at line 56)
    ## 
    ## Chain 1: Rejecting initial value:
    ## Chain 1:   Error evaluating the log probability at the initial value.
    ## Chain 1: Exception: normal_lpdf: Location parameter[1] is -nan, but must be finite!  (in 'model_vonbert' at line 56)
    ## 
    ## Chain 1: Rejecting initial value:
    ## Chain 1:   Error evaluating the log probability at the initial value.
    ## Chain 1: Exception: normal_lpdf: Location parameter[1] is -nan, but must be finite!  (in 'model_vonbert' at line 56)
    ## 
    ## Chain 1: Rejecting initial value:
    ## Chain 1:   Error evaluating the log probability at the initial value.
    ## Chain 1: Exception: normal_lpdf: Location parameter[22] is -nan, but must be finite!  (in 'model_vonbert' at line 56)
    ## 
    ## Chain 1: Rejecting initial value:
    ## Chain 1:   Error evaluating the log probability at the initial value.
    ## Chain 1: Exception: normal_lpdf: Location parameter[14] is -nan, but must be finite!  (in 'model_vonbert' at line 56)
    ## 
    ## Chain 1: Rejecting initial value:
    ## Chain 1:   Error evaluating the log probability at the initial value.
    ## Chain 1: Exception: normal_lpdf: Location parameter[1] is -nan, but must be finite!  (in 'model_vonbert' at line 56)
    ## 
    ## Chain 1: 
    ## Chain 1: Gradient evaluation took 7.1e-05 seconds
    ## Chain 1: 1000 transitions using 10 leapfrog steps per transition would take 0.71 seconds.
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
    ## Chain 1:  Elapsed Time: 3.66925 seconds (Warm-up)
    ## Chain 1:                4.08406 seconds (Sampling)
    ## Chain 1:                7.75331 seconds (Total)
    ## Chain 1:

    ## Warning: Bulk Effective Samples Size (ESS) is too low, indicating posterior means and medians may be unreliable.
    ## Running the chains for more iterations may help. See
    ## http://mc-stan.org/misc/warnings.html#bulk-ess

    ## Warning: Tail Effective Samples Size (ESS) is too low, indicating posterior variances and tail quantiles may be unreliable.
    ## Running the chains for more iterations may help. See
    ## http://mc-stan.org/misc/warnings.html#tail-ess

![](README_files/figure-markdown_github/growthmodel-1.png)

``` r
# summary growth parameters
growthmodel$summary
```

    ##            mean     se_mean         sd       2.5%         25%         50%
    ## k     0.6433494 0.003457281 0.05544276  0.5453826  0.60444038  0.64071513
    ## linf 14.9269596 0.106281547 1.10512815 12.7280717 14.22951206 14.84986129
    ## t0   -0.0467175 0.001131462 0.02695627 -0.1013643 -0.06314001 -0.04485271
    ## kmax  0.3974375 0.002240823 0.04125992  0.3245437  0.36976729  0.39376009
    ##              75%        97.5%
    ## k     0.67953513  0.759401159
    ## linf 15.63303706 17.213669663
    ## t0   -0.02888806  0.001734448
    ## kmax  0.42299185  0.481921301

Citation
========

    ## Warning in citation("fishgrowbot"): no date field in DESCRIPTION file of package
    ## 'fishgrowbot'

    ## 
    ## To cite package 'fishgrowbot' in publications use:
    ## 
    ##   Nina M. D. Schiettekatte (2020). fishgrowbot: Fish growth curves
    ##   through back-calculation of otoliths rings in a Bayesian framework. R
    ##   package version 0.0.0.9000.
    ## 
    ## A BibTeX entry for LaTeX users is
    ## 
    ##   @Manual{,
    ##     title = {fishgrowbot: Fish growth curves through back-calculation of otoliths rings in
    ## a Bayesian framework},
    ##     author = {Nina M. D. Schiettekatte},
    ##     year = {2020},
    ##     note = {R package version 0.0.0.9000},
    ##   }

References
==========
