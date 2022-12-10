function [RA, DEC] = gt_hyper(TA0, e, mu, h, i0, RA0, w0, RA_dot, w_dot, we)

TA0*180/pi
TA_inf = acos(-1/e)*180/pi
TA_inf_bound = abs(TA_inf) - 10
% E0 = 2*atanh(tan(TA0/2)*sqrt((e-1)/(1+e)));
% if isreal(E0) == 0
%     display("E0 unreal")
% end
% M0 = e*sinh(E0) - E0;
% if isreal(M0) == 0
%     display("M0 unreal")
% end
% t0 = M0*h^3/mu^2/(e^2 - 1)^1.5;
% 
% 
% tf = t0 + 7*3600;
E_pos = 2*atanh(tan(TA_inf_bound/2)*sqrt((e-1)/(1+e)));
M_pos = e*sinh(E_pos) - E_pos;
t_pos = M_pos*h^3/mu^2/(e^2 - 1)^1.5;
times = linspace(-t_pos,t_pos,45*60);
RA = [];
DEC = [];
theta = 0;
for i = 1:length(times)
    t2 = times(i);
    M2 = mu^2 * (e^2 - 1)^1.5 * t2/h^3;
    E2 = mean_anomaly(M2, e);
    if isreal(M2) == false
        display("m2 unreal")
    end
    TA2 = 2*atan(tanh(E2/2)*sqrt((1+e)/(e-1)));
    if isreal(TA2) == false
        display("TA2 unreal")
    end
    RA2 = RA0 + RA_dot*(t2 + t_pos);  %why t - t0
    if isreal(RA2) == false
        display("RA2 unreal")
    end
    w2 = w0 + w_dot*(t2 + t_pos);
    if isreal(w2) == false
        display("w2 unreal")
    end
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
    
    theta = we*(t2 + t_pos);
    
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
