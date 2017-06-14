function [ret] = galton(n, m)
   ret = zeros(n, n);
   for i=1:m
       x = 1;
       for depth=1:n
           ret(depth, x) = ret(depth, x) + 1;
           x = x + round(rand());
       end
   end
   for depth=1:n
       cutpoint = fix(depth+((n-depth)/2));
       ret(depth, :) = ret(depth, :).*(depth/1000);
       ret(depth, :) = [ret(depth, cutpoint:n) ret(depth, 1:(cutpoint-1))];
   end
end