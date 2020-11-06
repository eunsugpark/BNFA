%--------------------------
%tsplotA.m:
%Construct time-seires plots of source contributions (A) along with 95% posterior intervals.
%--------------------------------------------------
%Time series plots of source contributions (A) along with 95% posterior intervals
%---------------------------------------------------

function TSA= tsplotA(Ahat, LPI_A95,UPI_A95)
 
YS=Ahat;%input('Ahat=');  %Estiamted T by q source contribution matrix
[T,q]=size(YS);

figure
subplot(q,1,1)
plot((1:T),YS(:,1),'-',(1:T),LPI_A95(:,1),'r-.',(1:T),UPI_A95(:,1),'r-.')
axis tight
legend('Source 1','95% PI','Location','North')
%title('Source 1')

subplot(q,1,2)
%plot(YS(:,5))
plot((1:T),YS(:,2),'-',(1:T),LPI_A95(:,2),'r-.',(1:T),UPI_A95(:,2),'r-.')
axis tight
ylabel('Mass concentration')
legend('Source 2','Location','North')

subplot(q,1,3)
%plot(YS(:,3))
plot((1:T),YS(:,3),'-',(1:T),LPI_A95(:,3),'r-.',(1:T),UPI_A95(:,3),'r-.')
axis tight
legend('Source 3','Location','North')
if q>3
    subplot(q,1,4)
    %plot(YS(:,1))
    plot((1:T),YS(:,4),'-',(1:T),LPI_A95(:,4),'r-.',(1:T),UPI_A95(:,4),'r-.')
    axis tight
    if q==4
        xlabel('Observation #')
    end
    legend('Source 4','Location','North')
    
    if q>4
        subplot(q,1,5)
        plot((1:T),YS(:,5),'-',(1:T),LPI_A95(:,5),'r-.',(1:T),UPI_A95(:,5),'r-.')
        axis tight
        if q==5
            xlabel('Observation #')
        end
        
        legend('Source 5','Location','North')
        
        if q>5
            subplot(q,1,6)
            plot((1:T),YS(:,6),'-',(1:T),LPI_A95(:,6),'r-.',(1:T),UPI_A95(:,6),'r-.')
            axis tight
            xlabel('Observation #')
            legend('Source 6','Location','North')
        end
    end
end

