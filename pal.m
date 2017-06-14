function [ret] = pal(palabra)
    if(length(palabra) < 2)
        ret = true;
    else
        if(palabra(1) == palabra(end))
            ret = pal(palabra(2:(end-1)));
        else
            ret = false;
        end
    end
end