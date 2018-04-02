function f = fSSR_15_11(a,I,P)
Pp = (a(1)/a(2)) .* I .* exp(-I/a(2) + 1);
f = sum((P - Pp).^2);
end