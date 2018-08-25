%% Homework 1
%
% Author: Andrew Hoetker, ASUID 1207233777
%
% Due: 2018-08-23
%
% Class: CHE334-74229 Dr. Varman
%
% MATLAB R2018a

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

%% Problem 12.6-3
% Calculate heat loss for a double-pane window given the specifications,
u = symunit;
delta_x = rewrite(6.35 * u.mm, u.m);
k_window = 0.869 * u.W / (u.m * u.K);
k_air = 0.026 * u.W / (u.m * u.K);
length = 0.914 * u.m; width = 1.83 * u.m;
A = length * width;
delta_T = 27.8 * u.K;

R1 = delta_x / (k_window * A);
R2 = delta_x / (k_air * A);
R3 = delta_x / (k_window * A);
q = delta_T / (R1 + R2 + R3);  % in series
q = vpa(q, 5)

%% Problem 13.1-2
% A cooling coil of 304 stainless steel has the dimensions,
u = symunit;
l = 1.0 * u.ft;
ID = rewrite(0.25 * u.in, u.ft);
OD = rewrite(0.40 * u.in, u.ft);
T_i = 40 * u.Fahrenheit;
T_o = 80 * u.Fahrenheit;
%%
% Thermal conductivity is a function of temperature, 
% $$ k = 7.75 + 7.78 * 10^{-3} T $$
k = @(T) (7.75 + 7.78e-3 * T * u.Fahrenheit^-1) * u.Btu/(u.h*u.ft*u.Fahrenheit);
%%
% Evaluate using mean values: $$ q=A_{lm} k(\bar{T}) (T_o-T_i) / \Delta x $$
%
A_i = pi * l * ID; A_o = pi * l * OD;
A_lm = (A_o - A_i) / log(A_o/A_i);
T_m = (T_i + T_o)/2;
q = A_lm * k(T_m) * (T_o-T_i) / (OD/2 - ID/2);
q = vpa(rewrite(q, u.Btu_th / u.s), 5)  % question specifies Btu/s


%% Problem 13.1-4
% Derive Eq. (13.1-18) for steady-state conduction of heat in a hollow
% sphere. Also, derive an equation that shows temperature varies 
% hyperbolically with radius _r_. 
%
% Starting with Fourier's law, $$ \frac{q}{A} = -k \frac{dT}{dr} $$
%
% Sphere area: $$ A = 4 \pi r^2 $$
% 	
% Substitute for area, $$ \frac{q}{4 \pi r^2} = -k \frac{dT}{dr} $$
% 	
% Rearrange and integrate both sides,
%
% $$ \frac{q}{4\pi} \int_{r_1}^{r_2} r^{-2}dr = -\int_{T_1}^{T_2} k dT $$
%
% $$ \frac{q}{4\pi} \left( -\frac{1}{r_2} - (-\frac{1}{r_1}) \right) = -k(T_2 - T_1) $$
%
% $$ \frac{q}{4\pi}\ \left(\frac{1}{r_1} - \frac{1}{r_2}\right) = k(T_1 - T_2) $$
%
% $$ q = \frac{4 \pi k (T_1 - T_2)}{(\frac{1}{r_1} - \frac{1}{r_2})} $$
%
% $$ q = \frac{(T_1 - T_2)}{(\frac{1}{r_1} - \frac{1}{r_2}) / 4 \pi k} $$ 
%
%%
%
% Derive an equation showing that temperature varies hyperbolically with _r_,
%
% Derive an equation showing that temperature varies hyperbolically with _r_:
% Begin with Fourier's law again, $$ \frac{q}{A} = -k \frac{dT}{dr} $$
%
% Rearrange, $$ \frac{dT}{dr} = -\frac{q}{kA} $$
%
% Substitute values for _A_ and _q_ from previous steps,
%
% $$  \frac{dT}{dr} = -\frac{(T_2-T_1) 4 \pi k}{(\frac{1}{r_1} - \frac{1}{r_2}) 4 \pi r^2 k} $$
%
% Simplify, 
%
% $$ dT = \frac{T_1-T_2}{(\frac{1}{r_1} - \frac{1}{r_2}) r^2} dr $$	
%
% Integrate both sides,
%
% $$ \int_{T_1}^{T} dT = \frac{T_1-T_2}{(\frac{1}{r_1} - \frac{1}{r_2})} \int_{r_1}^r r^{-2}dr $$
%
% $$ T - T_1 =  \frac{T_1-T_2}{(\frac{1}{r_1} - \frac{1}{r_2})} \left(\frac{1}{r_1}-\frac{1}{r}\right) $$	
%
% $$ \frac{T-T_1}{T_2-T_1} = \frac{1}{\frac{1}{r_1}-\frac{1}{r_2}} \left(\frac{1}{r_1}-\frac{1}{r}\right)$$

