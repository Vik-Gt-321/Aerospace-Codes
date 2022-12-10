function [RA, DEC, n_curves] = seperate_curves(ra, dec)

RA = [];
DEC = [];
tol =100;
n_curves = 1;
curve_no = 1;
ra_prev = ra(1);
k = 0;
for i = 1:length(ra)
    if abs(ra(i) - ra_prev) > tol
        n_curves = n_curves + 1;
        curve_no = curve_no + 1;
        k = 0;
    end
    k = k+1;
    RA{curve_no}(k) = ra(i);
    DEC{curve_no}(k) = dec(i);
    ra_prev = ra(i);
end


end