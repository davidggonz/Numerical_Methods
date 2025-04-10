function [yt, yreal] = Neville(x, y, xt, tol)
%Let's define a matrix 11x11 full or zeros
Q = zeros(size(x,1), size(x,1));
%Let's full the first column with all y values
Q(:,1) = y(:);
%Then we start Neville's method (It adapts to the size of vector x)
for i = 2:size(x,1)
    for j = 2:i
        Q(i,j) = ((xt-x(i-j+1))*Q(i,j-1)-(xt-x(i))*Q(i-1,j-1))/(x(i)-x(i-j+1));
    end
    if abs(Q(i,i) - Q(i-1,j-1)) <= tol
        break;
    end
end
yt = Q(i,j);
yreal = exp(xt);