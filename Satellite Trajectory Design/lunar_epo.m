clear all; clc
mu = 398600;

R_epo = [-6065 3490 2500];
R_epo = R_epo/norm(R_epo)*(6378 + 2000);
norm(R_epo)
% r = r/norm(r);
% r = r*6628;
V_epo = [-3.457 6.618 2.533];

coe_epo=orb_from_state(R_epo, V_epo, mu);

R_moon_vector = r_vec_from_ra(30, 20, 386378);
% [h e RA i w TA a]
e = coe_epo(2)
i = coe_epo(4)*180/pi



