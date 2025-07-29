function [yt, L_k] = Lagrange_Approximation(x, y, xt)
% LAGRANGE_APPROXIMATION - Performs Lagrange interpolation
% Inputs:
%   x: Vector of known x-values (nodes)
%   y: Vector of known y-values (function at nodes)
%   xt: Point to interpolate
% Outputs:
%   yt: Interpolated value at xt
%   L_k: Lagrange basis polynomials

% Calculate Lagrange basis polynomials
L_k = zeros(size(x));
for k = 1:length(x)
    L = 1;
    for i = 1:length(x)
        if i ~= k
            L = L * (xt - x(i))/(x(k) - x(i));
        end
    end
    L_k(k) = L;
end

% Calculate interpolated value
yt = sum(y .* L_k);

% Visualization
figure('Name', 'Lagrange Interpolation', 'Color', 'white');
subplot(2,1,1);
plot(x, y, 'o', 'MarkerSize', 8, 'MarkerFaceColor', [0 0.5 0.8], ...
    'DisplayName', 'Data points');
hold on;
plot(xt, yt, 's', 'MarkerSize', 10, 'MarkerFaceColor', [0.8 0.2 0.2], ...
    'DisplayName', 'Interpolated point');
xlabel('x');
ylabel('y');
title('Function Approximation');
legend('show', 'Location', 'best');
grid on;

subplot(2,1,2);
stem(x, L_k, 'filled', 'Color', [0.6 0.2 0.8], 'LineWidth', 1.5, ...
    'DisplayName', 'Lagrange coefficients');
xlabel('x');
ylabel('L_k(x)');
title('Lagrange Basis Polynomials');
grid on;
end