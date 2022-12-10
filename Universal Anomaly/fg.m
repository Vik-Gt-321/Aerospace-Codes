function [f, g] = fg(dt, x, alpha, r0)

mu= 398600;

z = alpha*x^2;
c = stump_c(z);
s = stump_s(z);
f = 1 - (x^2)*c/r0;
g = dt - 1/sqrt(mu)*(x^3)*s;

end