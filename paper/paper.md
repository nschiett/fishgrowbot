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
  - name: Valeriano Parravicini
    orcid: "0000-0002-3408-1625"
    affiliation: "1,2"
affiliations:
  - name: "PSL Université Paris: EPHE-UPVD-CNRS, USR 3278 CRIOBE, Université de Perpignan, 52 Avenue Paul Alduy, 66860, Perpignan, Cedex, France"
    index: 1
  - name: "Laboratoire d’Excellence “CORAIL”, EPHE, Perpignan, France"
    index: 2
bibliography: paper.bib
date: "2021-01-12"
output:
  md_document:
    variant: markdown_github
    toc: true
    toc_depth: 1
preserve_yaml: true
---

Summary
=======

Somatic growth of fishes is an essential trait driving essential
ecosstem services such as food provision and nutrient cycling. Growth
rate information can be derived through age estimation based on the
analysis of sagittal otoliths. While fitting growth models on
size-at-age data is the most frequently used approach to derive growth
parameters, this method requires a high number of individuals. An
alternative approach based on back-calculation can provide
approximations individual-level growth trajectories. We present
`fishgrowbot`, an R package that provides functions to perform the
back-calculation in a Bayesian framework. Further, the package provides
a Bayesian framework to fit the Von Bertalanffy growth model to the
back-calculated lengths in a hierarchical structure. Finally,
`fishgrowbot` provides functions to visualize the results. These models
have been verified and applied to estimate growth parameters of 45 coral
reef species (Morat et al. 2020). `fishgrowbot` will greatly help
researchers to estimate growth parameters, even when a limited amount of
otoliths are available.

Background and statement of need
================================

Somatic growth of fishes is a critical trait to estimate biological
processes that range from individuals to communities (Brandl et al.
2019). In the context of fisheries, parameters describing fish growth
can be used directly to estimate an important ecosystem service,
i.e. food production. Further, somatic growth rate is an important part
of an individual’s energy budget and thus underlies bioenergetic models
that estimate fluxes of energy and elements mediated by fishes
(Schiettekatte et al. 2020). Many ecosystems are under major
anthropogenic pressure, and fish populations are in decline across the
globe (Jackson et al. 2001). As billions of people depend on fishes for
food security and fishes can play an important role in nutrient cycling,
it is critical to increase our ability to estimate growth parameters.

Fish growth can be estimated by relating fish length with the age. The
most common method for aging fish is the analysis of growth rings found
on otoliths (i.e. calcified structures of the inner ear that grow with
the deposition of successive calcium carbonate layers, which respond to
circadian or seasonal rhythms) (Campana 2001). Then, fish growth
parameters can be estimated by fitting growth curves on the size at age
data (Katsanevakis 2006). While there are many types of growth models,
the Von Bertalanffy growth curve is by far the most commonly used for
fishes. Fitting growth curves calls for a large sample size of
individuals with varying sizes. Alternatively, we can estimate
individual growth trajectories by measuring the distances between growth
rings, and transforming these to fish lengths, a process called
back-calculation (Vigliola and Meekan 2009; Vigliola, Harmelin-Vivien,
and Meekan 2000). This approach is interesting because we can fit growth
curves with a lot less individuals and is thus less destructive.
However, back-calculated lengths are rough estimates that include a
level of uncertainty, that is not accounted for in currently described
methods and existing tools (Vigliola and Meekan 2009). Moreover, the
nature of back-calculated lengths demands a hierarchical modeling
approach to account for autocorrelation within individuals. Developing
such a model can be challenging and discouraging for the average R user,
and there are currently no tools to aid fitting a Von Bertalanffy growth
model to back-calculated lengths.

`fishgrowbot` greatly facilitates the application of back-calculation
and fitting of Von Bertalanffy growth curves on back-calculated
size-at-age data. Even though there are R packages for back-calculation
and fitting growth models, `fishgowbot` brings a number of new features
to the table. First, back-calculation in a Bayesian framework allows for
a measure of uncertainty (Stan Development Team 2018), which to date has
never been incorporated. Second, to our knowledge, there are no existing
R packages that aid fitting growth models, specifically for
back-calculated lengths. Due to the individual-level autocorrelation in
the data, it is nescessairy to incorporate a hierarchical structure.
Further, aside from the hierarchical structure, the Bayesian framework
allows for the incorporation of prior biological knowledge on maximum
lengths and growth rate parameters. Third, the back-calculation approach
can handle missing data on the otolith radius at hatching (Carpenter et
al. 2017), a handy feature as for some individuals this parameter is
impossible to measure. The approach is validated through application on
a dataset of 45 coral reef fish species (Morat et al. 2020). Finally, as
a bonus, the package provide the raw dataset of measured otoliths from
710 individuals belonging to 45 coral reef fish species from French
Polynesia, that can be used to run examples or to easily include in
ecological studies.

Acknowledgements
================

We acknowledge contributions from…. We thank Jordan M. Casey for
designing the logo for fishgrowbot.

References
==========

Brandl, Simon J, Douglas B Rasher, Isabelle M Côté, Jordan M Casey,
Emily S Darling, Jonathan S Lefcheck, and J Emmett Duffy. 2019. “Coral
reef ecosystem functioning: eight core processes and the role of
biodiversity.” *Frontiers in Ecology and the Environment, Advance Online
Publication.* 17 (8). John Wiley & Sons, Ltd:445–54.
<https://doi.org/10.1002/fee.2088>.

Campana, S. E. 2001. “Accuracy, precision and quality control in age
determination, including a review of the use and abuse of age validation
methods.” *Journal of Fish Biology* 59:197–242.
<https://doi.org/10.1111/j.1095-8649.2001.tb00127.x>.

Carpenter, Bob, Andrew Gelman, Matthew D. Hoffman, Daniel Lee, Ben
Goodrich, Michael Betancourt, Marcus Brubaker, Jiqiang Guo, Peter Li,
and Allen Riddell. 2017. “Stan : A Probabilistic Programming Language.”
*Journal of Statistical Software* 76 (1):1–31.
<https://doi.org/10.18637/jss.v076.i01>.

Jackson, J B, M X Kirby, W H Berger, K A Bjorndal, L W Botsford, B J
Bourque, R H Bradbury, et al. 2001. “Historical overfishing and the
recent collapse of coastal ecosystems.” *Science (New York, N.Y.)* 293
(5530). American Association for the Advancement of Science:629–37.
<https://doi.org/10.1126/science.1059199>.

Katsanevakis, Stelios. 2006. “Modelling fish growth: Model selection,
multi-model inference and model selection uncertainty.” *Fisheries
Research* 81 (2-3). Elsevier:229–35.
<https://doi.org/10.1016/j.fishres.2006.07.002>.

Morat, Fabien, Jérémy Wicquart, Nina M.D. Schiettekatte, Guillemette de
Sinéty, Jean Bienvenu, Jordan M. Casey, Simon J. Brandl, et al. 2020.
“Individual back-calculated size-at-age based on otoliths from Pacific
coral reef fish species.” *Scientific Data* 7 (370).
<https://doi.org/10.1038/s41597-020-00711-y>.

Schiettekatte, Nina M D, Diego R Barneche, Sébastien Villéger, Jacob E
Allgeier, Deron E Burkepile, Simon J Brandl, Jordan M Casey, et al.
2020. “Nutrient limitation, bioenergetics, and stoichiometry: a new
model to predict elemental fluxes mediated by fishes.” *Functional
Ecology* 34 (9):1857–69. <https://doi.org/10.1111/1365-2435.13618>.

Stan Development Team. 2018. “RStan: the R interface to Stan. R package
version 2.17.3.” <https://doi.org/10.3168/jds.S0022-0302(63)89186-9>.

Vigliola, Laurent, Mireille Harmelin-Vivien, and Mark G. Meekan. 2000.
“Comparison of techniques of back-calculation of growth and settlement
marks from the otoliths of three species of &lt;i&gt;Diplodus&lt;/i&gt;
from the Mediterranean Sea.” *Canadian Journal of Fisheries and Aquatic
Sciences* 57 (6). Canadian Science Publishing:1291–9.
<https://doi.org/10.1139/cjfas-57-6-1291>.

Vigliola, Laurent, and Mark G. Meekan. 2009. “The Back-Calculation of
Fish Growth From Otoliths.” In *Tropical Fish Otoliths: Information for
Assessment, Management and Ecology*, 174–211.
<https://doi.org/10.1007/978-1-4020-5775-5_6>.

[1] corresponding author
