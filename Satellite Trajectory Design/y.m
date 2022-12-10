function dum = y(z, r1, r2, A)
    c = stump_c(z);
    s = stump_s(z);
    dum = r1 + r2 + A*(z*s - 1)/sqrt(c);
end


