function [sol] = best_solve_maze(maze, p0, pf)
    [w, h] = size(maze);
    function [n] = flood(p0, pf)
        fl = zeros(w, h);

        fl(p0(1), p0(2)) = 1;

        expandN = zeros(w, h);
        expandE = zeros(w, h);
        expandS = zeros(w, h);
        expandW = zeros(w, h);
        n = 2;
        while not(fl(pf(1), pf(2)))
            expandN(:, :) = not([zeros(w, 1),maze(:, 1:(h-1))])&fl;  %N
            expandE(:, :) = not([maze(2:w, :);zeros(1, h)])&fl;      %E
            expandS(:, :) = not([maze(:, 2:h),zeros(w, 1)])&fl;      %S
            expandW(:, :) = not([zeros(1, h);maze(1:(w-1), :)])&fl;  %W

            fl = fl | expandN(:, [2:h 1]).*n;
            fl = fl | expandE([w 1:(w-1)], :).*n;
            fl = fl | expandS(:, [h 1:(h-1)]).*n;
            fl = fl | expandW([2:w 1], :).*n;

            n = n + 1;
        end
        n = n - 1;
    end
    
    function [N] = neighbours(p)
        PN = [p(1) p(2)-1; p(1)+1 p(2); p(1) p(2)+1; p(1)-1 p(2)];
        N = zeros(0, 2);
        for ipn = 1:4
            pos = PN(ipn, :);
            if(maze(pos(1), pos(2))==0)
                N = [N; pos(1) pos(2)];
            end
        end
    end

    path = zeros(0, 2);
    p = p0;
    while(not(all(p==pf)))
        path = [path; p];
        N = neighbours(p);
        nn = size(N, 1);
        min_n = w*h*2;%min_n>>1
        for i=1:nn
            neigh = N(i, :);
            n = flood(neigh, pf);
            if(n < min_n)
                min_n = n;
                p = neigh;
            end
        end
    end
    path = [path; pf];
    
    sol = maze(:, :);
    posn = (path(:,1)-1)*w + (path(:,2));
    sol(posn) = 2;
end