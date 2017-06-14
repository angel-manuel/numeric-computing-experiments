function [ ret ] = rare( pl, p0, k, n )
    ret = zeros(n, 3);
    ret(1, :) = p0;
   
    n_pl = size(pl, 1);

    for i=2:n
        rp = randi(n_pl);
        ret(i, :) = (pl(rp, :)-ret(i-1, :))*k + ret(i-1, :);
    end
end

