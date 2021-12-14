close all;clear;
linewidth = 1.5;
figure
load('OTFS_4QAM_MN16x8_10_2_20_MP.mat')
semilogy(SNR_dB, err_ber_fram,'k--o','LineWidth',linewidth);
hold on
load('OTFS_4QAM_MN16x8_10_2_20_ZF.mat')
semilogy(SNR_dB, err_ber_fram,'k-+','LineWidth',linewidth);
load('OTFS_4QAM_MN16x8_10_2_20_ZFSIC.mat')
semilogy(SNR_dB, err_ber_fram,'k--d','LineWidth',linewidth);
load('OTFS_4QAM_MN16x8_10_2_20_MMSESIC.mat')
semilogy(SNR_dB, err_ber_fram,'k--*','LineWidth',linewidth);
load('OTFS_4QAM_MN16x8_10_2_20_SQRD_ZFSIC.mat');
semilogy(SNR_dB, err_ber_fram,'k-d','LineWidth',linewidth);
load('OTFS_4QAM_MN16x8_10_2_20_SQRD_MMSESIC.mat');
semilogy(SNR_dB, err_ber_fram,'k-*','LineWidth',linewidth);
hold off
title(sprintf('4QAM BER with N=8,M=16'))
ylabel('BER'); xlabel('SNR in dB');grid on
legend('MP','ZF','ZF-SIC','MMSE-SIC','ZF-SQRD-SIC','MMSE-SQRD-SIC');
set(gcf,'Color','none');
set(gca, 'FontName', 'Arial')
export_fig 4QAM_16x8.eps
export_fig 4QAM_16x8.pdf

figure 
load('OTFS_16QAM_MN16x8_10_2_20_MP.mat')
semilogy(SNR_dB, err_ber_fram,'k--o','LineWidth',linewidth);
hold on
load('OTFS_16QAM_MN16x8_10_2_20_ZF.mat')
semilogy(SNR_dB, err_ber_fram,'k-+','LineWidth',linewidth);
load('OTFS_16QAM_MN16x8_10_2_20_ZFSIC.mat')
semilogy(SNR_dB, err_ber_fram,'k--d','LineWidth',linewidth);
load('OTFS_16QAM_MN16x8_10_2_20_MMSESIC.mat')
semilogy(SNR_dB, err_ber_fram,'k--*','LineWidth',linewidth);
load('OTFS_16QAM_MN16x8_10_2_20_SQRD_ZFSIC.mat');
semilogy(SNR_dB, err_ber_fram,'k-d','LineWidth',linewidth);
load('OTFS_16QAM_MN16x8_10_2_20_SQRD_MMSESIC.mat');
semilogy(SNR_dB, err_ber_fram,'k-*','LineWidth',linewidth);
hold off
title(sprintf('16QAM BER with N=8,M=16'))
ylabel('BER'); xlabel('SNR in dB');grid on
legend('MP','ZF','ZF-SIC','MMSE-SIC','ZF-SQRD-SIC','MMSE-SQRD-SIC');
set(gcf,'Color','none');
set(gca, 'FontName', 'Arial')
export_fig 16QAM_16x8.eps
export_fig 16QAM_16x8.pdf

figure 
load('OTFS_64QAM_MN16x8_20_2_30_MP.mat')
semilogy(SNR_dB, err_ber_fram,'k--o','LineWidth',linewidth);
hold on
load('OTFS_64QAM_MN16x8_20_2_30_ZF.mat')
semilogy(SNR_dB, err_ber_fram,'k-+','LineWidth',linewidth);
load('OTFS_64QAM_MN16x8_20_2_30_ZFSIC.mat')
semilogy(SNR_dB, err_ber_fram,'k--d','LineWidth',linewidth);
load('OTFS_64QAM_MN16x8_20_2_30_MMSESIC.mat')
semilogy(SNR_dB, err_ber_fram,'k--*','LineWidth',linewidth);
load('OTFS_64QAM_MN16x8_20_2_30_SQRD_ZFSIC.mat');
semilogy(SNR_dB, err_ber_fram,'k-d','LineWidth',linewidth);
load('OTFS_64QAM_MN16x8_20_2_30_SQRD_MMSESIC.mat');
semilogy(SNR_dB, err_ber_fram,'k-*','LineWidth',linewidth);
hold off
title(sprintf('64QAM BER with N=8,M=16'))
ylabel('BER'); xlabel('SNR in dB');grid on
legend('MP','ZF','ZF-SIC','MMSE-SIC','ZF-SQRD-SIC','MMSE-SQRD-SIC');
set(gcf,'Color','none');
set(gca, 'FontName', 'Arial')
export_fig 64QAM_16x8.eps
export_fig 64QAM_16x8.pdf

figure
load('OTFS_4QAM_MN8x8_10_2_20_MP.mat')
semilogy(SNR_dB, err_ber_fram,'k--o','LineWidth',linewidth);
hold on
load('OTFS_4QAM_MN8x8_10_2_20_ZF.mat')
semilogy(SNR_dB, err_ber_fram,'k-+','LineWidth',linewidth);
load('OTFS_4QAM_MN8x8_10_2_20_ZFSIC.mat')
semilogy(SNR_dB, err_ber_fram,'k--d','LineWidth',linewidth);
load('OTFS_4QAM_MN8x8_10_2_20_MMSESIC.mat')
semilogy(SNR_dB, err_ber_fram,'k--*','LineWidth',linewidth);
load('OTFS_4QAM_MN8x8_10_2_20_SQRD_ZFSIC.mat');
semilogy(SNR_dB, err_ber_fram,'k-d','LineWidth',linewidth);
load('OTFS_4QAM_MN8x8_10_2_20_SQRD_MMSESIC.mat');
semilogy(SNR_dB, err_ber_fram,'k-*','LineWidth',linewidth);
hold off
title(sprintf('4QAM BER with N=8,M=8'))
ylabel('BER'); xlabel('SNR in dB');grid on
legend('MP','ZF','ZF-SIC','MMSE-SIC','ZF-SQRD-SIC','MMSE-SQRD-SIC');
set(gcf,'Color','none');
set(gca, 'FontName', 'Arial')
export_fig 4QAM_8x8.eps
export_fig 4QAM_8x8.pdf

figure 
load('OTFS_16QAM_MN8x8_10_2_20_MP.mat')
semilogy(SNR_dB, err_ber_fram,'k--o','LineWidth',linewidth);
hold on
load('OTFS_16QAM_MN8x8_10_2_20_ZF.mat')
semilogy(SNR_dB, err_ber_fram,'k-+','LineWidth',linewidth);
load('OTFS_16QAM_MN8x8_10_2_20_ZFSIC.mat')
semilogy(SNR_dB, err_ber_fram,'k--d','LineWidth',linewidth);
load('OTFS_16QAM_MN8x8_10_2_20_MMSESIC.mat')
semilogy(SNR_dB, err_ber_fram,'k--*','LineWidth',linewidth);
load('OTFS_16QAM_MN8x8_10_2_20_SQRD_ZFSIC.mat');
semilogy(SNR_dB, err_ber_fram,'k-d','LineWidth',linewidth);
load('OTFS_16QAM_MN8x8_10_2_20_SQRD_MMSESIC.mat');
semilogy(SNR_dB, err_ber_fram,'k-*','LineWidth',linewidth);
hold off
title(sprintf('16QAM BER with N=8,M=8'))
ylabel('BER'); xlabel('SNR in dB');grid on
legend('MP','ZF','ZF-SIC','MMSE-SIC','ZF-SQRD-SIC','MMSE-SQRD-SIC');
set(gcf,'Color','none');
set(gca, 'FontName', 'Arial')
export_fig 16QAM_8x8.eps
export_fig 16QAM_8x8.pdf

figure 
load('OTFS_64QAM_MN8x8_20_2_30_MP.mat')
semilogy(SNR_dB, err_ber_fram,'k--o','LineWidth',linewidth);
hold on
load('OTFS_64QAM_MN8x8_20_2_30_ZF.mat')
semilogy(SNR_dB, err_ber_fram,'k-+','LineWidth',linewidth);
load('OTFS_64QAM_MN8x8_20_2_30_ZFSIC.mat')
semilogy(SNR_dB, err_ber_fram,'k--d','LineWidth',linewidth);
load('OTFS_64QAM_MN8x8_20_2_30_MMSESIC.mat')
semilogy(SNR_dB, err_ber_fram,'k--*','LineWidth',linewidth);
load('OTFS_64QAM_MN8x8_20_2_30_SQRD_ZFSIC.mat');
semilogy(SNR_dB, err_ber_fram,'k-d','LineWidth',linewidth);
load('OTFS_64QAM_MN8x8_20_2_30_SQRD_MMSESIC.mat');
semilogy(SNR_dB, err_ber_fram,'k-*','LineWidth',linewidth);
hold off
title(sprintf('64QAM BER with N=8,M=8'))
ylabel('BER'); xlabel('SNR in dB');grid on
legend('MP','ZF','ZF-SIC','MMSE-SIC','ZF-SQRD-SIC','MMSE-SQRD-SIC');
set(gcf,'Color','none');
set(gca, 'FontName', 'Arial')
export_fig 64QAM_8x8.eps
export_fig 64QAM_8x8.pdf



