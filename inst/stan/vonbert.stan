// generated with brms 2.8.0, modified by N.M.D.S.
functions {
}
data {
  int<lower=1> N;  // number of observations
  vector[N] y;  // response variable
  vector[N] x;  // age

  vector[N] X;  // population-level design vector

  // covariate vectors
  // data for group-level effects per individual fish
  int<lower=1> N_1;    // # of individuals
  int<lower=1> J[N]; // vector of integers for each unique ID

  real<lower=0> linf_prior;
  real<lower=0> linf_sd;
  real<lower=0> lmax;
  real<lower=0> l0_prior;
  real<lower=0> l0_sd;
}
transformed data {
}
parameters {
  real l0;  // population-level t0
  real<lower=0,upper=lmax> linf;  // population-level linf
  real<upper=0> sl;  // population-level sl
  real<lower=0> gp;  // population-level gp
  real<lower=0> sigma;  // residual SD
  vector<lower=0>[1] sd_linf;  // standard deviation for linf per individual
  vector[N_1] z_linf[1];  // unscaled effects on linf per individual
}
transformed parameters {
  // group-level effects
  vector[N_1] r_linf = (sd_linf[1] * (z_linf[1]));  //scaled effects on linf per individual
  real<lower=0> k = exp(sl * log(linf) + gp);
  real t0 = log(1-(l0/linf))/k;
}
model {
  vector[N] nlp_t0 = X * t0; // Vectorize all parameters
  vector[N] nlp_linf = X * linf;
  vector[N] nlp_sl = X * sl;
  vector[N] nlp_gp = X * gp;
  vector[N] mu;
  for (n in 1:N) {
    nlp_linf[n] += r_linf[J[n]] ; // add individual effects linf
  // compute non-linear predictor
    mu[n] = nlp_linf[n] * (1 - exp( - exp(nlp_sl[n] * log(nlp_linf[n]) + nlp_gp[n]) * (x[n] - nlp_t0[n]))); // expression "exp(nlp_sl[n] * log(nlp_linf[n]) + nlp_gp[n])" equals k, see Morais et al. 2018
  }
  // priors including all constants
  target += normal_lpdf(t0 | 0, 5);
  target += normal_lpdf(linf | linf_prior, 5);
  target += normal_lpdf(sl | -2.3, 0.22);
  target += normal_lpdf(gp | 3, 2);
  target += student_t_lpdf(sigma | 3, 0, 10)
    - 1 * student_t_lccdf(0 | 3, 0, 10);
  target += student_t_lpdf(sd_linf | 3, 0, 10)
    - 1 * student_t_lccdf(0 | 3, 0, 10);
  target += normal_lpdf(z_linf[1] | 0, 1);
  // likelihood including all constants
  target += normal_lpdf(y | mu, sigma);

}
generated quantities {
  vector[N_1] k_j;
  vector[N_1] linf_j;

  real kmax;

  vector[N] y_rep; // prediction per individual
  vector[N] y_m;   // prediction based onpopulation level parameter estimates
  vector[N] y_max; // prediction based on maximum length and kmax

     // k
  kmax = exp(gp + (sl*log(lmax)));

  // group-level k and linf per individual
   for (n in 1:N_1) {
    linf_j[n] = linf + r_linf[n];
    k_j[n] = exp(sl * log(linf_j[n]) + gp);
  }

  // Fitted values

   for (n in 1:N) {
     y_rep[n] = linf_j[J[n]] * (1 - exp( - k_j[J[n]] * (x[n] - t0))); // fitted values per individual
     y_m[n] = linf * (1 - exp( - k * (x[n] - t0)));      // fitted values for population level estimates of linf
     y_max[n] = lmax * (1 - exp( - kmax * (x[n] - t0))); // fitted values given maximum length
   }

}
