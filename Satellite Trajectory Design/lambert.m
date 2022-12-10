function [V1, V2] = lambert(R1, R2, t, string, mu)

%Magnitudes of R1 and R2:
r1 = norm(R1);
r2 = norm(R2);


cl2 = cross(R1, R2);
theta = acos(dot(R1,R2)/r1/r2);
% fprintf('job done1 \n')
%Determine whether the orbit is prograde or retrograde:
if strcmp(string,'pro')
    if cl2(3) <= 0
%         fprintf(theta)
        theta = 2*pi - theta;
        fprintf('job done \n')
    end
elseif strcmp(string, 'retro')
    if cl2(3) >= 0
        theta = 2*pi - theta;
    end
end
A = sin(theta)*sqrt(r1*r2/(1 - cos(theta)));
z = -100;
while F(z,t,mu, r1, r2, A) < 0
    z = z + 0.1;
end
tol = 1.e-8;
nmax = 5000;

ratio = 1;
n = 0;
while (abs(ratio) > tol) && (n <= nmax)
    n = n + 1;
    F_val = F(z,t,mu ,r1, r2, A);
    ratio = F_val/dFdz(z, r1, r2, A);
    z = z - ratio;
end
if n >= nmax
    fprintf('\n\n **Number of iterations exceeds %g \n\n ',nmax)
end

f = 1 - y(z, r1, r2, A)/r1;

g = A*sqrt(y(z, r1, r2, A)/mu);
gdot = 1 - y(z, r1, r2, A)/r2;
V1 = 1/g*(R2 - f*R1);
V2 = 1/g*(gdot*R2 - R1);
return

