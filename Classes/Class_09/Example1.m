clearvars;
a = 0;
b = 1;
c = 0;
d = 1;

f = @(x,y) x^2 + y^2;

N = 100;
V = (b-a)*(d-c);

fi = 0;
Fi = zeros(N,1); %Sampling

for i = 1:N
    x = a + (b-a)*rand(1);{+}
    y = c + (d-c)*rand(1);
    fi = fi + f(x,y);
    Fi(i) = f(x,y);

end
sf = fi/N;
I = V*sf;

df = 0;

for i = 1:N
    df = df + (Fi(i)-sf)^2;
end

dI = (V/sqrt(N))*sqrt((1/(N-1))*df);

F = @(x,y) x^3*y/3 + y^3*x/3;

Iexact = F(b,d) - F(a,c);