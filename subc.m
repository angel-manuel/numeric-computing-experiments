function [A, B] = subc(C)
    s = sum(lista);
    half_s = floor(s/2);
    
    C = sort(C);
end

%C = [1 2 3 4 5 9 6]
%target = 15
%target = 1111
%C(1)   = 0001
%C(2)   = 0010
%C(3)   = 0011
%C(4)   = 0100
%C(5)   = 0101
%C(6)   = 1001
%C(7)   = 0110
%A = 1001 + ...
%A = 1001 + 0100 + .... = 1101 + ....
%A = 1101 + 0010 = 1111
%A = [9 4 2]
%B = [1 3 4 5]
