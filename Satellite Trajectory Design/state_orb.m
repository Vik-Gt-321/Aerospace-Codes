function [r, v] = state_orb(h, e, RA, i, w, TA)
deg = pi/180;
mu = 398600;

% h = 80000;
% e = 0.86;
% RA = 40;
% incl = 20;
% w = 60;
% TA = 30;


coe = [h, e, RA*deg, i*deg, w*deg, TA*deg];

[r, v] = state_from_orb(coe, mu);

end