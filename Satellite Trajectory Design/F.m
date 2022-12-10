function dum = F(z,t, mu, r1, r2, A)
    y_val = y(z, r1, r2, A);
    dum = (y_val/stump_c(z))^1.5*stump_s(z) + A*sqrt(y_val) - sqrt(mu)*t;
end