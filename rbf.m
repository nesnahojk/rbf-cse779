function [weights,bias,means,bandwidths]=rbf(x,centers,epochs,eta,clusterORequal)

if nargin<5
  clusterORequal=1
endif

samples=length(x);

mnum=centers;

newx=x(:,1);

noEmpties=false;
while !noEmpties
  y=kMeans(newx,mnum);

  means=zeros(mnum,1);
  bandwidths=zeros(mnum,1);
  noEmpties=true;
  for i=1:mnum
    if sum(y(:,2)==i)>1
      means(i)=mean(y(find(y(:,2)==i),1));
      bandwidths(i)=sqrt(var(y(find(y(:,2)==i),1)));
    else
      noEmpties=false;    
    endif
  endfor
endwhile

meanbandwidth=mean(bandwidths);    %the mean std
bandwidths(find(bandwidths==0))=meanbandwidth;   %if only one point in cluster set to mean of all


if clusterORequal
  bandwidths(find(true))=max(max(distMatrix(means,means)))/sqrt(2*mnum);
endif
    
tdata=x;
[weights,bias]=RBFTrain(means,bandwidths,tdata,100,eta);





	