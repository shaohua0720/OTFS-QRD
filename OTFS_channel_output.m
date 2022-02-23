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
function r = OTFS_channel_output(N,M,taps,delay_taps,Doppler_taps,chan_coef,sigma_2,s)
%% wireless channel and noise 
L = max(delay_taps);
s = [s;s(1:L)];%add one cyclic-suffix (CP one the other side)
s_chan = 0;
for itao = 1:taps
%   the term $(0:length(s)-1) = mod((0:length(s)-1),M*N)$
    s_chan = s_chan+chan_coef(itao)*circshift([s.*exp(1j*2*pi/M*(0:length(s)-1)*Doppler_taps(itao)/N).'],delay_taps(itao));
end
noise = sqrt(sigma_2/2)*(randn(size(s_chan)) + 1i*randn(size(s_chan)));
r = s_chan + noise;
r = r(end-M*N+1:end);%discard cp (the points on the begining)
r = [r(end-L+1:end);r(1:M*N-L)]; % swap the cyclic suffix to the begining
end