function [x, y] = tres_en_raya(tablero)
    best_val = -2;
    best_x = -1;
    best_y = -1;

    for a=1:3
        for b=1:3
            if(tablero(a,b) == 0)
                tablero(a,b) = 1;
                val = min_j(tablero);
                if(val > best_val)
                    best_val = val;
                    best_x = a;
                    best_y = b;
                end
                tablero(a,b) = 0;
            end
        end
    end
    
    x = best_x;
    y = best_y;
end

function [ret] = min_j(tablero)
    [fin, ganador] = final(tablero);
    if(fin)
        ret = ganador;
    else
        worst_val = 2;

        for a=1:3
            for b=1:3
                if(tablero(a,b) == 0)
                    tablero(a,b) = -1;
                    val = max_j(tablero);
                    if(val < worst_val)
                        worst_val = val;
                    end
                    tablero(a,b) = 0;
                end
            end
        end
        
        ret = worst_val;
    end
end

function [ret] = max_j(tablero)
    [fin, ganador] = final(tablero);
    if(fin)
        ret = ganador;
    else
        best_val = -2;

        for a=1:3
            for b=1:3
                if(tablero(a,b) == 0)
                    tablero(a,b) = 1;
                    val = min_j(tablero);
                    if(val > best_val)
                        best_val = val;
                    end
                    tablero(a,b) = 0;
                end
            end
        end
        
        ret = best_val;
    end
end