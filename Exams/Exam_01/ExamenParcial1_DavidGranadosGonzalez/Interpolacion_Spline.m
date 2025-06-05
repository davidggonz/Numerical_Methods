function yt = interpolacion_spline(x, y, xt)
%**************************************************************************
% Interpolación spline
% La funcion interpola los valores de la función
% Entradas:
% x: vector de abscisas (n×1 o 1×n)
% y: vector de ordenadas  (n×1 o 1×n), correspondientes a x
% xt: uno o varios puntos donde queremos interpolar (vector o escalar)
% Salida:
% yt: valores interpolados en cada elemento de xt
%**************************************************************************

    %% 1) Preparar datos de entrada
    x = x(:);         % forzar columna
    y = y(:);         % forzar columna
    n = numel(x);
    if n < 2
        error('Se requieren al menos dos puntos (x,y).')
    end

    %% 2) Coeficientes a(i) = y(i)
    a = y;

    %% 3) Intervalos h(i) = x(i+1) - x(i)
    h = diff(x);      % longitud de cada subintervalo, tamaño (n-1)×1

    %% 4) Montar sistema tridiagonal A*c = g para las segundas derivadas c
    A = zeros(n,n);
    g = zeros(n,1);

    % Condiciones naturales: c(1)=0 y c(n)=0
    A(1,1) = 1;    g(1)   = 0;
    A(n,n) = 1;    g(n)   = 0;

    % Rellenar filas 2..n-1
    for i = 2:n-1
        A(i,i-1) = h(i-1);
        A(i,i)   = 2*(h(i-1) + h(i));
        A(i,i+1) = h(i);
        g(i)     = 3*( (a(i+1)-a(i))/h(i) - (a(i)-a(i-1))/h(i-1) );
    end

    % Resolver para c
    c = A \ g;

    %% 5) Calcular coeficientes b y d en cada subintervalo
    b = zeros(n-1,1);
    d = zeros(n-1,1);
    for i = 1:n-1
        b(i) = (a(i+1)-a(i)) / h(i) ...
               - (h(i)/3)*(2*c(i) + c(i+1));
        d(i) = (c(i+1) - c(i)) / (3*h(i));
    end

    %% 6) Interpolar en cada punto xt(k)
    xt_vec   = xt(:);            % forzar vector columna
    m        = numel(xt_vec);
    yt_vec   = zeros(m,1);

    for k = 1:m
        xk = xt_vec(k);  % tratar cada punto por separado

        % 6.1) Comprobar rango
        if xk < x(1) || xk > x(n)
            error('Punto xt = %g fuera del rango [%g, %g].', xk, x(1), x(n));
        end

        % 6.2) Encontrar subintervalo j: x(j) ≤ xk ≤ x(j+1)
        j = find(x <= xk, 1, 'last');
        if j == n
            j = n-1;  % caso límite xk == x(n)
        end

        % 6.3) Evaluar spline cúbica
        dx        = xk - x(j);
        yt_vec(k) = a(j) + b(j)*dx + c(j)*dx^2 + d(j)*dx^3;
    end

    %% 7) Devolver en la misma forma que xt de entrada
    yt = reshape(yt_vec, size(xt));
end

