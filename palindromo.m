function [ ret ] = palindromo( word )
%PALINDROMO Summary of this function goes here
%   Detailed explanation goes here

if(length(word) < 2)
    ret = true;
else
    if(word(1) == word(end))
        ret = palindromo(word(2:(end-1)));
    else
        ret = false;
    end
end


end

