function [out] = cesar(in, d)
    num = double(in);
    mayus = (num >= double('A') & num <= double('Z'));
    num(mayus) = num(mayus) + (double('a') - double('A'));
    onum = num;
    special = (num < double('a') | num > double('z'));
    num = num - double('a');
    
    num = num + d;
    
    num = mod(num, double('z')-double('a'));
    num = num + double('a');
    num(special) = onum(special);
    out = char(num);
end