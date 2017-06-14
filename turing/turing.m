function [chain] = turing(machine, chain0, pos, n)
	state = 1;
	chain = chain0;
	disp(num2str(chain));
	%imagesc(chain);

	chain_delta = 1;
	function [val] = chain_get(n)
		l = length(chain);
		if((n + chain_delta) == 0)
			chain = [0 chain];
			chain_delta = chain_delta + 1;
			val = 0;
		elseif((n + chain_delta) > length(chain))
			chain = [chain 0];
			val = 0;
		else
			val = chain(n + chain_delta);
		end
	end

	function chain_set(n, val)
		chain_get(n);
		chain(n + chain_delta) = val;
	end
	
	for i=1:n
		val = chain_get(pos) + 1;
		
		chain_set(pos, machine(state, val, 1));
		pos = pos + machine(state, val, 2);

		disp(num2str(chain));

		state = machine(state, val, 3);
		if(state == 0)
			break;
		end

		%pause(0.3);
		%imagesc(chain);
		%title(['State:', num2str(state), ' Step: ', num2str(i), ' Pos: ', num2str(pos)]);
	end
end

