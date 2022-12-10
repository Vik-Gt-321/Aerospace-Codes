function x = RA_DEC(R)

r = norm(R);

m = R(2)/r;
l = R(1)/r;
n = R(3)/r;

del = asin(n);

if m > 0
    alpha = acos(l/cos(del));
else
    alpha = 2*pi - acos(l/cos(del));
end
x = [alpha del];
end