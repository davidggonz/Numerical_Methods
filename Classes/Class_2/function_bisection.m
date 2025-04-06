%We define a function of order 3
f = @(x) x.^3 + 4*x.^2 -7;
%We define a vector over the one is going to be plotted
x = (-10:0.1:10)';
%Let's define a figure
figure(1)
plot(x, f(x));
xlabel('x');
ylabel('y = f(x)');
xlim([-5,2]);
grid("on");

[p,i] = bisection_OOP(f,-4,-3,1e-8, 100);