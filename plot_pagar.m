function [] = plot_pagar(A)
    N = zeros(1, length(A));
    for i=1:length(A)
        disp(['amount = ' num2str(A(i))]);
        N(i) = size(pagar(A(i), []), 1);
        disp(['n = ' num2str(N(i))]);
    end
    plot(A, N);
end