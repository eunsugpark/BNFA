%--------------------------------------------
%barplotP.m:
%Draw barplots for elements of source profiles (P)
%with error bars (lower and upper limits of 95% posterior intervals).
%
%Eun Sug Park, August 2020
%----------------------------------------
function Pbar= barplotP(P,LL,UL,variable_name)
%LL: Lower limit of error bar
%UL: Upper limit of error bar
%variable_name: J-dimensional vector containing variable names (optional)
[q,J]=size(P);
x = 1:J;
figure
if nargin==3
    for k=1:q
        subplot(q,1,k)
        P_bargraph = [P(k,:)];
        upper_limit = [UL(k,:)-P(k,:)];
        lower_limit  = [P(k,:)-LL(k,:)];
        
        bar(x,P_bargraph )
        axis auto
        ylabel(k)
        hold on     
        eb = errorbar(x,P_bargraph,lower_limit,upper_limit);
        grid on
        %grid minor
        eb.Color = [0 0 0];
        eb.LineStyle = 'none';        
        hold off
    end
elseif nargin==4
    for k=1:q
        subplot(q,1,k)
        P_bargraph = [P(k,:)];
        upper_limit = [UL(k,:)-P(k,:)];
        lower_limit  = [P(k,:)-LL(k,:)];
        
        bar(x,P_bargraph )
        set(gca,'xtick',[1:J],'xticklabel',variable_name)
        axis auto
        ylabel(k)
        hold on       
        eb = errorbar(x,P_bargraph,lower_limit,upper_limit);
        grid on
        %grid minor
        eb.Color = [0 0 0];
        eb.LineStyle = 'none';       
        hold off
    end
end
%-------------------


