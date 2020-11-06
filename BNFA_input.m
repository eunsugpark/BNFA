% Inputs:
% Y: T by J data matrix (T: number of observations, J: number of variables)
load ElPaso;  
%ElPaso.mat contains 'data' (numeric data matrix) and 'species_name' (string vector containing species name).

Y=data; 
[T,J]=size(Y);  %size of data: T=224, J=15 
%species_name: variable names<--Optional

% q: number of factors (number of major pollution sources)
q=4;

% muP: prior mean matrix (of size q by J) for the source composition matrix P 
% where zero values are assigned to prespecified 
% elements of muP to satisfy the identifiability conditions. 
% For the remaining free elements, any nonnegative numbers (between 0 and 1 preferably) 
% can be assigned (default=0.5).
% Note that even if an insufficient number of zeros (or no zeros) are prespecified, BNFA can
% still be run. The analysis in that case, however, should be considered an exploratory analysis. 
muP=0.5*ones(q,J);
muP(1,[1 6 14])=0; %<--Zeros are preassigned in 1st, 6th, and 14th species of Source 1.
muP(2,[6 8 9])=0; %<--Zeros are preassigned in 6th, 8th and 9th species of Source 2.
muP(3,[3 7 8])=0; %<--Zeros are preassigned in 3rd, 7th, and 8th species of Source 3.
muP(4,[7 10 14])=0; %<--Zeros are preassigned in 7th, 10th, and 14th species of Source 4.

% nBurnIn: number of iterations for the burn-in period in MCMC (default=1000)
nBurnIn=5000
% nIter: number of iterations in the sampling phase of MCMC 
% (i.e., after burn-in) for monitoring samples from MCMC (default=1000)
nIter=5000
% nThin: thinning interval for monitoring samples from MCMC (default=1)
nThin=1

% errdist: error distribution. Type 't' for t-distribution, 'normal' for normal distribution.
errdist='normal'

% df: degrees of freedom of a t-distribution when a t-distribution is assumed for errors (default=4)
df=4  %<--irrelevant when errdist='normal'

% varP_free: value of the prior variance of the free (non-zero) elements of P (default=100)
varP_free=100;

% xi: prior mean vector of the q-dimensional source contribution 
xi=ones(1,q)

% Omega: diagonal matrix of the prior variance of the q-dimensional source contribution 
Omega=eye(q)

% a0: shape parameter of the Inverse Gamma prior of the error variance (default=0.01)
a0=0.01;
% b0: scale parameter of the Inverse Gamma prior of the error variance (default=0.01)
b0=0.01;

% alpha: level for the posterior intervals (default=0.05). 
% For example, alpha = 0.05 results in 95% posterior intervals. 
alpha=0.05; 

