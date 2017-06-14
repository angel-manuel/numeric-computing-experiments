function [ret] = llama(n, m, t)
   f = 10*d;
   pause on;
   ret = zeros(n, n);
   for ang=linspace(0, 2*pi*t, f);
       for i=1:m
           x = 1;
           for depth=1:n
               ret(depth, x) = ret(depth, x) + 1;
               x = x + round(rand()+0.5*sin((2*pi*depth/n)+ang));
           end
       end
       for depth=1:n
           cutpoint = fix(depth+((n-depth)/2));
           ret(depth, :) = ret(depth, :).*(depth/1000);
           ret(depth, :) = [ret(depth, cutpoint:n) ret(depth, 1:(cutpoint-1))];
       end
       imagesc(ret);colormap(hot);
       pause(t/f);
   end
end