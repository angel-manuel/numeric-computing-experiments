function helecho()
    N = 100000;

    function [P2] = trf(V, P)
        a=V(1);b=V(2);c=V(3);d=V(4);e=V(5);f=V(6);
        x=P(1);y=P(2);
        P2 = [a b; c d]*[x; y] + [e; f];
    end

    f1 = [0 0 0 0.16 0 0];
    f2 = [0.85 0.04 -0.04 0.85 0 1.6];
    f3 = [0.2 -0.26 0.23 0.22 0 1.6];
    f4 = [-0.15 0.28 0.26 0.24 0 0.44];
    
    z = [0, 0];
    
    Z = zeros(2, N+1);
    Z(:, 1) = z;
    
    for i=1:N
        p = rand();
        if(p<0.01)
            z = trf(f1, z);
        elseif(p<0.86)
            z = trf(f2, z);
        elseif(p<0.93)
            z = trf(f3, z);
        else
            z = trf(f4, z);
        end
        Z(:, i+1) = z;
    end
    
    plot(Z(1, :), Z(2, :), 'black.', 'MarkerSize', 1);
end