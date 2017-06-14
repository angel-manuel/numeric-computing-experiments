function chimenea(n, m, l, t)
   f = t*10;
   pause on;
   a_0 = zeros(1, l);
   d = zeros(1, l);
   for llama=1:l
       a_0(llama) = rand()*2*pi;
       d(llama) = fix(n*rand());
   end
   for ang=linspace(0, 2*pi*t, f);
       tot = zeros(n, n);
       for llama=1:l
           ret = zeros(n, n);
           for i=1:m
               x = 1;
               for depth=1:n
                   ret(depth, x) = ret(depth, x) + 1;
                   x = x + round(rand()+0.5*sin((2*pi*depth/n)+ang+a_0(llama)));
               end
           end
           for depth=1:n
               cutpoint = mod(fix(depth+((n-depth)/2)) + d(llama), n)+1;
               ret(depth, :) = ret(depth, :).*(depth/1000);
               ret(depth, :) = [ret(depth, cutpoint:n) ret(depth, 1:(cutpoint-1))];
           end
           tot = tot + ret;
       end
       imagesc(tot);colormap(hot);
       pause(t/f);
   end
end