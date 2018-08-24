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