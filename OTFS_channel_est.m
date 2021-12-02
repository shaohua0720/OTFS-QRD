function H = OTFS_channel_est(M,N,taps,delay_taps,Doppler_taps,chan_coef)

pmtMat=circshift(eye(M*N),-1,2);
phsMat = diag(exp(1i*2*pi*(0:M*N-1)/(M*N)));
H = zeros(M*N);
for i = 1:taps
    H = H + chan_coef(i)*pmtMat^delay_taps(i)*phsMat^Doppler_taps(i);
end

end