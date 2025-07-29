% Lagrange interpolation example with visualization
clear; clc; close all;

% Example data (function 1/x)
x = linspace(1, 10, 5)';  % 5 equally spaced nodes
y = 1 ./ x;

% Point to interpolate
xt = 5.5;

% Call Lagrange function
[yt, Lk] = Lagrange(x, y, xt);

% Plot 1: Real function vs interpolation
xx = linspace(1, 10, 100)';  % Dense points for real curve
yy_real = 1 ./ xx;
yy_interp = zeros(size(xx));

for i = 1:length(xx)
    yy_interp(i) = Lagrange(x, y, xx(i));
end

figure(1);
plot(xx, yy_real, 'b-', 'LineWidth', 2, 'DisplayName', '1/x (real)');
hold on;
plot(xx, yy_interp, 'r--', 'LineWidth', 1.5, 'DisplayName', 'Interpolation');
plot(x, y, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k', 'DisplayName', 'Nodes');
plot(xt, yt, 'gs', 'MarkerSize', 10, 'MarkerFaceColor', 'g', 'DisplayName', 'Interpolated point');
xlabel('x');
ylabel('y');
title('Lagrange Interpolation vs Real Function');
legend('show');
grid on;

% Plot 2: Lagrange coefficients Lk(x) for xt
figure(2);
stem(x, Lk, 'filled', 'LineWidth', 1.5);
xlabel('Nodes x_k');
ylabel('L_k(x_t)');
title('Lagrange Coefficients at x_t');
grid on;

% Display results in console
fprintf('Real value at xt=%.2f: y=%.4f\n', xt, 1/xt);
fprintf('Interpolated value at xt=%.2f: yt=%.4f\n', xt, yt);
fprintf('Absolute error: %.4f\n', abs(1/xt - yt));