%% Problem 14.3
% points (a) through (g)
S=[29.65   28.55   28.65   30.15   29.35   29.75  29.25 30.65   28.15  ...
    29.85   29.05   30.25   30.85   28.75 29.65   30.45   29.15   30.45 ...
    33.65   29.35   29.75 31.25   29.45   30.15   29.65   30.55   29.65 ...
    29.25]';
MeanS=mean(S)

%%
MedianS=median(S)
%%
ModeS=mode(S)
%%
MinS=min(S)
MaxS=max(S)
RangeS=max(S)-min(S)
%%
StandDevS=std(S)
%%
VarianceS=var(S)
%%
CoeffVariance=std(S)/mean(S)

%%
% part h)
x = 28:0.4:34;
N = hist(S, x)
%n=number of elements in each group of data. x=midpoint of each group.
hist(S, x)
%point (i)
%to encompass 68% of the measurements, the range is from mean(s)-std(s) to mean(s)+std(s)
LowerBound=mean(S)-std(S)
UpperBound=mean(S)+std(S)
%this seems to be a valid estimate since the range encompasses more than
%68% of the measurements. There are 4 out of 28 values that are lower than the
%lower bound and 2 out of 28 that are higher than the higher bound.