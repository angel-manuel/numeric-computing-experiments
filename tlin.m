function tlin(M)
    [X, Y, Z] = sphere(30);
    X = X(:);
    Y = Y(:);
    Z = Z(:);
    P = vertcat(X', Y', Z');
    
    size(P)
    
    P2 = M*P;
    
    plot3(P(1,:), P(2,:), P(3,:), 'b.');
    hold on;
    plot3(P2(1,:), P2(2,:), P2(3,:), 'r.');
    axis equal;
end