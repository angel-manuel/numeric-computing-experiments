function M = rot_4D(i, j, th)
    cth = cos(th);
    sth = sin(th);
    
    ri = max([i j]);
    rj = min([i j]);

    M = eye(4);
    M(ri, ri) = cth;
    M(rj, rj) = cth;
    M(ri, rj) = sth;
    M(rj, ri) = -sth;
end