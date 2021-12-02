function x = OTFS_qr_sic(R,y)
% sic detecton based on upper-triangle matrix R
x = zeros(size(y));
[row, col] =size(R);
for i = row:-1:1
    if i == row
        x(i) = y(i)/R(i,i);
    end
    part = 0;
    for j = i+1:col
        part = part + R(i,j)*x(j);
    end
    x(i) = (y(i)-part)/R(i,i);
end
end