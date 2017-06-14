function [M] = heat_evolve(M0, n)
	[w, h] = size(M0);

	east = [w 1:(w-1)];
	west = [2:w 1];
	north = [h 1:(h-1)];
	south = [2:h 1];
	function [N] = near_sum_moore(M)
		N = M(:, north) + M(east, north) + M(east, :) + M(east, south) + M(:, south) + M(west, south) + M(west, :) + M(west, north);
	end

	M=M0;
	colormap(hot);
	for i=1:n
		M = near_sum_moore(M)./8;
		imagesc(M);
		pause(0.1);
	end

end

