function display_sea(S)
    [w, h] = size(S);
    T = zeros(w, h);
    E = zeros(w, h);
    
    for x=1:w
        for y=1:h
            if(strcmp(S(x, y).tipo, 'alien'))
                T(x, y) = 1;
            elseif(strcmp(S(x, y).tipo, 'predator'))
                T(x, y) = 2;
            end
            E(x, y) = S(x, y).edad;
        end
    end
    
    title('Tipos');
    imagesc(T);
    colormap(jet(4));
    axis square;
end

