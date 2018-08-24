%% Problem 12.4-4
% Steady-state heat flux toward a surface is 1300 W/m^2, fluid temperature
% is 100 C, and h=99.8 W/m^2*K. Compute the surface temperature. 
u = symunit;
flux = 1300 * u.W / u.m^2;
h = 99.8 * u.W / (u.m^2 * u.K);
Tf = rewrite(100 * u.Celsius, u.K, 'Temperature', 'absolute');
syms Tw
Tw = solve(flux - h*(Tf - Tw));
Tw = vpa(rewrite(Tw, u.Celsius, 'Temperature', 'absolute'), 5)