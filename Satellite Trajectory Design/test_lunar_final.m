clear all; clc


R_moon_vector = r_vec_from_ra(30, 28.58, 386378);

e = 0.8;
mu_e = 398600;
a = 6378 + 2000;
h = sqrt(a*mu_e*(1+e));
i = 45;
w = 30;
TA = 190;
RA = 0;
[R_epo, V_epo] = state_orb(h, e, RA, i, w, TA);

R_mpo = [3670 -3870 -4400];
R_mpo = R_mpo/norm(R_mpo)*(66100);

R1 = R_epo;
R2 = R_moon_vector + R_mpo;
string = "pro";
mu = 398600;
dt = 3600*24*2;
[V1, V2] = lambert(R1, R2, dt, string, mu);

delta_v = norm(V1 - V_epo)