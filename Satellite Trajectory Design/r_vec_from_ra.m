function r = r_vec_from_ra(RA, DEC, mod_r)

DEC = DEC*pi/180;
RA = RA*pi/180;
r = [cos(DEC)*cos(RA) cos(DEC)*sin(RA) sin(DEC)];
r = mod_r*r;

end