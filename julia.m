function [esc] = julia(z0, x0, x1, y0, y1)
    [XX, YY] = meshgrid(linspace(x0, x1, 1366), linspace(y0, y1, 768));
    Z = XX+YY.*1i;
    esc = zeros(size(Z, 1),size(Z, 2));
    it=1;
    while(any(esc(:)==0))
        Z = (Z.^2)+z0;
        A = abs(Z(:));
        C = (esc(:)==0)&(A>2|A<eps);
        esc(C)=it;
        it=it+1;
    end
end