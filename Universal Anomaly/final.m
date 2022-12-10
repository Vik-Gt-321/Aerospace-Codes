function [r_vec, v_vec] = final(dt, R0_vec, V0_vec)

mu= 398600;

r0 = norm(R0_vec);
v0 = norm(V0_vec);
vr0 = dot(R0_vec, V0_vec)/r0;
alpha = 2/r0 - (v0*v0)/mu;

fprintf('\n Initial position vector norm (km):')
fprintf('\n r0 = (%g)\n', r0)
fprintf('\n Initial velocity vector (km/s):')
fprintf('\n v0 = (%g)\n', v0)
fprintf('\n vr0 = (%g)\n', vr0)
fprintf('\n alpha = (%g)\n', alpha)


x = universal(dt, r0, vr0, alpha);
fprintf('\n x = (%g)\n', x)

[f, g] = fg(dt, x, alpha, r0);
fprintf('\n f = (%g)\n', f)
fprintf('\n g = (%g)\n', g)


r_vec = f*R0_vec +  g*V0_vec;
r = norm(r_vec);
fprintf('\n r = (%g)\n', r)


[fdot, gdot] = fgdot(r, r0, alpha, x);
fprintf('\n fdot = (%g)\n', fdot)
fprintf('\n gdot = (%g)\n', gdot)


v_vec = fdot*R0_vec + gdot*V0_vec;

end