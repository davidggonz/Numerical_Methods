function yt = Lagrange_Interpolation(x, y, xt)
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