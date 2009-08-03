function y=kMeans(m,k)

N=size(m)(1);

if N<=k,     %if more clusters than data, just return data
  y=[m, 1:N];
else    %less clusters than data

%random permutation of the indices and selecting the first k
%allows for sampling WITHOUT replacement and avoids duplicate
%initializations
p = randperm(size(m,1));   
for i=1:k                  
  c(i,:)=m(p(i),:);
endfor

temp=zeros(N,1);   
    
while 1,
  d=distMatrix(m,c);
  [z,g]=min(d,[],2);
  if g==temp,
    break;          
  else
    temp=g;         
    endif
    for i=1:k
      f=find(g==i);
      if f      %if not empty
	c(i,:)=mean(m(find(g==i),:),1);
      endif
    endfor
    endwhile
    
y=[m,g];   %return matrix with last column being cluster assignment
endif