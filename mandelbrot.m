function [esc] = mandelbrot(varargin)
    if(nargin>=1)
        dim = varargin{1};
        x0 = min(dim(1:2));
        x1 = max(dim(1:2));
        y0 = min(dim(3:4));
        y1 = max(dim(3:4));
    else
        error(message('mandelbrot:NotEnoughInputs'));
    end
    
    if nargin>=2
        res = varargin{2};
        xres = res(1);
        yres = res(2);
    else
        xres = 600;
        yres = 600;
    end
    
    if nargin>=3
        it_max = varargin{3};
    else
        it_max = 128;
    end
    
    [XX, YY] = meshgrid(linspace(x0, x1, xres), linspace(y0, y1, yres));
    C = XX+YY.*1i;
    esc = zeros(size(C, 1),size(C, 2));
    Z = zeros(size(C, 1),size(C, 2));
    it=1;
    while it<it_max && any(esc(:)==0)
        Z = (Z.^2)+C;
        A = abs(Z(:));
        out = (esc(:)==0)&(A>2);
        esc(out)=it;
        it=it+1;
    end
    out = (esc(:)==0)&(A>2|A<eps);
    esc(out)=it;
    
    imagesc([x0 x1],[y0 y1],1./esc);colormap(jet(128));
end