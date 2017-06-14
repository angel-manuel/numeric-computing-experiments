function [S] = evolve_sea(S0, n)
    [w, h] = size(S0);
    
    function [XM] = crdmodx(X)
       	XM = mod(X-1, w)+1;
    end

    function [YM] = crdmody(Y)
       	YM = mod(Y-1, h)+1;
    end

    function [rv] = rn(x)
        r = rand(1);
        if r > 0.5
            rv = [x, x + 1, x - 1];
        else
            rv = [x, x - 1, x + 1];
        end
        shift = randi(3);
        rv = rv([shift:3 1:(shift-1)]);
    end

    function move_predator(x, y)
        moved = false;
        
        edad = SA(x, y).edad;
        tipo = SA(x, y).tipo;
        if(strcmp(tipo, 'predator'))
            if(edad >= predator_death)
                S(x, y).tipo = '';
                S(x, y).edad = 0;
                moved = true;
            end
            for dst_x=crdmodx(rn(x))
                for dst_y=crdmody(rn(y))
                    if(~moved && strcmp(SA(dst_x, dst_y).tipo, 'alien'))
                        S(x, y).edad = 0;
                        S(dst_x, dst_y).tipo = 'predator';
                        S(dst_x, dst_y).edad = 0;

                        moved = true;
                    end
                end
            end
            for dst_x=crdmodx(rn(x))
                for dst_y=crdmody(rn(y))
                    if(~moved)
                        if(strcmp(SA(dst_x, dst_y).tipo, ''))
                            S(dst_x, dst_y).tipo = tipo;
                            S(dst_x, dst_y).edad = edad + 1;

                            S(x, y).tipo = '';
                            S(x, y).edad = 0;
                            moved = true;
                        end
                    end
                end
            end
        end
    end

    alien_repr = 2;
    predator_death = 5;
    function move(x, y)
        moved = false;
        
        edad = SA(x, y).edad;
        tipo = SA(x, y).tipo;
        if(strcmp(tipo, 'alien'))
            for dst_x=crdmodx(rn(x))
                for dst_y=crdmody(rn(y))
                    if(~moved)
                        if(strcmp(SA(dst_x, dst_y).tipo, ''))
                            if(edad >= alien_repr)
                                S(x, y).edad = 0;
                                S(x, y).tipo = 'alien';
                                S(dst_x, dst_y).edad = 0;
                                S(dst_x, dst_y).tipo = 'alien';
                            else
                                S(dst_x, dst_y).tipo = tipo;
                                S(dst_x, dst_y).edad = edad + 1;

                                S(x, y).tipo = '';
                                S(x, y).edad = 0;
                            end
                            moved = true;
                        end
                    end
                end
            end
        end
    end
    
    S = S0;
    for i=1:n
        SA = S;
        for x=1:w
            for y=1:h
                move_predator(x, y);
            end
        end
        SA = S;
        for x=1:w
            for y=1:h
                move(x, y);
            end
        end
    end
end

