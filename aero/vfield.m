function [XX, YY, ZZ] = vfield()
%%VFIELD bla bla bla
    u_inf = 1;
    alpha = 0;
    r = 1;
    n = 50;
    dF = @(x, y)((u_inf*exp(-1i*alpha)).*(x+y.*1i + ((r^2)./(x+y.*1i))));
    
    X = linspace(-5*r, 5*r, n);
    Y = X;
    
    [XX, YY] = meshgrid(X, Y);
    
    inside = (XX.^2 + YY.^2) < (r^2);
    
    ZZ = dF(XX, YY);
    ZZ(inside) = 0;
    
    CC = linspace(0, 2*pi, 1000);
    CX = cos(CC);
    CY = sin(CC);
    
    %Líneas de corriente
    figure(1);
    contour(XX, YY, imag(ZZ));
    hold on;
    fill(CX, CY, 'r');
    hold off;
    axis([-5*r 5*r -5*r 5*r]);
    axis square;
    
    %Presiones en el contorno
    %figure(2);
    phi = linspace(0, 2*pi, 50);
    pX = -r*cos(phi);
    pY = r*sin(phi);
    pV = abs(dF(pX, pY));
    Cp = 1 - (pV./u_inf).^2;
    %plot(phi, Cp);
    
    tpX = sum(+cos(phi).*Cp);
    tpY = sum(-sin(phi).*Cp);
    
    figure(2);
    fill(pX, pY, 'r');
    hold on;
    quiver([0, pX], [0, pY], [tpX, cos(phi).*Cp], [tpY, -sin(phi).*Cp]);
    hold off;
    axis([-1.5*r 1.5*r -1.5*r 1.5*r]);
    axis square;
end
