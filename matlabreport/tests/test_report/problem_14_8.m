%% Problem 14.8
%
% $$ y = \alpha_4 * x * e^{\beta_4 x} $$ 
%
% Will be rearranged algebraically to:
%
% $$ \ln{\frac{y}{x}} = \beta_4 x + \ln(\alpha_4) $$
%

x = [0.1 0.2 0.4 0.6 0.9 1.3 1.5 1.7 1.8];
y = [0.75 1.25 1.45 1.25 0.85 0.55 0.35 0.28 0.18];
y2 = log(y./x);
[a R2] = linregr(x,y2);
B4 = a(1)
A4 = exp(a(2))