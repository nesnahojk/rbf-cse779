function y=RBFPredict(nx,means,bandwidths,weights,bias)

sum=0;
for i=1:length(means)
    sum=sum+weights(i)*gaussian(means(i),nx,bandwidths(i));
endfor

y=sum+bias
