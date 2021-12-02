function [givens,c,s] = givensH(vec,i,j)
% generate a complex givens matrix for elements for i and j of vec
givens = eye(length(vec));
aj = vec(i);
bj = vec(j);
c = conj(aj)/sqrt(abs(aj)^2+abs(bj)^2);
s = conj(bj)/sqrt(abs(aj)^2+abs(bj)^2);
givens(i,i) = c;
givens(i,j) = s;
givens(j,i) = -conj(s);
givens(j,j) = conj(c);
end