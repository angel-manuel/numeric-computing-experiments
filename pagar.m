function [C] = pagar(amount, token)
    token_def = [0.01 0.02 0.05 0.1 0.2 0.5 1 2 5 10 20 50 100 200 500];
    
    if(isempty(token))
        token = token_def;
    end
    
    disp(['token = ' num2str(token)])
    
    max_token = floor(amount./token);
    
    dificultad = 1;
    for mt=max_token
        dificultad = dificultad * (mt+1);
    end
    disp(['Dificultad: ' num2str(dificultad)])
    
    C = unique(rpagar(amount, token), 'rows');
end

function [C] = rpagar(amount, token)
    if(amount == 0)
        C = zeros(1, length(token));
    else
        max_token = floor(amount./token);

        C = [];

        if(any(max_token))
            for t=1:length(token)
                if(max_token(t) > 0)
                    sub_C = rpagar(amount - token(t), token);
                    if(~isempty(sub_C))
                        sub_C(:, t) = sub_C(:, t) + 1;
                        C = [C; sub_C];
                    end
                end
            end
        else
            C = [];
        end
    end
end

