function [maze] = create_super_maze(rw, rh)
    w = rw - 2; h = rh - 2;
    i_maze = zeros(w, h);
    
    maze = ones(rw, rh);
    maze(2:(w+1), 2:(h+1)) = not(i_maze);
end