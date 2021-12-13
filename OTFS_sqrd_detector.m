function x = OTFS_sqrd_detector(H,N,M,M_mod,taps,tauM,y)

[Q,R,P] = SQR(H);
T = Q(1:M*N,:);
xt = OTFS_qr_sic(R,T'*y,M_mod);
x = P*xt;
end