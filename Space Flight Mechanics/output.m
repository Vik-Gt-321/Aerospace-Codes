
clear all; clc
global mu
mu = 398600;
t = 7200;
% R0 = [30000, -100000, -20000];
% V0 = [0.8, -3.5, -2];
R0 = [20000, -105000, -19000];
V0 = [0.9, -3.4, 1.5];

% t =3600;
% R0 = [ 7000 -12124 0];
% V0 = [2.6679 4.6210 0];

[R V] = final(t, R0, V0);

fprintf('–––––––––––––––––––––––––––––––––––––––––––––––––––––')
fprintf('\n Initial position vector (km) r0 = (%g, %g, %g)\n', R0(1), R0(2), R0(3))
fprintf('\n Initial velocity vector (km/s) v0 = (%g, %g, %g)', V0(1), V0(2), V0(3))
fprintf('\n\n Elapsed time = %g s\n',t)
fprintf('\n Final position vector (km) r = (%g, %g, %g)\n', R(1), R(2), R(3))
fprintf('\n Final velocity vector (km/s) v = (%g, %g, %g)', V(1), V(2), V(3))
fprintf('\n–––––––––––––––––––––––––––––––––––––––––––––––––––––\n')


