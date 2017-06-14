function [] = draw_4D(P, d)
    W = P(:, 4) + d;
    D3 = P(:, 1:3);
    D3 = D3./[W W W];
    plot3(D3(:, 1), D3(:, 2), D3(:, 3));
end