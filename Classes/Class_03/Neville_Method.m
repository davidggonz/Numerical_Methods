%In Neville's Method:
%f(x) = ~= p(x) with p(x) = [(x-xj)Po,P1,...,Pj-1,Pj+1,k -
%(x-xi)Po,P1,...,Pj-1,Pj+1,k]/(xi-xj)

%This would be the k'st Lagrange polynom that interpolls f(x) in the k+1
%points with xo,x1,...,xk

%Example if f(xi) = p(xi) and k = 0
%P(xi) = [(xi-xj)Po(xi) - (xi-xi=0)Po(xi)]/(xi-xj) = Po(xi) = f(xi)

x = (0:0.1:1)'; %We define a column vector 
y = exp(x);

figure(1);
plot(x,y,'ob');
xlabel('x');
ylabel('f(x)');

%--------------------
xt = 0.05;
tol = 1e-3;
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