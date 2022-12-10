function [RA, DEC] = ground_track(h, e, RA0, i0, w0, TA0, a)
deg = pi/180;
mu = 398600;
J2 = 0.00108263;
Re = 6378;
we = (2*pi + 2*pi/365.26)/(24*3600);

T = 2*pi/sqrt(mu)*a^(3/2);

RA_dot = -3/2*sqrt(mu)*J2*Re^2/(1-e^2)^2/a^(7/2) * cos(i0);
w_dot = -3/2*sqrt(mu)*J2*Re^2/(1-e^2)^2/a^(7/2) * (5/2*sin(i0)^2 - 2);

if e<=1
    [RA, DEC] = gt_ellipse(TA0, e, mu, h, i0, RA0, w0, T, RA_dot, w_dot, we);
else 
    [RA, DEC] = gt_hyper(TA0, e, mu, h, i0, RA0, w0, RA_dot, w_dot, we);
    if isreal(RA) == false
        display("ra unreal")
    end
    if isreal(DEC) == false
        display("dec unreal")
    end
end
% ground = [RA DEC ];
    

end