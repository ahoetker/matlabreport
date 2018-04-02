%% Problem 15.11
% This problem uses the following function m-file to calculate the 
% sum of squared residuals

%%
%
%   function f = fSSR_15_11(a,I,P)
%   Pp = (a(1)/a(2)) .* I .* exp(-I/a(2) + 1);
%   f = sum((P - Pp).^2);
%   end

%%
% The constants can obtained by finding the minimum of this function

I = [50 80 130 200 250 350 450 550 700];
P = [99 177 202 248 229 219 173 142 72];
a = fminsearch(@fSSR_15_11, [100, 100], [], I, P);
Pm = a(1)
Isat = a(2)
