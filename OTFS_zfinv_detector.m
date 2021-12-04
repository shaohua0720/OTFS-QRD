function x = OTFS_zfinv_detector(H,N,M,M_mod,taps,tauM,y)
Hp = pinv(H);
x = Hp*y;
end