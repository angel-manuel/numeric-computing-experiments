function [a, p] = count_sea(S)
	[w, h] = size(S);

	a = 0;
	p = 0;

	for x=1:w
        for y=1:h
            if(strcmp(S(x, y).tipo, 'alien'))
                a = a + 1;
            elseif(strcmp(S(x, y).tipo, 'predator'))
                p = p + 1;
            end
        end
    end
end

