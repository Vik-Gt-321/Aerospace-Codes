clear all; clc
R_mpo = [-3670 -3870 4400];
R_mpo = R_mpo/norm(R_mpo)*(66100);

R_epo = [-6065 3490 2500]
R_epo = R_epo/norm(R_epo)*(6378 + 250);
V_epo = [-3.457 6.618 2.533]

R_moon_vector = r_vec_from_ra(20, 20, 386378)

R1 = R_epo
% R2 = R_mpo + R_moon_vector;
R2 = R_moon_vector + R1
string = "pro";
mu = 398600;
dt = 3600*24*5;
[V1, V2] = lambert(R1, R2, dt, string, mu);

delta_v = norm(V1 - V_epo)
