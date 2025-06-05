function dy = derivacion_5puntos(x, y, h)
    % 1) Validaciones iniciales
    x = x(:);  y = y(:);
    n = numel(x);
    assert(n >= 6, 'Se requieren al menos 6 puntos.');
    assert(all(abs(diff(x) - h) < 1e-6), 'El espaciado h no es uniforme.');

    dy = zeros(n,1);

    % 2) Fórmulas adelantadas (forward) en i=1 y i=2
    % i=1:
    dy(1) = (-25*y(1) + 48*y(2) - 36*y(3) + 16*y(4) - 3*y(5)) / (12*h);
    % i=2:
    dy(2) = ( -3*y(1) - 10*y(2) + 18*y(3) - 6*y(4) +  y(5)) / (12*h);

    % 3) Fórmulas centradas en i=3 .. n-2
    for i = 3 : n-2
        % esquema centrado de cinco puntos:
        %   (y_{i-2} - 8 y_{i-1} + 8 y_{i+1} - y_{i+2})/(12 h)
        dy(i) = ( y(i-2) - 8*y(i-1) + 8*y(i+1) - y(i+2) ) / (12*h);
    end

    % 4) Fórmulas retardadas (backward) en i=n-1 y i=n
    % i = n-1:
    dy(n-1) = (  y(n-4) - 6*y(n-3) + 18*y(n-2) - 10*y(n-1) + 3*y(n) ) ...
               / (12*h);
    % i = n:
    dy(n)   = (  3*y(n-4) - 16*y(n-3) + 36*y(n-2) - 48*y(n-1) + 25*y(n) ) ...
               / (12*h);
end
