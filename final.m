function [ret, ganador] = final(tablero)
    ret = false;
    ganador = 0;

    for f=1:3
        if(all(tablero(f, :) == 1))
            ret = true;
            ganador = 1;
        end
        if(all(tablero(f, :) == -1))
            ret = true;
            ganador = -1;
        end
    end
    
    for c=1:3
        if(all(tablero(:, c) == 1))
            ret = true;
            ganador = 1;
        end
        if(all(tablero(:, c) == -1))
            ret = true;
            ganador = -1;
        end
    end
    
    d1 = [tablero(1, 1) tablero(2, 2) tablero(3, 3)];
    if(all(d1 == 1))
        ret = true;
        ganador = 1;
    end
    if(all(d1 == -1))
        ret = true;
        ganador = -1;
    end
    
    d2 = [tablero(1, 3) tablero(2, 2) tablero(3, 1)];
    if(all(d2 == 1))
        ret = true;
        ganador = 1;
    end
    if(all(d2 == -1))
        ret = true;
        ganador = -1;
    end
    
    if(ganador == 0)
        if(any(tablero(:) == 0))
            ret = false;
        else
            ret = true;
        end
    end
end