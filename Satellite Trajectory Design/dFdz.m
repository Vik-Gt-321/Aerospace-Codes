function dum = dFdz(z, r1, r2, A)

y_val = y(z, r1, r2, A);
s = stump_s(z);
c = stump_c(z);
if z == 0
    dum = sqrt(2)/40*y_val^1.5 + A/8*(sqrt(y_val) + A*sqrt(1/2/y_val));
else
    dum = (y_val/c)^1.5*(1/2/z*(c - 3*s/2/c) ...
    + 3*s^2/4/c) + A/8*(3*s/c*sqrt(y_val) ...
    + A*sqrt(c/y_val));
end
end