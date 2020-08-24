%%%%%Kimia Hashemi-9512063
clear all
close all
clc
%%%%%% Inputs
m = 3;
X = [0,0.25,0.5,0.75,1];
Y = [1, 1.2840, 1.6487, 2.1170, 2.7183];

%%%%%% Defining vectors and matrices
b=Y';
n=length(X);
A = zeros(n,m+1);
for j=1:m+1
    for i=1:n
        A(i,j)=X(i)^(j-1);
    end
end

%%%%%% SVD decomposition
[U S V]=svd(A);

S_elements = diag(S);
k = length (S_elements);
C=U'*b;
for l=1:k
    main_C(l) = C(l);
end

Z = main_C'./S_elements;

%%%%%% Deriving the coefficients
a = V*Z;

sympref('FloatingPointOutput',true);

coefficinets = sym(flip(a'));

%%%%%% polynomial equation
syms x
p = poly2sym(coefficinets, x)


%%%%%Error

error = sum(sqrt(subs(p, x, X) - Y))