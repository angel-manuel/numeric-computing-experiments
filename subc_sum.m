function [sol, ret] = subc_sum(C, sum)
    sol = false;
    ret = false;
    if(sum==0)
        sol = [];
        ret = true;
    elseif(isempty(C))
        sol = false;
        ret = false;
    elseif(length(C)==1)
        if(sum==C(1))
            sol = [C(1)];
            ret = true;
        end
    else
        [s, r] = subc_sum(C(2:end), sum);
        if(s)
            sol = s;
            ret = r;
        else
            [s, r] = subc_sum(C(2:end), sum - C(1));
            if(r)
                sol = [C(1) s];
                ret = r;
            end
        end
    end
end
