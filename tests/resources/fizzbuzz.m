function response = fizzbuzz(x)

if rem(x, 3) == 0
    s1 = 'Fizz';
else
    s1 = '';
end

if rem(x, 5) == 0
    s2 = 'Buzz';
else
    s2 = '';
end

s3 = strcat(s1, s2);
if numel(s3) > 0
    response = s3;
else
    response = x;
end

end