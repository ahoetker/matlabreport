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
