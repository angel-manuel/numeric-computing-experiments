function [sol] = a_star(maze)
    p0 = [2 2];
    [w, h] = size(maze);
    pf = [w h];
    
    G = zeros(w, h);
    HX = (1:w);
    HY = (1:h);
    [HXX, HYY] = meshgrid(HX, HY);
    H = sqrt(HXX.^2 + HYY.^2);
    C = false(w, h);
    P = zeros(w, h);
    
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
    
    openlist = [w+2];
    ops = size(openlist, 2);
    while(ops > 0)
        GH = G(openlist) + H(openlist);
        best = GH(GH == min(GH));
        C(best) = true;
        
        best_x = mod(best, w) + 1;
        best_y = floor(best/w) + 1;
        
        N = neighbours([best_x, best_y]);
        
        nn = size(N, 1);
        for ni=1:nn
            n = N(ni);
            if(~C(n(1), n(2)))
                if(G(n(1), n(2)) > (G(best_x, best_y) + 1))
                    G(n(1), n(2)) = (G(best_x, best_y) + 1);
                    P(n(1), n(2)) = best;
                end
            end
        end
    end
end