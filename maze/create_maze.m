function [maze] = create_maze(rw, rh)
    w = rw - 2; h = rh - 2;
    i_maze = zeros(w, h);
    i_maze(1, 1) = 1;
    
    while i_maze(w, h)==0
        N = [i_maze(2:w, :);zeros(1, h)] + [zeros(1, h);i_maze(1:(w-1), :)] + [i_maze(:, 2:h),zeros(w, 1)] + [zeros(w, 1),i_maze(:, 1:(h-1))];

        c = 0.05;
        mnum = sqrt(sum(sum(i_maze)));
        sr1 = c;
        sr2 = c/mnum;
        sr3 = c/(mnum^2);
        expand = (N>0)&(((rand(w,h)<sr1)&(N==1))|((rand(w,h)<sr2)&(N==2))|((rand(w,h)<sr3)&(N==3)));

        i_maze = i_maze | expand;
    end
    
    maze = ones(rw, rh);
    maze(2:(w+1), 2:(h+1)) = not(i_maze);
end