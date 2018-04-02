%% Problem 15.22
% This problem uses the following function m-file to calculate the 
% sum of squared residuals

%%
%
%   function f = fSSR_15_11(a,x,y)
%   yp = ((a(1) + sqrt(x)) ./ a(2).*sqrt(x)).^2;
%   f = sum((y - yp).^2);
%   end

%%
% The constants can obtained by finding the minimum of this function

x = [0.5 1 2 3 4];
y = [10.4 5.8 3.3 2.4 2];
A = fminsearch(@fSSR_15_22, [0, 0], [], x, y);
a = A(1)
b = A(2)

%% 
% These parameters are used to predict _y_ at _x_ = 1.6

((a + sqrt(1.6)) / b*sqrt(1.6))^2
