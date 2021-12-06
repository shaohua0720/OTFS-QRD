function x = OTFS_qr_detector(H,N,M,M_mod,taps,tauM,y)

cir_H = H;
cir_y = y;
H_H = cir_H; %for test;

Q = eye(M*N);
% %% R(i,i) increasing order
% for j = M*N:-1:1 % rows
%    for i = 1:j-1 % columns
%        if abs(cir_H(j,i))>1e-7
%            Q1 = givensR(cir_H(j,:),i,j);
%            cir_H = cir_H*Q1;
%            Q=Q*Q1;
%        end
%    end
% end
% x = OTFS_qr_sic(cir_H,cir_y);
% sum(abs(H_H-cir_H*Q')) % for test

%% R(i,i) decreasing order
for j =1:M*N % columns
    for i = M*N:-1:j+1
        if abs(cir_H(i,j))>1e-7
            Q1 = givensH(cir_H(:,j),j,i);
            cir_H = Q1*cir_H;
            Q=Q1*Q;
        end
    end
end

x = OTFS_qr_sic(cir_H,Q*cir_y,M_mod);
% sum(abs(H_H-Q'*cir_H)); %for test


end