clear all; clc
mu = 398600;

r = [ -6045 -3490 2500];
v = [-3.457 6.618 2.533];

r1 = [5644 -2830 -4170];
r2 = [-2240 7320 -4980];
dt = 20*60;

[v1, v2] = lambert(r1, r2, dt, string, mu);
R = [-6065 3490 2500];
% r = r/norm(r);
% r = r*6628;
V = [-3.457 6.618 2.533];
coe = orb_from_state(R, V, mu);

