% function name: pcplot
%
% Draw principal component plots of data and source profiles.
%
% pcplot(Y,Phat) draws the principal component plots of data (Y) and
% source profiles (rows) of the estimated source composition matrix (Phat).
%
% If there is another source composition matrix (P0) to compare 
% (e.g., P0 could be the true P in simulation or another estimate of P),
% pcplot(Y,Phat,P0) draws the principal component plots of data (Y), Phat,
% and P0.
%
% Written by Eun Sug Park, 7-31-1995.
% Last updated, August 2020.

function PCP = pcplot(Y,Phat,P0)

[n,J]=size(Y);
Yn=Y./kron(ones(1,J),sum(Y')');

[U,S,V]=svd(corrcoef(Y),0);
Z=Yn*V; %V : matrix of eigenvectors of the correlation matrix of Y    

% Principal Components
z1=Z(1:n,1);
z2=Z(1:n,2);
z3=Z(1:n,3);

figure
if nargin==1  
    subplot(221),plot(z1,z2,'c.');  
    xlabel('z1'),ylabel('z2')
    subplot(222),plot(z1,z3,'c.');
    xlabel('z1'),ylabel('z3')
    subplot(223),plot(z2,z3,'c.');
    xlabel('z2'),ylabel('z3')
elseif nargin>1   
    [q,J]=size(Phat);   
    Pn=Phat./kron(ones(1,J),sum(Phat')'); %Apply the sum-to-one constraint to each row.
    S=Pn*V; %V : matrix of eigenvectors of the correlation matrix of Y       
    % Principal Components
    s1=S(1:q,1);
    s2=S(1:q,2);
        
    if nargin==2
        if q==2  % q is the number of sources (factors)
            id_source=['S1';'S2'];
            plot(z1,z2,'c.',s1,s2,'m*');
            text(s1,s2,id_source);
        elseif q>2
            s3=S(1:q,3);
            if q==3
                id_source=['S1';'S2';'S3'];
            elseif q==4
                id_source=['S1';'S2';'S3';'S4'];
            elseif q==5
                id_source=['S1';'S2';'S3';'S4';'S5'];
            elseif q==6
                id_source=['S1';'S2';'S3';'S4';'S5';'S6'];
            elseif q==7
                id_source=['S1';'S2';'S3';'S4';'S5';'S6';'S7'];
            elseif q==8
                id_source=['S1';'S2';'S3';'S4';'S5';'S6';'S7';'S8'];
            elseif q==9
                id_source=['S1';'S2';'S3';'S4';'S5';'S6';'S7';'S8';'S9'];
            elseif q==10
                id_source=[' S1';' S2';' S3';' S4';' S5';' S6';' S7';' S8';' S9';'S10'];
            end
            
            subplot(221),plot(z1,z2,'c.',s1,s2,'m*');
            text(s1,s2,id_source);
            xlabel('z1'),ylabel('z2')
            
            subplot(222),plot(z1,z3,'c.',s1,s3,'m*');
            text(s1,s3,id_source);
            xlabel('z1'),ylabel('z3')
            
            subplot(223),plot(z2,z3,'c.',s2,s3,'m*');
            text(s2,s3,id_source);
            xlabel('z2'),ylabel('z3')
        end
        legend('data','Phat')
        
    elseif nargin==3
        [q0,J]=size(P0);
        P0n=normaliz(P0);
        T=P0n*V;
        t1=T(1:q0,1);
        t2=T(1:q0,2);
        
        if q==2
            id_source=['S1';'S2'];
            plot(z1,z2,'c.',s1,s2,'m*',t1,t2,'b^');
            text(s1,s2,id_source);
        elseif q>2
            s3=S(1:q,3);
            t3=T(1:q0,3);
            if q==3
                id_source=['S1';'S2';'S3'];
            elseif q==4
                id_source=['S1';'S2';'S3';'S4'];
            elseif q==5
                id_source=['S1';'S2';'S3';'S4';'S5'];
            elseif q==6
                id_source=['S1';'S2';'S3';'S4';'S5';'S6'];
            elseif q==7
                id_source=['S1';'S2';'S3';'S4';'S5';'S6';'S7'];
            elseif q==8
                id_source=['S1';'S2';'S3';'S4';'S5';'S6';'S7';'S8'];
            elseif q==9
                id_source=['S1';'S2';'S3';'S4';'S5';'S6';'S7';'S8';'S9'];
            elseif q==10
                id_source=[' S1';' S2';' S3';' S4';' S5';' S6';' S7';' S8';' S9';'S10'];
            end
            
            subplot(221),plot(z1,z2,'c.',s1,s2,'m*',t1,t2,'b^');
            text(s1,s2,id_source);
            xlabel('z1'),ylabel('z2')
            
            subplot(222),plot(z1,z3,'c.',s1,s3,'m*',t1,t3,'b^');
            text(s1,s3,id_source);
            xlabel('z1'),ylabel('z3')
            
            subplot(223),plot(z2,z3,'c.',s2,s3,'m*',t2,t3,'b^');
            text(s2,s3,id_source);
            xlabel('z2'),ylabel('z3')
        end
        legend('data', 'Phat','P0')
    end
end
