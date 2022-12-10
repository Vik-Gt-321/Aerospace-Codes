clear all;
clc
[ra, dec] = ground_track(56554, 0.19760, 270*pi/180, pi/3, pi/4, 230*pi/180, 8350);
% display(x(2700)*180/pi)
[ra_sep, dec_sep, n] = seperate_curves(ra*180/pi, dec*180/pi);
n;
ra_sep{1};
dec_sep{1};
plot_ground_track(ra_sep, dec_sep, n);
