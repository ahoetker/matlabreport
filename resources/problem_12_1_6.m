%% Problem 12.1-6
% Define linear interpolation function, which is used throughout assignment
% to interpolate values from tables,
lininterp = @(x1, x2, y1, y2, x) y1 + (x-x1)/(x2-x1)*(y2-y1);
%%
% Determine enthalpy change for 1 lb of water for each of the following
% cases:

%%
% (a) Heating liquid water, 40 F to 240 F at 30 psia.
u = symunit;
H1 = 8.032 * u.Btu_th / u.lbm;  % from table A.2-9b
H2 = 208.47 * u.Btu_th / u.lbm;  % from table A.2-9b
delta_H = H2 - H1;
delta_H = vpa(delta_H)


%%
% (b) Heating liquid water, 40 F to 240 F and vaporizing at 240F and 24.97 
% psia.
H1 = 8.032 * u.Btu_th / u.lbm;  % from table A.2-9b
H2 = 1160.5 * u.Btu_th / u.lbm;  % from table A.2-9b
delta_H = H2 - H1;
delta_H = vpa(delta_H)
%%
% (c) Cooling and condensing from saturated vapor at 212 F and 1 atm abs to
% a liquid at 60 F.

% linear interpolation of data from table A.2-9b
H1 = lininterp(210, 220, 1149.5, 1153.5, 212) * u.Btu_th/u.lbm;
H2 = 28.08 * u.Btu_th / u.lbm;  % from table A.2-9b
delta_H = H2 - H1;
delta_H = vpa(delta_H)

%%
% (d) Condensing a saturated vapor at 212 F and 1 atm abs.

% linear interpolation of data from table A.2-9b
H1 = lininterp(210, 220, 1149.5, 1153.3, 212) * u.Btu_th/u.lbm;
H2 = lininterp(210, 220, 178.17, 188.25, 212) * u.Btu_th/u.lbm;
delta_H = H2 - H1;
delta_H = vpa(delta_H)