%Runge-Kutta 4
clearvars;
%dy/dt = f(t,y), a ≤ t ≤ b & y(0) = y0
%Coefficients
% k1 = h*f(ti, yi-1)
% k2 = h*f(ti-1 + h/2, yi-1 + k1/2)
% k3 = h*f(ti-1 + h/2, yi-1 + k2/2)
% k4 = h*f(ti-1, yi-1 +k3)
% yi = yi-1 + 1/6*[k1 + 2k2 + 2k3 + k4]

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

for i = 1:N
    t(i+1) = ti + i*h;
    kv1 = h*(f(x(i)));
    kv2 = h*(f(x(i) + kv1/2));
    kv3 = h*(f(x(i) + kv2/2));
    kv4 = h*(f(x(i) + kv3));
    v(i+1) = v(i) + (1/6)*(kv1 + 2*kv2 + 2*kv3 + kv4);

    kx1 = h*(v(i));
    kx2 = h*(v(i) + kx1/2);
    kx3 = h*(v(i) + kx2/2);
    kx4 = h*(v(i) + kx3);
    x(i+1) = x(i) + (1/6)*(kx1 + 2*kx2 + 2*kx3 + kx4);
end

xrk4 = x;
xf = @(t) x0*cos(sqrt(k/m)*t);

figure(1);
plot(t, xrk4, 'or');

figure(2);
semilogy(t, abs(xf(t) - xrk4), 'b');