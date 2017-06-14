function [M] = bz_evolve(M0, steps, draw)
	n = 15;
	jmp = 5;
	k_a = 2;
	k_b = 3;

	[w, h] = size(M0);
	M = zeros(w, h);

	east = [w 1:(w-1)];
	west = [2:w 1];
	north = [h 1:(h-1)];
	south = [2:h 1];
	function [N] = near_sum_moore(M)
		N = M(:, north) + M(east, north) + M(east, :) + M(east, south) + M(:, south) + M(west, south) + M(west, :) + M(west, north);
	end

	function [N] = near_sum_neumann(M)
		N = M(:, north) + M(east, :) + M(:, south) + M(west, :);
	end

	function [N] = near_sum_diagonal(M)
		N = M(east, north) + M(east, south) + M(west, south) + M(west, north);
	end

	function [N] = near_sum(M)
		N = near_sum_moore(M);
	end

	if(draw)
		STATUS = zeros(1, n);
	end
	
	for i=1:steps
		sick = M0>=n;
		infected = M0>0 & M0<n;
		healty = M0<=0;
		
		a = near_sum(infected);
		b = near_sum(sick);
		S = near_sum(M0);

		M(sick) = 0;
		M(infected) = S(infected)./(a(infected)+b(infected)+1) + jmp;
		M(healty) = a(healty)./k_a + b(healty)./k_b;
		M(M>n) = n;

		M0 = M;

		if(draw)
			%subplot(2, 1, 1);
			imagesc(M);
			colorbar;
			title(['Step ' num2str(i)]);
			%subplot(2, 1, 2);
			%STATUS(i) = sum(sum(M))./(w*h*n);
			%plot(1:i, STATUS(1:i));

			pause(0.05);
		else
			disp(['Step ', num2str(i)]);
		end
	end
end
