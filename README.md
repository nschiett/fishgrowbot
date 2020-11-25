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

    ## Installing package into '/Users/runner/work/_temp/Library'
    ## (as 'lib' is unspecified)

    ## also installing the dependencies 'utf8', 'pillar', 'pkgconfig', 'vctrs', 'BH', 'sys', 'ini', 'tibble', 'lazyeval', 'later', 'askpass', 'diffobj', 'clipr', 'crayon', 'curl', 'fs', 'gh', 'git2r', 'purrr', 'rematch2', 'rprojroot', 'whisker', 'processx', 'R6', 'assertthat', 'fansi', 'rex', 'htmlwidgets', 'crosstalk', 'promises', 'openssl', 'prettyunits', 'xopen', 'brew', 'commonmark', 'Rcpp', 'xml2', 'brio', 'lifecycle', 'praise', 'ps', 'waldo', 'usethis', 'callr', 'cli', 'covr', 'desc', 'DT', 'ellipsis', 'httr', 'memoise', 'pkgbuild', 'pkgload', 'rcmdcheck', 'remotes', 'roxygen2', 'rstudioapi', 'rversions', 'sessioninfo', 'testthat', 'withr'

    ## 
    ## The downloaded binary packages are in
    ##  /var/folders/24/8k48jl6d249_n_qfxwsl6xvm0000gn/T//RtmpPLSxEB/downloaded_packages

    ## Using bundled GitHub PAT. Please add your own PAT to the env var `GITHUB_PAT`

    ## Downloading GitHub repo nschiett/fishgrowbot@HEAD

    ## backports    (NA -> 1.2.0    ) [CRAN]
    ## matrixStats  (NA -> 0.57.0   ) [CRAN]
    ## checkmate    (NA -> 2.0.0    ) [CRAN]
    ## gtable       (NA -> 0.3.0    ) [CRAN]
    ## colorspace   (NA -> 2.0-0    ) [CRAN]
    ## viridisLite  (NA -> 0.3.0    ) [CRAN]
    ## RColorBrewer (NA -> 1.1-2    ) [CRAN]
    ## munsell      (NA -> 0.5.0    ) [CRAN]
    ## labeling     (NA -> 0.4.2    ) [CRAN]
    ## farver       (NA -> 2.0.3    ) [CRAN]
    ## scales       (NA -> 1.1.1    ) [CRAN]
    ## isoband      (NA -> 0.2.2    ) [CRAN]
    ## RcppEigen    (NA -> 0.3.3.7.0) [CRAN]
    ## RcppParallel (NA -> 5.0.2    ) [CRAN]
    ## V8           (NA -> 3.4.0    ) [CRAN]
    ## loo          (NA -> 2.3.1    ) [CRAN]
    ## gridExtra    (NA -> 2.3      ) [CRAN]
    ## inline       (NA -> 0.3.16   ) [CRAN]
    ## ggplot2      (NA -> 3.3.2    ) [CRAN]
    ## StanHeaders  (NA -> 2.21.0-6 ) [CRAN]
    ## tidyselect   (NA -> 1.1.0    ) [CRAN]
    ## generics     (NA -> 0.1.0    ) [CRAN]
    ## rstan        (NA -> 2.21.2   ) [CRAN]
    ## rstantools   (NA -> 2.1.1    ) [CRAN]
    ## dplyr        (NA -> 1.0.2    ) [CRAN]

    ## Installing 25 packages: backports, matrixStats, checkmate, gtable, colorspace, viridisLite, RColorBrewer, munsell, labeling, farver, scales, isoband, RcppEigen, RcppParallel, V8, loo, gridExtra, inline, ggplot2, StanHeaders, tidyselect, generics, rstan, rstantools, dplyr

    ## Installing packages into '/Users/runner/work/_temp/Library'
    ## (as 'lib' is unspecified)

    ## 
    ##   There is a binary version available but the source version is later:
    ##       binary source needs_compilation
    ## rstan 2.21.1 2.21.2              TRUE
    ## 
    ## 
    ## The downloaded binary packages are in
    ##  /var/folders/24/8k48jl6d249_n_qfxwsl6xvm0000gn/T//RtmpPLSxEB/downloaded_packages

    ## installing the source package 'rstan'

    ##      checking for file ‘/private/var/folders/24/8k48jl6d249_n_qfxwsl6xvm0000gn/T/RtmpPLSxEB/remotes62a15bfec2a/nschiett-fishgrowbot-b2e20b5/DESCRIPTION’ ...  [32m✔[39m  [90mchecking for file ‘/private/var/folders/24/8k48jl6d249_n_qfxwsl6xvm0000gn/T/RtmpPLSxEB/remotes62a15bfec2a/nschiett-fishgrowbot-b2e20b5/DESCRIPTION’[39m[36m[39m
    ##   [90m─[39m[90m  [39m[90mpreparing ‘fishgrowbot’:[39m[36m[39m
    ##      checking DESCRIPTION meta-information ...  [32m✔[39m  [90mchecking DESCRIPTION meta-information[39m[36m[39m
    ##   [90m─[39m[90m  [39m[90mcleaning src[39m[36m[39m
    ##   [90m─[39m[90m  [39m[90mchecking for LF line-endings in source and make files and shell scripts[39m[36m[39m
    ##   [90m─[39m[90m  [39m[90mchecking for empty or unneeded directories[39m[36m[39m
    ##      Removed empty directory ‘fishgrowbot/paper’
    ##    Removed empty directory ‘fishgrowbot/vignettes’
    ##        NB: this package now depends on R (>= 3.5.0)
    ##        WARNING: Added dependency on R >= 3.5.0 because serialized objects in  serialize/load version 3 cannot be read in older versions of R.  File(s) containing such objects:  ‘fishgrowbot/data/coral_reef_fishes_data.RData’
    ## [90m─[39m[90m  [39m[90mbuilding ‘fishgrowbot_0.0.0.9000.tar.gz’[39m[36m[39m
    ##      
    ## 

    ## Installing package into '/Users/runner/work/_temp/Library'
    ## (as 'lib' is unspecified)

Use
===

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
    ## Chain 1: Gradient evaluation took 5.7e-05 seconds
    ## Chain 1: 1000 transitions using 10 leapfrog steps per transition would take 0.57 seconds.
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
    ## Chain 1:  Elapsed Time: 0.678274 seconds (Warm-up)
    ## Chain 1:                0.194189 seconds (Sampling)
    ## Chain 1:                0.872463 seconds (Total)
    ## Chain 1: 
    ## 
    ## SAMPLING FOR MODEL 'stan_bcalc' NOW (CHAIN 2).
    ## Chain 2: 
    ## Chain 2: Gradient evaluation took 2.5e-05 seconds
    ## Chain 2: 1000 transitions using 10 leapfrog steps per transition would take 0.25 seconds.
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
    ## Chain 2:  Elapsed Time: 0.641965 seconds (Warm-up)
    ## Chain 2:                0.226217 seconds (Sampling)
    ## Chain 2:                0.868182 seconds (Total)
    ## Chain 2: 
    ## 
    ## SAMPLING FOR MODEL 'stan_bcalc' NOW (CHAIN 3).
    ## Chain 3: 
    ## Chain 3: Gradient evaluation took 2.7e-05 seconds
    ## Chain 3: 1000 transitions using 10 leapfrog steps per transition would take 0.27 seconds.
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
    ## Chain 3:  Elapsed Time: 0.741646 seconds (Warm-up)
    ## Chain 3:                0.200978 seconds (Sampling)
    ## Chain 3:                0.942624 seconds (Total)
    ## Chain 3: 
    ## 
    ## SAMPLING FOR MODEL 'stan_bcalc' NOW (CHAIN 4).
    ## Chain 4: 
    ## Chain 4: Gradient evaluation took 2.7e-05 seconds
    ## Chain 4: 1000 transitions using 10 leapfrog steps per transition would take 0.27 seconds.
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
    ## Chain 4:  Elapsed Time: 0.619981 seconds (Warm-up)
    ## Chain 4:                0.220003 seconds (Sampling)
    ## Chain 4:                0.839984 seconds (Total)
    ## Chain 4:

``` r
head(bc$lengths)
```

    ##                   id age      l_m         l_sd     l_lb     l_ub
    ## 1 EP_ME_MO_03_16_001   0   1.5000 1.079920e-15   1.5000   1.5000
    ## 2 EP_ME_MO_03_16_001   1 154.3720 5.777569e+00 143.3065 166.0029
    ## 3 EP_ME_MO_03_16_001   2 178.4520 4.567045e+00 169.6294 187.5710
    ## 4 EP_ME_MO_03_16_001   3 192.2101 3.738804e+00 184.9557 199.6435
    ## 5 EP_ME_MO_03_16_001   4 205.6997 2.838693e+00 200.1697 211.3212
    ## 6 EP_ME_MO_03_16_001   5 217.7897 1.962512e+00 213.9536 221.6630

``` r
# fit growth model
growthmodel <-fishgrowbot::growthreg(length = bc$lengths$l_m/10, age = bc$length$age, id = bc$length$id, lmax = 32, linf_m = 30, chains = 1)
```

    ## 
    ## SAMPLING FOR MODEL 'vonbert' NOW (CHAIN 1).
    ## Chain 1: Rejecting initial value:
    ## Chain 1:   Error evaluating the log probability at the initial value.
    ## Chain 1: Exception: normal_lpdf: Location parameter[1] is nan, but must be finite!  (in 'model_vonbert' at line 56)
    ## 
    ## Chain 1: Rejecting initial value:
    ## Chain 1:   Error evaluating the log probability at the initial value.
    ## Chain 1: Exception: normal_lpdf: Location parameter[1] is nan, but must be finite!  (in 'model_vonbert' at line 56)
    ## 
    ## Chain 1: Rejecting initial value:
    ## Chain 1:   Error evaluating the log probability at the initial value.
    ## Chain 1: Exception: normal_lpdf: Location parameter[1] is nan, but must be finite!  (in 'model_vonbert' at line 56)
    ## 
    ## Chain 1: 
    ## Chain 1: Gradient evaluation took 0.000108 seconds
    ## Chain 1: 1000 transitions using 10 leapfrog steps per transition would take 1.08 seconds.
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
    ## Chain 1:  Elapsed Time: 4.54578 seconds (Warm-up)
    ## Chain 1:                3.97356 seconds (Sampling)
    ## Chain 1:                8.51933 seconds (Total)
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

    ##             mean      se_mean         sd        2.5%         25%         50%
    ## k     0.64572152 0.0036265634 0.05463939  0.54395964  0.60798548  0.64555772
    ## linf 14.84683297 0.1117899991 1.14141118 12.77656647 14.11735018 14.85715338
    ## t0   -0.04571065 0.0009926927 0.02515957 -0.09419856 -0.06225563 -0.04518327
    ## kmax  0.39747023 0.0023716203 0.04135692  0.32434818  0.36707653  0.39491713
    ##              75%        97.5%
    ## k     0.67960860  0.755421511
    ## linf 15.47661279 17.522791882
    ## t0   -0.02834019  0.002258729
    ## kmax  0.42452917  0.477170442

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
