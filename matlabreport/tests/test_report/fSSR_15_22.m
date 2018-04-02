function f = fSSR_15_11(a,x,y)
yp = ((a(1) + sqrt(x)) ./ a(2).*sqrt(x)).^2;
f = sum((y - yp).^2);
end