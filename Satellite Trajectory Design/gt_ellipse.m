function [RA, DEC] = gt_ellipse(TA0, e, mu, h, i0, RA0, w0, T, RA_dot, w_dot, we)
E0 = 2*atan(tan(TA0/2)*sqrt((1-e)/(1+e)));
M0 = E0 - e*sin(E0);
t0 = M0/2/pi*T;

n_periods = 3.25;
tf = t0 + n_periods*T;
times = linspace(t0,tf,45*60);
RA = [];
DEC = [];
theta = 0;
for i = 1:length(times)
    t2 = times(i);
    M2 = 2*pi/T*t2;
    E2 = mean_anomaly(M2, e);
    TA2 = 2*atan(tan(E2/2)*sqrt((1+e)/(1-e)));
    
    RA2 = RA0 + RA_dot*(t2 - t0);  %why t - t0
    w2 = w0 + w_dot*(t2 - t0);
    % display(RA2*180/pi)
    % display(w2*180/pi);
    
    r = h^2/mu/(1 + e*cos(TA2));
    R_x = r* [cos(TA2) sin(TA2) 0]';
    
    R1 = [ cos(RA2)  sin(RA2) 0
           -sin(RA2) cos(RA2) 0
            0         0       1];
    
    R2 = [1    0       0 
          0 cos(i0)  sin(i0)
          0 -sin(i0) cos(i0)];
    
    R3 = [cos(w2)  sin(w2) 0 
          -sin(w2) cos(w2) 0
          0          0     1];
    
    % display(size(R_x))
    QxX = (R3*R2*R1)' ;
    
    % display(size(QxX))
    R_X = QxX*R_x;
    
    theta = we*(t2 - t0);
    
    R3_theta = [cos(theta) sin(theta) 0
                -sin(theta) cos(theta) 0
                0 0 1];
    % display(R3_theta);
    R_xdash = R3_theta*R_X;
    % display(R_xdash);
    
    rd = RA_DEC(R_xdash);
    
    RA = [RA rd(1)];                            %problem might happen
    DEC = [DEC rd(2)];
end

end