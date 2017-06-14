function [sol] = flood_maze(maze, p0, steps)
    [w, h] = size(maze);
    sol = zeros(w, h);
    asol = zeros(w, h);
    
    sol(p0(1), p0(2)) = 1;
    
    expandN = zeros(w, h);
    expandE = zeros(w, h);
    expandS = zeros(w, h);
    expandW = zeros(w, h);
    
    for si=1:steps
        expandN(:, :) = not([zeros(w, 1),maze(:, 1:(h-1))])&sol;  %N
        expandE(:, :) = not([maze(2:w, :);zeros(1, h)])&sol;      %E
        expandS(:, :) = not([maze(:, 2:h),zeros(w, 1)])&sol;      %S
        expandW(:, :) = not([zeros(1, h);maze(1:(w-1), :)])&sol;  %W
        
        asol = sol;

        sol = sol | expandN(:, [2:h 1]);
        sol = sol | expandE([w 1:(w-1)], :);
        sol = sol | expandS(:, [h 1:(h-1)]);
        sol = sol | expandW([2:w 1], :);
        
        sol = sol + asol;
    end
end