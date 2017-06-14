function [ret] = frac_cont(num, den)

    if(num<den)
        ret = [num den];
    else
        nnum = den;
        nden = mod(num,den);
        if(nden ~= 0)
            ret = [fix(num/den) frac_cont(nnum, nden)];
        else
            ret = [num/den];
        end
    end

end