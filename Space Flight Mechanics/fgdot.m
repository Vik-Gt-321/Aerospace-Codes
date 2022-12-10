function [fdot, gdot] = fgdot(r, r0, alpha, x)
mu= 398600;

z = alpha*x^2;
c = stump_c(z);
s = stump_s(z);
fdot = sqrt(mu)*(alpha*(x^3)*s - x)/(r*r0);
gdot = 1 - (x^2)*c/r;

end