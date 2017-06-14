function [sol] = solve_maze(maze, p0, pf)
    [w, h] = size(maze);
    cmaze = maze(:, :);
    
    function [N] = neighbours(p)
        PN = [p(1) p(2)-1; p(1)+1 p(2); p(1) p(2)+1; p(1)-1 p(2)];
        N = zeros(0, 2);
        for ipn = 1:4
            pos = PN(ipn, :);
            if(cmaze(pos(1), pos(2))==0)
                N = [N; pos(1) pos(2)];
            end
        end
    end

    pause on;
    function [ret] = explore(p)
        cmaze(p(1), p(2)) = 2;
        imagesc(cmaze);
        pause(0.05);
        if(all(p==pf))
            ret = true;
        else
            N = neighbours(p);
            n = size(N, 1);
            ret = false;
            for ni=1:n
                ret = ret || explore(N(ni, :));
            end
            if(not(ret))
                cmaze(p(1), p(2)) = 0;
            end
        end
    end
    
    explore(p0);
    sol = cmaze;
end