function x = lunar_trajectory()
clc
deg = pi/180;

mu_earth = 398600;
% r1 = [ 5000 10000 2100];
r1 = [5644 -2830 -4170];

% r2 = [-14600 2500 7000];

r2 = [-2240 7320 -4980];


dt = 20*60;
string = 'pro';

[v1, v2] = lambert(r1, r2, dt, string, mu_earth);

coe = orb_from_state(r1, v1, mu_earth);
h = coe(1);
e = coe(2);
RA = coe(3);
i = coe(4);
w = coe(5);
TA = coe(6)
a = coe(7);


end