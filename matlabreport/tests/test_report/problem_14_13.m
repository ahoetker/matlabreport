%% Problem 14.13
x0 = [0.4 0.8 1.2 1.6 2 2.3];
y0 = [800 985 1490 1950 2850 3600];
y2 = log(y0);
[a R2] = linregr(x0,y2)
k2 = a(1)
k1 = exp(a(2))

x = linspace(0,3,1000);

subplot(2,1,1)
ya = exp(a(1)*a(2)*x);
plot(x,ya,x0,y0)
title('Standard')
xlabel('x')
ylabel('y')

subplot(2,1,2)
yb = a(1)*x+a(2);
plot(x,yb,x0,log(y0))
title('Semi-Log')
xlabel('x')
ylabel('ln(y)')