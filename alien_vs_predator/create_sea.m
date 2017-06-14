function [S] = create_sea(x, y, a, p)
    if((a+p)>(x*y))
        error('(a+p)>(x*y)');
    end
    
    alien_repr = 2;
    predator_death = 5;

    S(x, y).edad = 0;
    for i=1:x
        for j=1:y
            S(i, j).edad = 0;
            S(i, j).tipo = '';
        end
    end
    
    for alien=1:a
        placed = false;
        while(~placed)
            rx = ceil(rand()*x);
            ry = ceil(rand()*y);
            placed = strcmp(S(rx, ry).tipo, '');
            if(placed)
                S(rx, ry).tipo = 'alien';
                S(rx, ry).edad = randi(alien_repr);
            end
        end
    end
    
    for predator=1:p
        placed = false;
        while(~placed)
            rx = ceil(rand()*x);
            ry = ceil(rand()*y);
            placed = strcmp(S(rx, ry).tipo, '');
            if(placed)
                S(rx, ry).tipo = 'predator';
                S(rx, ry).edad = randi(predator_death);
            end
        end
    end
end

