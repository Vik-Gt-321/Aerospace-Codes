clc
deg = pi/180;
mu = 398600;
% r1 = [ 5000 10000 2100];
r1 = [5644 -2830 4170];

% r2 = [-14600 2500 7000];

r2 = [-2240 7320 4980];


dt = 20*60;
string = 'pro';

[v1, v2] = lambert(r1, r2, dt, string, mu);
fprintf('\n\n **v1 %g \n\n ',v1(1))
