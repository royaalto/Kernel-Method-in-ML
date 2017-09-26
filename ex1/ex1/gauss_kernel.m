function [kernel] = gauss_kernel(X,Z,sigma)
%X = X_train;
%Z = X_test;
%diag(X*X')return 800*1  *1*200           800*1  *           1*200   
% (X-Z)^2
n1= size(X,1);
n2 = size(Z,1);
distance = diag(X*X')*ones(1,n2) + ones(n1,1)*diag(Z*Z')'-2*X*Z';

%gauss_kernel
kernel = exp(-distance./(2 * sigma ^2));

end