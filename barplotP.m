function barplotP(PSnor,alpha,variable_name)
%--------------------------------------------
% function name: barplotP
%
% Draw barplots for elements of source profiles (P)
% with error bars (lower and upper limits of 95% posterior intervals).
%
% Usage example:
% barplotP(PSnor,alpha,variable_name);
%
% Inputs:
% PSnor: Stored MCMC samples for P (q by J by nsample)
% (q=number of sources, J=number of variables, nsample=number of stored samples)
% alpha: Significance level, e.g., 0.05
% variable_name (optional): J-dimensional string vector containing variable names 
%
% Eun Sug Park, August 2020
% Last updated February 2021
%----------------------------------------

[q,J,nsample]=size(PSnor);
index_L=floor(alpha/2*nsample);
index_U=ceil((1-alpha/2)*nsample);

vecPS=reshape(PSnor,q*J,nsample)'; %nsample by qJ
vmeanP=mean(vecPS);
Phat=reshape(vmeanP,q,J);

sortedPnor=sort(vecPS);
PI_P=sortedPnor([index_L index_U],:); %PI: Posterior Interval
LPI_P=reshape(PI_P(1,:),q,J); %Lower limit of PI for P
UPI_P=reshape(PI_P(2,:),q,J); %Upper limit of PI for P

P=Phat*100;
LL=LPI_P*100; %Lower limit of error bar
UL=UPI_P*100; %Upper limit of error bar
x = 1:J;

figure
for k=1:q
    subplot(q,1,k)
    P_bargraph = [P(k,:)];
    upper_limit = [UL(k,:)-P(k,:)];
    lower_limit  = [P(k,:)-LL(k,:)];
    
    bar(x,P_bargraph )
    if nargin==3
        set(gca,'xtick',[1:J],'xticklabel',variable_name)
    end
    axis auto
    ylabel(['Source ',num2str(k)])
    if k==1
        title('Source Composition Profiles')
    elseif k==q
        xlabel('Species')
    end
    hold on
    eb = errorbar(x,P_bargraph,lower_limit,upper_limit);
    grid on
    eb.Color = [0 0 0];
    eb.LineStyle = 'none';
    hold off
end
%-------------------


