-   [fishgrowbot: Fish growth curves through back-calculation of
    otoliths rings in a Bayesian
    framework](#fishgrowbot-fish-growth-curves-through-back-calculation-of-otoliths-rings-in-a-bayesian-framework)
-   [Installing and loading
    fishgrowbot](#installing-and-loading-fishgrowbot)
-   [Citation](#citation)

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
It contains:  
\* A function `bcalc()` to perform the back-calculations which yields
length-at-age estimations with measures of uncertainty.  
\* A function called `growthreg()` to fit the Von Bertalanffy growth
model.  
\* Functions to visualize results.

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

    ## also installing the dependencies 'utf8', 'sys', 'BH', 'pillar', 'pkgconfig', 'vctrs', 'askpass', 'credentials', 'zip', 'gitcreds', 'ini', 'lazyeval', 'later', 'diffobj', 'rematch2', 'tibble', 'clipr', 'crayon', 'curl', 'fs', 'gert', 'gh', 'lifecycle', 'purrr', 'rappdirs', 'rprojroot', 'whisker', 'processx', 'R6', 'assertthat', 'fansi', 'rex', 'htmlwidgets', 'crosstalk', 'promises', 'openssl', 'prettyunits', 'xopen', 'brew', 'commonmark', 'Rcpp', 'xml2', 'brio', 'praise', 'ps', 'waldo', 'usethis', 'callr', 'cli', 'covr', 'desc', 'DT', 'ellipsis', 'httr', 'memoise', 'pkgbuild', 'pkgload', 'rcmdcheck', 'remotes', 'roxygen2', 'rstudioapi', 'rversions', 'sessioninfo', 'testthat', 'withr'

    ## 
    ## The downloaded binary packages are in
    ##  /var/folders/24/8k48jl6d249_n_qfxwsl6xvm0000gn/T//RtmpANgBfG/downloaded_packages

    ## Using bundled GitHub PAT. Please add your own PAT to the env var `GITHUB_PAT`

    ## Downloading GitHub repo nschiett/fishgrowbot@HEAD

    ## backports    (NA -> 1.2.1    ) [CRAN]
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
    ## isoband      (NA -> 0.2.3    ) [CRAN]
    ## RcppEigen    (NA -> 0.3.3.9.1) [CRAN]
    ## RcppParallel (NA -> 5.0.2    ) [CRAN]
    ## V8           (NA -> 3.4.0    ) [CRAN]
    ## loo          (NA -> 2.4.1    ) [CRAN]
    ## gridExtra    (NA -> 2.3      ) [CRAN]
    ## inline       (NA -> 0.3.17   ) [CRAN]
    ## ggplot2      (NA -> 3.3.2    ) [CRAN]
    ## StanHeaders  (NA -> 2.21.0-7 ) [CRAN]
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
    ##  /var/folders/24/8k48jl6d249_n_qfxwsl6xvm0000gn/T//RtmpANgBfG/downloaded_packages

    ## installing the source package 'rstan'

    ##      checking for file ‘/private/var/folders/24/8k48jl6d249_n_qfxwsl6xvm0000gn/T/RtmpANgBfG/remotes691658c3edb/nschiett-fishgrowbot-86125d7/DESCRIPTION’ ...  [32m✔[39m  [90mchecking for file ‘/private/var/folders/24/8k48jl6d249_n_qfxwsl6xvm0000gn/T/RtmpANgBfG/remotes691658c3edb/nschiett-fishgrowbot-86125d7/DESCRIPTION’[39m[36m[39m
    ##   [90m─[39m[90m  [39m[90mpreparing ‘fishgrowbot’:[39m[36m[39m
    ##      checking DESCRIPTION meta-information ...  [32m✔[39m  [90mchecking DESCRIPTION meta-information[39m[36m[39m
    ##   [90m─[39m[90m  [39m[90mcleaning src[39m[36m[39m
    ##   [90m─[39m[90m  [39m[90mchecking for LF line-endings in source and make files and shell scripts[39m[36m[39m
    ##   [90m─[39m[90m  [39m[90mchecking for empty or unneeded directories[39m[36m[39m
    ##      Removed empty directory ‘fishgrowbot/paper’
    ##        NB: this package now depends on R (>= 3.5.0)
    ##        WARNING: Added dependency on R >= 3.5.0 because serialized objects in  serialize/load version 3 cannot be read in older versions of R.  File(s) containing such objects:  ‘fishgrowbot/data/coral_reef_fishes_data.RData’
    ## [90m─[39m[90m  [39m[90mbuilding ‘fishgrowbot_0.0.0.9000.tar.gz’[39m[36m[39m
    ##      
    ## 

    ## Installing package into '/Users/runner/work/_temp/Library'
    ## (as 'lib' is unspecified)

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
