function [givens,c,s] = givensR(vec,i,j)
% generate a complex givens matrix for elements for i and j of vec
givens = eye(length(vec));
aj = vec(i);
bj = vec(j);
c = bj/sqrt(abs(aj)^2+abs(bj)^2);
s = aj/sqrt(abs(aj)^2+abs(bj)^2);
givens(i,i) = c;
givens(i,j) = conj(s);
givens(j,i) = -s;
givens(j,j) = conj(c);
end