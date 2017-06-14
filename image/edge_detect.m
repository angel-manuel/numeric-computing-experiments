function [ edge ] = edge_detect( img )
   [j, k] = size(img);

   n = [j 1:j-1];
   e = [2:k 1];
   s = [2:j 1];
   w = [k 1:k-1];

   N = img(n,:) + img(s,:) + img(:,e) + img(:,w) + ...
       img(n,e) + img(n,w) + img(s,e) + img(s,w);
   
   edge = (img.*8)-N;
   max_edge = max(max(edge));
   edge = edge.*(floor(255/max_edge));
end

