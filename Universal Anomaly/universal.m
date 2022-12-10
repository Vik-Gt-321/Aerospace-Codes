function x = universal(dt, r0, v_r0, alpha)


mu = 398600;

error = 1e-8;
n_max = 1000;
x = sqrt(mu)*abs(alpha)*dt;

n = 0;
ratio = 1;
while abs(ratio) > error && n <= n_max
n = n + 1;
z = alpha*x^2;
C = stump_c(z);
S = stump_s(z);
F = r0*v_r0/sqrt(mu)*x^2*C + (1 - alpha*r0)*x^3*S + r0*x - sqrt(mu)*dt;
dFdx = r0*v_r0/sqrt(mu)*x*(1 - z*S) + (1 - alpha*r0)*x^2*C + r0;
ratio = F/dFdx;
x = x - ratio;
end

end


