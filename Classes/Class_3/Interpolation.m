%Let's do Interpolation using Lagrange Polynoms

%Consider the 
%P(x) = Lo(x)f(x0) + L1(x)f(x1)
%Where
%Lo(x) = x-x1/x0-x1 & L1 = x-x0/x1-x0
%If x = x0: Lo = x0-x1/x0-x1 = 1
%L1 = 0
%P(x0) = f(x0) = y0
%Using (x0,f(x0)), (x1,f(x1)), ..., (xn,f(xn))

%Using k = 0,1,...,n
%(x-x0)(x-x1)...(x-xk-1)(x-xk+1)...(x-xn)
%Ln,k(x) = [(x-x0)...(x-xk-1)(x-xk+1)...(x-xn)]/[(xk-x0)...(xk-xk-1)(xk-xk+1)...(xk-xn)]
%f(xk) = p(xk) for k = 0,1,...,n
%p(x) = f(x0)Lk,0(x)+... and then it becomes a sum

x = (1:0.1:100)'; 
y = 1./x;

figure(1)
plot(x,y,'ob');
grid("on")
xlabel('x');
ylabel('f(x)')

%---------------------------------
xt = 50.2515897; %Random value that we want to find using interpolation
%Let's find the Lagrange coeffients first
Lk = zeros(size(x));
L = 1;
for k = 1:size(x,1)
    for i = 1:size(x,1)
        if x(i)~=x(k)
            Lt = (xt-x(i))/(x(k)-x(i));
            L = L*Lt;
        end
    end
    Lk(k) = L;
    L = 1;
end

yt = 0;

for i = 1:size(x,1)
    yt = y(i)*Lk(i) + yt;
end

error = (1/xt-yt);

figure(2)
plot(x,Lk,'g')
xlim([40,60])