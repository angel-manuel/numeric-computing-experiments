function [out] = multicesar(in, key, c)
    num = double(in);
    mayus = (num >= double('A') & num <= double('Z'));
    num(mayus) = num(mayus) + (double('a') - double('A'));
    onum = num;
    special = (num < double('a') | num > double('z'));
    num = num - double('a');
    
    keynum = double(key);
    keynum = repmat(keynum, 1, ceil(length(num)/length(keynum)));
    
    if c
        num = num + keynum(1:length(num));
    else
        num = num - keynum(1:length(num));
    end
    
    num = mod(num, double('z')-double('a'));
    num = num + double('a');
    num(special) = onum(special);
    out = char(num);
end