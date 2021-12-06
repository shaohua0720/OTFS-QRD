function x = OTFS_qr_sic(R,y,M_mod)
% Sic detecton based on upper-triangle matrix R
Map = [zeros(1,M_mod),qammod(0:M_mod-1,M_mod,'gray')];
x = zeros(size(y));
[row, col] =size(R);
for i = row:-1:1
    if i == row
        t = y(i)/R(i,i);
        x(i) = qamdemod(t,M_mod,'gray');
    end
    part = 0;
    for j = i+1:col
        part = part + R(i,j)*Map(x(j)+1+M_mod);
    end
    t = (y(i)-part)/R(i,i);
    x(i) = qamdemod(t,M_mod,'gray');
end
end