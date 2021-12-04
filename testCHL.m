P = 4;
delay=[1,2,3,4];
doppler = [0,1,2,3];
coeff = randn([P,1])+1i*randn([P,1]);
M=4;
N=4;
coeff;
tau_PI=circshift(eye(M*N),-1,2);
delta = diag(exp(1i*2*pi/M/N*(0:M*N-1)));
isft_mtx = kron(conj(dftmtx(N))/sqrt(N),eye(M));
sft_mtx = kron(dftmtx(N)/sqrt(N),eye(M));

isft_mtx1 = kron(eye(M),conj(dftmtx(N))/sqrt(N));
sft_mtx1 = kron(eye(M),dftmtx(N)/sqrt(N));

He = zeros(M*N);
for j=1:P
    He = He + coeff(j)*tau_PI^delay(j)*delta^doppler(j);
end
He = tau_PI^(M*N-delay(end))*He;
H = He*isft_mtx1;

H(find(H<1e-7))=0;


cir_H = H;
H_H = H;
% abs_cir_H = abs(cir_H);
% Ht = cir_H(:,1);
t = 0;
Q = eye(M*N);
for j =1:M*N % columns
    for i = M*N:-1:j+1
        if abs(cir_H(i,j))>1e-7
            Q1 = givensH(cir_H(:,j),j,i);
            cir_H = Q1*cir_H;
            Q=Q1*Q;
            tt = abs(cir_H);
            t=t+1;
        end
    end
end
abs(H_H-Q'*cir_H); % for test

% tic
% for j = M*N:-1:1 % rows
%    for i = 1:j-1 % columns
%        if abs(cir_H(j,i))>1e-7
%            Q1 = givensR(cir_H(j,:),i,j);
%            cir_H = cir_H*Q1;
%            Q=Q*Q1;
%            t=t+1;
%        end
%    end
% end
% toc
t
% [givens,c,s]=givensH(cir_H(:,1),1,16);
% cir_H = givens*cir_H;
% [givens,c,s]=givensH(cir_H(:,1),1,14);
% cir_H = givens*cir_H;
% [givens,c,s]=givensH(cir_H(:,2),2,16);
% cir_H = givens*cir_H;
% [givens,c,s]=givensH(cir_H(:,2),2,15);
% cir_H = givens*cir_H;
% abs(cir_H)

% sqrt(sum(abs(H).^2))
% [Q,R,Pe] = qr(cir_H);
% H_tt = kron(dftmtx(M),eye(N))*H*kron(conj(dftmtx(M)),eye(N));
% [Q1,R1] = qr(H_tt);