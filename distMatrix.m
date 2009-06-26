function d=distMatrix(A,B)
[hA,wA]=size(A);
[hB,wB]=size(B);
for k=1:wA
    C{k}= repmat(A(:,k),1,hB);
    D{k}= repmat(B(:,k),1,hA);
endfor
S=zeros(hA,hB);
for k=1:wA`
    S=S+(C{k}-D{k}').^2;
endfor
d=sqrt(S);
