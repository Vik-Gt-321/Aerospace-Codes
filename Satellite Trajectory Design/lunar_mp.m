clear all; clc
mu = 398600;
R_mpo = [-3670 -3870 4400];
R_mpo = R_mpo/norm(R_mpo)*(66100); %SOI of moon
norm(R_mpo)
V_mpo = [4.7 -7.4 1];
coe_mpo=orb_from_state(R_mpo, V_mpo, mu);
coe_mpo(2)