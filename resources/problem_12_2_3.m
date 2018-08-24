%% Problem 12.2-3
% Air stream at 32.2 C is preheated to 65.5C. Air flow is 1000 kg-mol/h.
% Steam enters saturated at 148.9 C, is condensed and cooled, leaves as 
% liquid at 137.8 C. Calculate amount of steam used in kg/h. 
u = symunit; lininterp = @(x1, x2, y1, y2, x) y1 + (x-x1)/(x2-x1)*(y2-y1);
n_air = 1000 * u.kmol / u.h;
cpm_air = lininterp(25, 100, 29.19, 29.29, 32.2) * u.kJ/(u.kmol*u.K);
T_air_1 = rewrite(32.2*u.Celsius, u.K);
T_air_2 = rewrite(65.5*u.Celsius, u.K);
deltaH_air = n_air * cpm_air * (T_air_2 - T_air_1);

enthalpy_steam_1 = lininterp(145, 150, 2740.3, 2746.5, 148.9) * u.kJ/u.kg;
enthalpy_steam_2 = lininterp(135, 140, 567.69, 589.13, 137.8) * u.kJ/u.kg;
syms m;
deltaH_steam = m * (enthalpy_steam_2 - enthalpy_steam_1);

m = solve(deltaH_air - deltaH_steam);
m = vpa(-m, 5)