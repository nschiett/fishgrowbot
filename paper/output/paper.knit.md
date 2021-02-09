---
title: 'fishgrowbot: Fish growth curves through back-calculation of otoliths rings in a Bayesian framework'
tags:
  - R
  - fish
  - growth curve
  - otolith
  - regression
  - Bayesian
  - back-calculation
authors:
  - name: Nina M. D. Schiettekatte^[corresponding author]
    orcid: "0000-0002-1925-3484"
    affiliation: "1,2" # (Multiple affiliations must be quoted)
  - name: Jérémy Wicquart
    orcid: "0000-0003-3462-3188"
    affiliation: "1,2"
  - name: Diego R. Barneche
    orcid: "0000-0002-4568-2362"
    affiliation: "3,4"
  - name: Valeriano Parravicini
    orcid: "0000-0002-3408-1625"
    affiliation: "1,2"
affiliations:
  - name: "PSL Université Paris: EPHE-UPVD-CNRS, USR 3278 CRIOBE, Université de Perpignan, 52 Avenue Paul Alduy, 66860, Perpignan, Cedex, France"
    index: 1
  - name: "Laboratoire d’Excellence “CORAIL”, EPHE, Perpignan, France"
    index: 2
  - name: "Australian Institute of Marine Science, Indian Ocean Marine Research Centre, Crawley, WA 6009, Australia"
    index: 3
  - name: "Oceans Institute, The University of Western Australia, Crawley, WA 6009, Australia"
    index: 4
citation_author: Schiettekatte et al.
bibliography: paper.bib
date: "2021-02-08"
output:
  my_modified_joss:
    fig_caption: yes
csl: apa.csl
journal: JOSS
preserve_yaml: true
---



# Summary

Somatic growth of fishes is a fundamental trait that determines essential ecosystem services such as food provision and nutrient cycling. Growth rate information can be derived through age estimation based on the analysis of sagittal otoliths. While fitting growth models on size-at-age data is the most frequently employed approach to deriving growth parameters, this method requires a high number of individuals. An alternative approach based on back-calculation can provide approximations to individual-level growth trajectories. We present `fishgrowbot`, an R package that provides functions to perform the back-calculation in a Bayesian framework. Further, the package provides a Bayesian framework to fit the von Bertalanffy growth model to the back-calculated lengths in a hierarchical structure. Finally, `fishgrowbot` provides functions to visualize the results. These models have been verified and applied to estimate growth parameters of 45 coral reef species [@Morat2020]. `fishgrowbot` will greatly help researchers to estimate growth parameters, even when a limited amount of otoliths are available. 


# Background and statement of need

Somatic growth of fishes is a critical trait to estimate biological processes that range from individuals to communities [@Brandl2019front]. In the context of fisheries, parameters describing fish growth can be used directly to estimate an important ecosystem service, i.e. food production. Further, somatic growth rate is an important part of an individual's energy budget and thus underlies bioenergetic models that estimate fluxes of energy and elements mediated by fishes [@Schiettekatte2020]. Many ecosystems are under major anthropogenic pressure, and fish populations are in decline across the globe [@Jackson2001a]. As billions of people depend on fishes for food security and fishes can play an important role in nutrient cycling, it is critical to increase our ability to estimate growth parameters.
            
Fish growth can be estimated by relating fish length with the age. The most common method for aging fish is the analysis of growth rings found on otoliths (i.e. calcified structures of the inner ear that grow with the deposition of successive calcium carbonate layers, which respond to circadian or seasonal rhythms) [@Campana2001]. Then, fish growth parameters can be estimated by fitting growth curves on the size-at-age data [@Katsanevakis2006]. While there are many types of growth models, the von Bertalanffy growth curve is by far the most commonly used for fishes. Fitting growth curves calls for a large sample size of individuals with varying sizes. Alternatively, we can estimate individual growth trajectories by measuring the distances between growth rings, and transforming these to fish lengths, a process called back-calculation [@Vigliola2009; @Vigliola2000]. This approach facilitates fitting growth curves with less individuals and is thus less destructive. However, back-calculated lengths are rough estimates that include a level of uncertainty, that is not accounted for in currently described methods and existing tools [@Vigliola2009]. Moreover, the nature of back-calculated lengths demands a hierarchical modeling approach to account for autocorrelation within individuals growth trajectories. Developing such a model can be challenging and discouraging for the average R user, and there are currently no tools to aid fitting a von Bertalanffy growth model to back-calculated lengths.
               
`fishgrowbot` greatly facilitates the application of back-calculation and fitting of von Bertalanffy growth curves on back-calculated size-at-age data. Even though there are R packages for back-calculation and fitting growth models, `fishgowbot` brings a number of new features to the table. First, back-calculation in a Bayesian framework allows for a measure of uncertainty [@Stan2018], which to date has never been incorporated. Second, to the best of our knowledge, there are no existing R packages that aid fitting growth models, specifically for back-calculated lengths. Due to the individual-level autocorrelation in the data, it is necessary to incorporate a hierarchical structure. Further, aside from the hierarchical structure, the Bayesian framework allows for the incorporation of prior biological knowledge on maximum lengths and growth rate parameters. Third, the back-calculation approach can handle missing data on the otolith radius at hatching [@Carpenter2017], a handy feature as for some individuals this parameter is impossible to measure. The approach is validated through application on a dataset of 45 coral reef fish species [@Morat2020]. Finally, as a case study, the package provide the raw dataset of measured otoliths from 710 individuals belonging to 45 coral reef fish species from French Polynesia, that can be used to run examples or to easily include in ecological studies.    

# Use
To introduce the functionalities of `fishgrowbot`, we look at an example for
*Epinephelus merra*. The function `bcalc()` returns both a dataframe with the
back-calculated lengths and their uncertainty and the model object for more
details on the fit of the `bc` stan model.

The input data should contain:         
  + id: Unique fish id per individual.  
  + radi: Measurements of otolith growth rings (in mm).  
  + agei: Age estimation of fish.  
  + lencap: Length at capture (in mm).  
  + radcap: Radius of otolith at capture (in mm).  
  + l0p: Length of fish at hatching (in mm).  

```
# get data
em <- filter(coral_reef_fishes_data, species == "Epinephelus merra",
             location == "Moorea")
# back-calculation
bc <- bcalc(data = em)
```

```r
head(bc$lengths)
#>                   id age      l_m         l_sd     l_lb
#> 1 EP_ME_MO_03_16_001   0   1.5000 1.128774e-15   1.5000
#> 2 EP_ME_MO_03_16_001   1 154.4259 5.974260e+00 142.9839
#> 3 EP_ME_MO_03_16_001   2 178.4927 4.722040e+00 169.3684
#> 4 EP_ME_MO_03_16_001   3 192.2427 3.865491e+00 184.7394
#> 5 EP_ME_MO_03_16_001   4 205.7240 2.934744e+00 200.0037
#> 6 EP_ME_MO_03_16_001   5 217.8062 2.028838e+00 213.8378
#>       l_ub
#> 1   1.5000
#> 2 166.6931
#> 3 188.1044
#> 4 200.0750
#> 5 211.6452
#> 6 221.8849
```

The function `bcplot` helps visualize the back calculation. Setting error to TRUE adds the 95% credible intervals of the length estimates.     


```r
bcplot(bc$lengths, error = FALSE)
```

![](/media/nschiettekatte/DATA/phd/fishgrowbot/paper/output/paper_files/figure-latex/plot1a-1.pdf)<!-- --> 

Then, we can fit the hierarchical von Bertalanffy growth model that allows for
the estimation of multiple parameters. Importantly, length measures should be
given in cm. Priors for Linf (i.e. asymptotic length) and l0 (length at hatching) s
hould be specified by the user.     

```
# fit growth model
growthmodel <- growthreg(length = bc$lengths$l_m / 10, age =  bc$lengths$age,
                         id =  bc$lengths$id, lmax = 32, linf_m = 28,
                         linf_sd = 5, l0_m = 0.15, l0_sd = 0.015, iter = 4000,
                         open_progress = FALSE, plot = FALSE)
```

```r
# summary growth parameters
growthmodel$summary
#>             mean      se_mean         sd        2.5%
#> k     0.64728365 0.0013050289 0.05313437  0.55188996
#> linf 14.91202107 0.0419074435 1.01477370 13.01157752
#> l0    0.42724881 0.0036274574 0.23796891 -0.04770569
#> t0   -0.04604828 0.0004024627 0.02682270 -0.10221185
#> kmax  0.39736342 0.0007620744 0.04136444  0.32395683
#>             25%         50%         75%        97.5%
#> k     0.6108047  0.64403716  0.68136906  0.758708627
#> linf 14.2206930 14.89180874 15.55811456 17.028596030
#> l0    0.2735070  0.42967536  0.58117810  0.910408844
#> t0   -0.0624696 -0.04534149 -0.02825531  0.004690497
#> kmax  0.3675234  0.39518262  0.42425108  0.484690931
```

Now we can visualize the fit with the function `gmplot()`.


```r
gmplot(growthmodel)
```

![](/media/nschiettekatte/DATA/phd/fishgrowbot/paper/output/paper_files/figure-latex/plot2a-1.pdf)<!-- --> 

More plotting options are exemplified in the package documentation and introduction [vignette](https://nschiett.github.io/fishgrowbot/articles/introduction.html).     


# Acknowledgements

We thank Jordan M. Casey for designing the logo for fishgrowbot. 

# References
