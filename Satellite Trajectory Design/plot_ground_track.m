function plot_ground_track(ra, dec, n_curves)

xlabel('East longitude (degrees)')
ylabel('Latitude (degrees)')
%grid on
n_curves;
axis([0 360 -90 90])
hold on;
for i = 1:n_curves

%     ra{i}
%     dec{i}   
%     isreal(dec{i})
%     isreal(ra{i})
    plot(ra{i}, dec{i},'--')
end




end