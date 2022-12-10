function ma = mean_anomaly(M, e)

if M < pi/2
    E = M + e/2;
elseif M >= pi/2
    E = M - e/2;
end


tol = 1.e-8;
nmax = 5000;

ratio = 1;
n = 0;
if e <=1
    while (abs(ratio) > tol) && (n <= nmax)
        n = n + 1;
        F = E - e*sin(E) - M;
        dFdx = 1 - e*cos(E);
        ratio = F/dFdx;
        E = E - ratio;
    end

else 
%     display("hyperbolic")
    while (abs(ratio) > tol) && (n <= nmax)
        n = n + 1;
        F = e*sinh(E) - E - M;
        dFdx = e*cosh(E) - 1;
        ratio = F/dFdx;
        E = E - ratio;
    end
end
ma = E;
end