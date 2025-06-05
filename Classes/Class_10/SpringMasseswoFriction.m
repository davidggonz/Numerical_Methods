clearvars;

%F = -kx, 0 ≤ t ≤ 2, x(0) = 0.01m, k = 2N/m
%a = d^2x/dt^2 = -kx/m

ti = 0; %seconds
tf = 2; %seconds
x0 = 0.01; %meters
v0 = 0; %meters/second
k = 2.0; %Newtons/meter
m = 0.01; %kilograms

f = @(x) -(k/m)*x;
%g = @(v) v;

N = 1000;
h = (tf-ti)/N;
t = zeros(N+1,1);
x = zeros(N+1,1);
v = zeros(N+1,1);

x(1) = x0;
v(1) = v0;
t(1) = ti;

for i=1:N
    t(i+1) = ti + i*h;
    v(i+1) = v(i) + h*f(x(i));
    x(i+1) = x(i) + h*v(i);
end

xf = @(t) x0*cos(sqrt(k/m)*t);

figure(1);
plot(t,xf(t), '.k');
hold on;
plot(t,x,'or');
hold off;
xlabel('time');
ylabel('x(t)');

figure(2);
semilogy(t, abs(xf(t)-x),'b');
xlabel('time');
ylabel('error');

