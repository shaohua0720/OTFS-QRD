%
% Copyright (c) 2018, Raviteja Patchava, Yi Hong, and Emanuele Viterbo, Monash University
% All rights reserved.
%
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are met:
%
% 1. Redistributions of source code must retain the above copyright notice, this
%   list of conditions and the following disclaimer.
% 2. Redistributions in binary form must reproduce the above copyright notice,
%   this list of conditions and the following disclaimer in the documentation
%   and/or other materials provided with the distribution.
%
%THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
%ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
%WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
%DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
%ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
%(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
%LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
%ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
%(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
%SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
%
%    - Latest version of this code may be downloaded from: https://ecse.monash.edu/staff/eviterbo/
%    - Freely distributed for educational and research purposes
%%

clc
clear all
close all
tic
%% OTFS parameters%%%%%%%%%%
% number of symbol
N = 8;
% number of subcarriers
M = 16;
% size of constellation
M_mod = 16;
M_bits = log2(M_mod);
% average energy per data symbol
eng_sqrt = (M_mod==2)+(M_mod~=2)*sqrt((M_mod-1)/6*(2^2));
% number of symbols per frame
N_syms_perfram = N*M;
% number of bits per frame
N_bits_perfram = N*M*M_bits;

SNR_dB = 10:2:20;
SNR = 10.^(SNR_dB/10);
noise_var_sqrt = sqrt(1./SNR);
sigma_2 = abs(eng_sqrt*noise_var_sqrt).^2;
%%
%rng(1)
N_fram = 10^5;
err_ber = zeros(length(SNR_dB),1);
for iesn0 = 1:length(SNR_dB)
    for ifram = 1:N_fram
        %% random input bits generation%%%%%
        data_info_bit = randi([0,1],N_bits_perfram,1);
        data_temp = bi2de(reshape(data_info_bit,N_syms_perfram,M_bits));
        x = qammod(data_temp,M_mod,'gray');
        x = reshape(x,M,N);
        
        %% OTFS modulation%%%%
        s = OTFS_modulation(M,N,x);
        
        %% OTFS channel generation%%%%
        [taps,delay_taps,Doppler_taps,chan_coef] = OTFS_channel_gen(M,N);
 
        %% OTFS channel output%%%%%
        r = OTFS_channel_output(M,N,taps,delay_taps,Doppler_taps,chan_coef,sigma_2(iesn0),s);

        %% OTFS demodulation%%%%
        y = OTFS_demodulation(M,N,r);
        
       %% OTFS channel estimation%%%%
        He = OTFS_channel_est(M,N,taps,delay_taps,Doppler_taps,chan_coef); % effective TF channel
        isft_mtx = kron(conj(dftmtx(N))/sqrt(N),eye(M));
        sft_mtx = kron(dftmtx(N)/sqrt(N),eye(M));
        H = sft_mtx*He*isft_mtx;
        
        
       %% QRD-based ZF-SIC detector%%%%
        %y = sft_mtx'*y(:);
        %x_est = OTFS_qr_detector(He,N,M,M_mod,taps,delay_taps(end),y);
        %x_est = isft_mtx'*x_est;
        
        %% ZF-inv based detector
        x_est = OTFS_zfinv_detector(H,N,M,M_mod,taps,delay_taps(end),y(:));
        %% message passing detector%%%%
        %x_est = OTFS_mp_detector(N,M,M_mod,taps,delay_taps,Doppler_taps,chan_coef,sigma_2(iesn0),y);
        
        %% output bits and errors count%%%%%
        data_demapping = qamdemod(x_est,M_mod,'gray');
        data_info_est = reshape(de2bi(data_demapping,M_bits),N_bits_perfram,1);
        errors = sum(xor(data_info_est,data_info_bit));
        err_ber(iesn0) = errors + err_ber(iesn0);
        ifram
    end
end
err_ber_fram = err_ber/N_bits_perfram./N_fram
semilogy(SNR_dB, err_ber_fram,'-*','LineWidth',2);
title(sprintf('OTFS'))
ylabel('BER'); xlabel('SNR in dB');grid on

toc
save('OTFS_16QAM_MN16x8_10_2_20_ZF.mat','SNR_dB','err_ber_fram');