function H = OTFS_channel_est_frac(P,tau,vi,vf,h,M,N,Ni)
% P = 3;
% tau = [0,2,3];
% vi = [0,2,3]; % interger part
% vf = [0,0,0]; % fractional part
% h = 1/sqrt(2)*(randn([P,1])+1i*randn([P,1]));
% M = 4;
% N = 4;
% Ni = 0;

H = zeros(M*N);
for l = 0:M-1
    for k = 0:N-1
        for i = 1:P
           for q = -Ni:Ni
            x_doppler = mod(k-vi(i)+q,N);
            x_delay = mod(l-tau(i),M);
            coef = h(i)*exp(1i*2*pi*(l-tau(i))/M*(vi(i)+vf(i))/N)*OTFS_intf_coef(k-1,vf(i),l,tau(i),q,M,N);
%             row = l*N+k+1;
%             col = (x_delay)*N+x_doppler+1;
            
              row = k*M+l+1;
              col = x_doppler*M+x_delay+1;
            
            H(row,col) = H(row,col)+coef;
           end
        end
    end
end
end
function intf = OTFS_intf_coef(k,kvi,l,ltaui,q,M,N)

beta_q = (exp(-1i*2*pi*(-q-kvi))-1)/(exp(-1i*2*pi*(-q-kvi)/N)-1);
if l>=M || l<0
   l
   error('error');
end
if kvi == 0
    beta_q = N;
end
if l>=ltaui && l<M
    intf = beta_q/N;
end
if l>=0 && l<ltaui
    intf = 1/N*(beta_q-1)*exp(-1i*2*pi*mod(k-kvi+q,N)/N);
end
end