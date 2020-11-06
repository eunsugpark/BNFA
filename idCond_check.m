function [P_sub_rank,length_II,P_sub_matrix]=idCond_check(P);
%
%[P_sub_rank,P_sub_matrix]=idCond_check(P) computes the rank
%of the submatrices in identifiability condition C2.
%
%Eun Sug Park, 2017
%
%P: Input matrix containing preassigned zeros
%P_sub_rank: column vector containing the ranks of the submatrices in C2
%P_sub_matrix: Array containing the submatrices of identifiability
%condition C2
%
[q,J]=size(P);
s=q-1;%Number of zero elements in each row of matrix P
[II,JJ]=find(P'==0);
length_II=length(II);
%[II JJ} contains the matrix of two columns:
%Column 1 (II): the position of zeros in each row, i.e., the column numbers
%containing zeros of X for the row number saved in Column 2
%Column 2 (JJ): row numbers (1:q)
row_num=[1:q]';
P_sub_rank=zeros(q,1);
P_sub_matrix=zeros(s,s,q);
if length_II>0
    for ii=1:q
        row_num_sub=row_num;
        row_num_sub(ii)=[];
        P_sub=P(row_num_sub,II(s*(ii-1)+1:s*(ii-1)+s));
        P_sub_rank(ii)=rank(P_sub);
        P_sub_matrix(:,:,ii)=P_sub;
    end
end
    
    
