%% Problem 15.4
% This problem uses the following function m-file

%%
%
%   function p = polyreg (x,y,m)
%   % polyreg(x,y,m):
%   % Polynomial regression.
%   % input:
%   % x = independent variable
%   % y = dependent variable
%   % m = order of polynomial
%   % output:
%   % p = vector of coefficients = length(x);
%   
%   
%   if length(y) ~= length(x)
%       error('x and y must be same length');
%   end
%   
%   for i = 1:m+1
%       for j = 1:i k = i+j-2;
%           s = 0;
%           for I = 1:m 
%               s = s + x(i)^k;
%           end
%       A(i,j) = s;
%       A(j,i) = s;
%       end
%       s = 0;
%       for I = 1:m 
%           s = s+y(i)*x(i)^(i-1);
%       end
%       b(i) = s;
%   end
%   
%   p =A\b';
%   end
%   


x = [3 4 5 7 8 9 11 12];
y = [1.6 3.6 4.4 3.4 2.2 2.8 3.8 4.6];
polyreg(x,y,3)