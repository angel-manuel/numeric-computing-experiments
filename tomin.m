function [out] = tomin(in)
    num = double(in);
    mayus = (num >= double('A') & num <= double('Z'));
    num(mayus) = num(mayus) + (double('a') - double('A'));
    out = char(num);
end