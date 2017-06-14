function [ret] = hanoi(n, src, dst)
    if(n == 1)
        disp(['Muevo de ' num2lugar(src) ' a ' num2lugar(dst)]);
        ret = 1;
    else
        vacio = buscar_vacio(src, dst);
        
        ret = 0;
        ret = ret + hanoi(n-1, src, vacio);
        ret = ret + hanoi(1, src, dst);
        ret = ret + hanoi(n-1, vacio, dst);
    end
end

function [lugar] = num2lugar(num)
    if(num == 1)
        lugar = 'izquierda';
    elseif(num == 2)
        lugar = 'centro';
    elseif(num == 3)
        lugar = 'derecha';
    else
        lugar = 'WTF!!!';
    end
end

function [vacio] = buscar_vacio(src, dst)
    if(src == 1)
        if(dst == 2)
            vacio = 3;
        else
            vacio = 2;
        end
    end
    if(src == 2)
        if(dst == 1)
            vacio = 3;
        else
            vacio = 1;
        end
    end
    if(src == 3)
        if(dst == 2)
            vacio = 1;
        else
            vacio = 2;
        end
    end
end