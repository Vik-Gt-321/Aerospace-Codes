clear all; clc
global mu
mu = 398600;
ro = 10000;
vro = 3.0752;
dt = 3600;
a = -19655;

x = universal(dt, ro, vro, 1/a);

fprintf('\n Universal anomaly (km^0.5) = %g',x)

