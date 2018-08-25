%% Problem 12.6-6
% Calculate total heat loss from a steam pipe with the given
% specifications.
u = symunit;
OD = 0.1683 * u.m;
l = 0.305 * u.m;
eps = 0.79;
h_c = 6.12 * u.W / (u.m^2 * u.K);
Tw = 374.9 * u.K;
Tf = 297.1 * u.K;
%%
% $$ q_{conv} = A h_c (T_w - T_f) $$
A = pi * OD * l;
q_conv = A * h_c * (Tw - Tf);
%%
% $$ q_{rad} = A \epsilon \sigma (T_w^4 - T_f^4) $$
sigma = 5.670367e-8 * u.W * u.m^-2 * u.K^-4;
q_rad = A * eps * sigma * (Tw^4 - Tf^4);
%%
% $$ q = q_{conv} + q_{rad} $$
q = vpa(q_conv + q_rad, 5)
