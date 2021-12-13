load H.mat
H = [H;H];
[Q,R,P,p] = SQR(H);

A = abs(H*P-Q*R);
B = abs(Q'*Q);
D=abs(H(129:end,:));