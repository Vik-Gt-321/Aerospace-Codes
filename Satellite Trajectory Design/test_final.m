clc
deg = pi/180;

mu = 398600;
% r1 = [ 5000 10000 2100];
r1 = [5644 -2830 -4170];

% r2 = [-14600 2500 7000];

r2 = [-2240 7320 -4980];


dt = 20*60;
string = 'pro';

[v1, v2] = lambert(r1, r2, dt, string, mu);

coe = orb_from_state(r1, v1, mu);
h = coe(1);
e = coe(2);
RA = coe(3);
i = coe(4);
w = coe(5);
TA = coe(6);
a = coe(7);
[ra, dec] = ground_track(h, e, RA, i, w, TA, a);
[ra_sep, dec_sep, n] = seperate_curves(ra*180/pi, dec*180/pi);
plot_ground_track(ra_sep, dec_sep, n);
