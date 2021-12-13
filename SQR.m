function [Q,R,P,p] = SQR(H)
% Sorted QR decomposition
% Input parameter
%     H : complex channel matrix, nRxnT
% Output parameters
%     Q : orthogonal matrix, nRxnT
%     P : permutation matrix
%     p : ordering information

% MIMO-OFDM Wireless Communications with MATLAB㈢   Yong Soo Cho, Jaekwon Kim, Won Young Yang and Chung G. Kang
% 2010 John Wiley & Sons (Asia) Pte Ltd
Nt=size(H,2);  
R=zeros(Nt);
R=zeros(Nt);
Q=H;   
p=1:Nt;
normes = zeros(1,Nt);
for i=1:Nt 
    normes(i)=Q(:,i)'*Q(:,i); 
end
for i=1:Nt
    [~,k_i]=min(normes(i:Nt));k_i=k_i+i-1;
    R(:,[i k_i])=R(:,[k_i i]);
    p(:,[i k_i])=p(:,[k_i i]);
    normes(:,[i k_i])=normes(:,[k_i i]);
    Q(:,[i k_i])=Q(:,[k_i i]);
    R(i,i) = sqrt(normes(i));
    Q(:,i) = Q(:,i)/R(i,i);
    for j = i+1:Nt
        R(i,j) = Q(:,i)'*Q(:,j);
        Q(:,j) = Q(:,j)-R(i,j)*Q(:,i);
        normes(j)=normes(j)-R(i,j)*R(i,j)';
    end
end
P=zeros(Nt); 
for i=1:Nt 
    P(p(i),i)=1;
end
end
