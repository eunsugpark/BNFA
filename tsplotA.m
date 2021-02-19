function tsplotA(ASnor,alpha)
%--------------------------
% function name: tsplotA
%
% Construct time seires plots of source contributions (A) 
% along with uncertainty estimates (95% posterior intervals).
%
% Usage example:
% tsplotA(ASnor,alpha);
%
% Inputs:
% ASnor: Stored MCMC samples for A (T by q by nsample)
% (T=number of observations (times), q=number of sources, nsample=number of stored samples)
% alpha: Significance level, e.g., 0.05
%
% Eun Sug Park, August 2020
% Last updated February 2021
%---------------------------------------------------

[T,q,nsample]=size(ASnor);
index_L=floor(alpha/2*nsample);
index_U=ceil((1-alpha/2)*nsample);

vecAS=reshape(ASnor,T*q,nsample)'; %nsample by Tq
vmeanA=mean(vecAS);
Ahat=reshape(vmeanA,T,q);

sortedAnor=sort(vecAS);
PI_A=sortedAnor([index_L index_U],:);
LPI_A=reshape(PI_A(1,:),T,q);  %Lower limit of PI for A
UPI_A=reshape(PI_A(2,:),T,q);  %Upper limit of PI for A

figure
for k=1:q
    subplot(q,1,k)
    plot((1:T),Ahat(:,k),'-',(1:T),LPI_A(:,k),'r-.',(1:T),UPI_A(:,k),'r-.')
    axis tight
    legend(['Source ',num2str(k)],'Location','North')   
    if k==1
        legend('Source 1','95% PI','Location','North')
        title('Source Contributions')
    elseif k==2
        ylabel('Mass concentration')
    elseif k==q
        xlabel('Observation #')
    end
end

