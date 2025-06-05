%Initial value/condition problem for ODE
%dy/dt = f(y,t) for a ≤ t ≤ b & y(a) = y_0

%Definition: f(y,t) satisfices the Lipshitz's condition for y in D ε R^2 if
%there's a constant L > 0 that:
%               |f(y_1,t)-f(y_2,t)| ≤ L|y_1-y_2|
%For every (y_1,t)&(y_2,t) in D. L is called the Lipshitz's constant for y
%Theorem: Being f(y_n,t) convex in D ε R^2. If L > 0 there's:
%               |δf(y,t)/δy| ≤ L for (y,t) ε D
%therefore f(y,t) satisfices the Lipshitz's condition in D
%Theorem: Supose D {(y,t)| a ≤ t ≤ b & -∞ < y < ∞}
%If f is continous y satifices the Lipshitz's condition in y for D, therefore the initial
% value problem dy/dt = f(y,t), for a ≤ t ≤ b, y(a) = y_0 is well planted

%Euler's Method:
%dy/dt = f(y,t), a ≤ t ≤ b, y(a) = y_0
%t_i = a + ih, with h = (b-a)/N
%for y(t_i+1) = y(t_i) + y'(t_i)(t_i+1 - t_i) + y''(ξ_i)(t_i+1 - t_i)^2/2
%y(t_i+1) = y(t_i) + h*y'(t_i) + y''(ξ_i)*h^2/2
%y(t_i+1) = y(t_i) h*f(y(t_i),t_i)

%Example 1: dy/dt = t*exp(3t) - 2y, 0 ≤ t ≤ 1, y(0) = 0
% where R/ y(t) = 1/5 * t*exp(3t) - 1/25 * exp(3t) + 1/25 * exp(2t)

% clearvars;
% 
% ti = 0;
% tf = 1;
% y0 = 0;
% f = @(y,t) t*exp(3*t) - 2*y;
% yf = @(t) (1/5)*t.*exp(3*t) - (1/25)*(exp(3*t) - exp(-2*t));
% 
% N = 10;
% h = (tf - ti)/N;
% t = zeros(N+1,1);
% y = zeros(N+1,1);
% 
% t(1) = ti;
% y(1) = y0;
% 
% for i=1:N
%     t(i+1) = ti + h*i;
%     y(i+1) = y(i) + h*f(y(i),t(i));
% end

% figure(1); 
% plot(t,y,'ob');
% hold on;
% plot(t,yf(t),'.k');
% hold off;
% xlabel('time');
% ylabel('y(t)');
% 
% figure(2);
% semilogy(t,abs(yf(t)- y), 'b');
% xlabel('time');
% ylabel('error');

%Example2: dy/dt = y - t^2 + 1, 0 ≤ t ≤ 2, y(0) = 1/2
%where y(t) = (t + 1)^2 - 1/2 * exp(t)

% clearvars;
% 
% ti = 0;
% tf = 2;
% y0 = 1/2;
% f = @(y,t) y - t^2 + 1;
% yf = @(t) (t + 1).^2 - 1/2 * exp(t);
% 
% N = 10;
% h = (tf - ti)/N;
% t = zeros(N+1,1);
% y = zeros(N+1,1);
% 
% t(1) = ti;
% y(1) = y0;
% 
% for i=1:N
%     t(i+1) = ti + h*i;
%     y(i+1) = y(i) + h*f(y(i),t(i));
% end
% 
% figure(1); 
% plot(t,y,'ob');
% hold on;
% plot(t,yf(t),'.k');
% hold off;
% xlabel('time');
% ylabel('y(t)');
% 
% figure(2);
% semilogy(t,abs(yf(t)- y), 'b');
% xlabel('time');
% ylabel('error');

%Example 3: dy/dt = (2 - 2*t*y)/(t^2 + 1), 0 ≤ t ≤ 1, y(0) = 1
%where y(t) = (2*t + 1)/(t^2 +1)

clearvars;

ti = 0;
tf = 1;
y0 = 1;
f = @(y,t) (2 - 2*t*y)/(t^2 + 1);
yf = @(t) (2*t + 1)./(t.^2 +1);

N = 100;
h = (tf - ti)/N;
t = zeros(N+1,1);
y = zeros(N+1,1);

t(1) = ti;
y(1) = y0;

for i=1:N
    t(i+1) = ti + h*i;
    y(i+1) = y(i) + h*f(y(i),t(i));
end

figure(1); 
plot(t,y,'ob');
hold on;
plot(t,yf(t),'.k');
hold off;
xlabel('time');
ylabel('y(t)');

figure(2);
semilogy(t,abs(yf(t)- y), 'b');
xlabel('time');
ylabel('error');