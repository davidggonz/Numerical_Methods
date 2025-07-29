%If p is a fixated point for a function and if g(p) = p
%Is needed to define a functon 'g' with a fixated point p in the way that
%g(x) = x - f(x) so f(x) = x - g(x)
%In that way f(p) = p - g(p) = 0
%With x^3 + 4x^2 - 7 = 0
%x(x^2 + 4x) = 7 -> x = 7/(x^2 + 4x)

%--Theorem--%
%i) If g ε [a,b] & g(x) ε [a,b] for every x in [a,b] then g(x) has at least
%1 fixated point in [a,b]
%ii) If g'(x) ε in [a,b] & a constant k < 1 exist with the condition:
%|g'(x)| =< k for every x ε [a,b], then exist exactly 1 fixated point in
%[a,b]
%-----------%

%First we calculate the zeros:
x = (-10:0.1:10)';
%We define g(x)
g = @(x) 7./(x.^2 + 4*x);
%Then the derivative
dg = @(x) -((7*(2*x + 4))./(x.^2 +4*x).^2);
%Then, we plot
figure(1);
plot(x,g(x),'b');
hold on;
plot(x,dg(x),'r');
hold off;
ylim([-15,15])
grid("on")

%Now we use the theorem
i = 1;
N = 100;
p0 = -1.8; %This point works because its derivative in it is < 0
tol = 1e-8;
while i < N
    p = g(p0);
    if abs(p-p0) < tol
        break;
    end
    i = i+1;
    p0 = p;
end

