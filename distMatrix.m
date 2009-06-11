function d=distMatrix(A,B)
[hA,wA]=size(A);
[hB,wB]=size(B);
for k=1:wA
    %declare 'array' of submatrices
    C{k}= repmat(A(:,k),1,hB);
    D{k}= repmat(B(:,k),1,hA);
endfor
S=zeros(hA,hB);
for k=1:wA
    %euclidean distance 
    S=S+(C{k}-D{k}').^2;
endfor
d=sqrt(S);