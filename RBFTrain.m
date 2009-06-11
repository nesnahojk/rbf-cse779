function [weights,bias]=RBFTrain(means,bandwidths,tdata,epochs,eta)

dimy=size(tdata)(2);

%weights=2*rand(length(means),1)-1;
%weights=ones(length(means),1);
%bias=2*rand()-1;
weights=zeros(length(means),1);
bias=0;

gauss=zeros(length(tdata),length(means));

for i=1:length(tdata)
   for c=1:length(means)
       gauss(i,c)=gaussian(means(c),tdata(i,1:dimy-1),bandwidths(c));
   endfor
endfor


for e=1:epochs
    for t=1:length(tdata)
	err=(tdata(t,dimy)-RBFPredict(tdata(t,1:dimy-1),means,bandwidths,weights,bias));
        for w=1:length(means)
	    weights(w)=weights(w)+eta*err*gauss(t,w);
        endfor
            bias=bias+eta*err*1;
    endfor
endfor
