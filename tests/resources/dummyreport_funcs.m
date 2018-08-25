%% Dummy Report
%
% Author: Boris Savinkov
%
% Due: 2018-08-23
%
% Class: MAT101

%% Problem 1
% This is the first dummy problem! I will do some simple operations in MATLAB.

A = [1 2 3; 4 5 6; 7 8 9];
b = 7;
C = b.*A

%% Problem 2
% This time, I will do some LaTeX, and have a new section in the problem.
%
% The quadratic formula is,
%
% $$ x = \frac{-b \pm \sqrt{b^2 -4ac}}{2a} $$
%
% Now let's try sections:

p = 5; q = 10;
p * q

%%
% Whew! What a bit of math that was! Moving on...

t = 100; s = 50;
t / s

%% Problem 3
% Let's take the log-mean of two quantities! We're actually doing this
% to test one of the dummy functions.

logmean(5, 10)

%% Problem 4
% FizzBuzz! We're going to fizzbuzz a bunch of numbers to test the function.

fizzbuzz(3)
fizzbuzz(5)
fizzbuzz(15)
fizzbuzz(8)

%% Referenced Functions 
%% fizzbuzz.m
%
%   function response = fizzbuzz(x)
%   
%   if rem(x, 3) == 0
%       s1 = 'Fizz';
%   else
%       s1 = '';
%   end
%   
%   if rem(x, 5) == 0
%       s2 = 'Buzz';
%   else
%       s2 = '';
%   end
%   
%   s3 = strcat(s1, s2);
%   if numel(s3) > 0
%       response = s3;
%   else
%       response = x;
%   end
%   
%   end

%% logmean.m
%
%   function lm = logmean(a, b)
%   lm = (b - a) / log(b / a);
%   end

