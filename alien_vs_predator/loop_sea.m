function [S, A, P] = loop_sea(S0, n)
    S = S0;
	A = zeros(1, n+1);
	P = zeros(1, n+1);

	subplot(2, 1, 1);
    display_sea(S);
	subplot(2, 1, 2);
	[A(1), P(1)] = count_sea(S);
	plot([0], A(1), [0], P(1), 'MarkerSize', 3);

    for i=1:n
        pause(0.1);
        S = evolve_sea(S, 1);

        subplot(2, 1, 1);
		display_sea(S);
		subplot(2, 1, 2);
		[A(i+1), P(i+1)] = count_sea(S);
		plot(0:i, A(1:(i+1)), 0:i, P(1:(i+1)), 'MarkerSize', 3);

        title(['Step: ' num2str(i)]);
    end
end

