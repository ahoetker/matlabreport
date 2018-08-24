%% Problem 12.3-2
% Given values from problem, calculate thermal conductivity in btu/h*ft*F
% and W/m*K
%
% Solution in SI units:
u = symunit;
heat = 35.1 * u.W;
area = 1 * u.m^2;
flux = heat / area;
delta_T = 318.4 * u.K - 303.2 * u.K;
delta_x = 25 * u.mm;
syms k
k = solve(flux - k*delta_T/delta_x);
k = vpa(rewrite(k, u.W / (u.m * u.K)), 5)
%%
% Solution in Btu:
heat = rewrite(heat, u.Btu_th / u.h);
area = rewrite(area, u.ft^2);
flux = heat / area;
delta_T = rewrite(318.4 * u.K, u.Fahrenheit) - rewrite(303.2 * u.K, u.Fahrenheit);
delta_x = rewrite(delta_x, u.ft);
syms k
k = solve(flux - k*delta_T/delta_x);
k = vpa(k, 5)
