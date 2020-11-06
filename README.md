# BNFA

MATLAB toolbox for Bayesian Nonnegative Factor Analysis and Bayesian Multivariate Receptor Modeling

(BNFA v.1.0)

* This toolbox implements Bayesian Nonnegative Factor Analysis (BNFA) including Bayesian multivariate receptor modeling and robust Bayesian multivariate receptor modeling by Markov chain Monte Carlo (MCMC) methods.

* Author: Eun Sug Park, Man-Suk Oh

* Maintainer: Eun Sug Park (e-park@tti.tamu.edu)

* Date: 2020-09-07


###  MATLAB Functions:

* BNFA.m (main function) 
 
* Gen_mvn_truncated.m
 
* idCond_check.m
 
* pcplot.m
 
* barplotP.m
 
* tsplotA.m
 
* traceplot_ACF_P.m
 
* traceplot.m
* BNFA_input.m (optional)

BNFA.m is the main function called for performing MCMC sampling to fit a Bayesian nonnegative factor analysis model and estimate parameters. Type 'help BNFA' in the MATLAB command window for description of input and output variables. It has the following MATLAB function call format:
    
```{r}
 [Phat,Ahat,DSigmahat]=BNFA(Y,q,muP);
 [Phat,Ahat,DSigmahat,stdP,stdA,stdDSigma]=BNFA(Y,q,muP);
 [Phat,Ahat,DSigmahat,stdP,stdA,stdDSigma]=BNFA(Y,q,muP,nBurnIn,nIter,nThin);
 [Phat,Ahat,DSigmahat,stdP,stdA,stdDSigma]=BNFA(Y,q,muP,nBurnIn,nIter,nThin,errdist,df,varP_free,xi,Omega,a0,b0,alpha);
 [Phat,Ahat,DSigmahat,stdP,stdA,stdDSigma,PSnor,ASnor,DSigmaS]=BNFA(Y,q,muP,nBurnIn,nIter,nThin,errdist,df,varP_free,xi,Omega,a0,b0,alpha);
 [Phat,Ahat,DSigmahat,stdP,stdA,stdDSigma,PSnor,ASnor,DSigmaS]=BNFA(Y,q,muP,nBurnIn,nIter,nThin,errdist,df,varP_free,xi,Omega,a0,b0,alpha,species_name);
```

 
### Reference:

 Park, E.S. and Oh, M.S. (2015), Robust Bayesian Multivariate Receptor Modeling,
 CHEMOMETRICS AND INTELLIGENT LABORATORY SYSTEMS,149, 215-226.

