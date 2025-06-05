clearvars;
% Primer examen parcial Metodos Numericos I
% Primer semestre 2025
% Estudiante David Granados González (C03499)

% Problema 1
disp('Problema 1');
% Definir la función f(x) = tan(x) + tanh(x)
f = @(x) tan(x) + tanh(x);

% Derivada de f(x): f'(x) = sec^2(x) + sech^2(x)
df = @(x) sec(x).^2 + (1 ./ cosh(x)).^2;

% Gráfica
x_vals = linspace(0, 14, 1000);
y_vals = f(x_vals);

tol = 1e-5;
Nmax = 100;
% Puntos semilla
p0 = [0.0, 2.2, 8.5, 11.1]; 
ceros = zeros(size(p0));

% Encontrar ceros
for i = 1:length(p0)
    ceros(i) = Function_Newton_Raphson(f, df, p0(i), tol, Nmax);
end

% Se mostrarán los resultados de la siguiente forma
for i = 1:length(ceros)
    fprintf('Cero %d: x ≈ %.10f, f(x) ≈ %.2e\n', i, ceros(i), f(ceros(i)));
end

% Marcar los ceros encontrados
figure(1);
plot(x_vals, y_vals, 'b', 'LineWidth', 1.5); hold on;
yline(0, 'k--'); % Línea horizontal en y = 0
plot(ceros, f(ceros), 'ro', 'MarkerSize', 8, 'LineWidth', 2);
title('f(x) = tan(x) + tanh(x)');
xlabel('x');
ylabel('f(x)');
grid on;
legend('f(x)', 'Eje x', 'Ceros encontrados');
ylim([-200 300]);
hold off;

% Problema 2
disp('Problema 2');
% Cargar datos del archivo
data = load('supercooled_water.dat');
lambda = data(:,1);    
n_real = data(:,2);    
k_imag = data(:,3);    

% Punto a interpolar
lambda_in = 3.5500;

% Interpolacion usando la función spline
n_in = Interpolacion_Spline(lambda, n_real, lambda_in);
k_in = Interpolacion_Spline(lambda, k_imag, lambda_in);

% Mostrar valores interpolados
fprintf('Para λ = %.4f μm:\n', lambda_in);
fprintf('n(λ) ≈ %.6f (Re)\n', n_in);
fprintf('k(λ) ≈ %.6f (Im)\n', k_in);

% Gráfica con ejes real e imaginario
figure(2);

% Eje izquierdo: n(λ)
yyaxis left
plot(lambda, n_real, 'bo', 'LineWidth', 2); hold on;
plot(lambda_in, n_in, 'ro', 'MarkerSize', 8, 'LineWidth', 2); % Punto interpolado
ylabel('n(\lambda)', 'Color', 'b');
ylim([1.05 1.6]);
set(gca, 'YColor', 'b');

% Eje derecho: k(λ)
yyaxis right
plot(lambda, k_imag, 'ro', 'LineWidth', 1.5, 'MarkerSize', 4); hold on;
% Punto interpolado
plot(lambda_in, k_in, 'b*', 'MarkerSize', 8, 'LineWidth', 2); 
ylabel('k(\lambda)', 'Color', 'r');
ylim([0 0.4]);
set(gca, 'YColor', 'r');
% Eje x
xlabel('\lambda (\mum)');
xlim([2 9]);
% Título y cuadrícula
title('Índice de refracción complejo del agua a 238 K');
grid on;
hold off;

% Problema 3
disp('Problema 3');
% Cargar datos originales
data = load('volumen.dat');
t_or = data(:,1);   % tiempo en minutos
V_or = data(:,2);   % volumen en litros

% Interpolación spline para aumentar la densidad de puntos en los datos
% originales
delta_t = 1e-3;
t_fine = (t_or(1):delta_t:t_or(end))';  % vector densamente muestreado
V_fine = Interpolacion_Spline(t_or, V_or, t_fine); % volumen interpolado

% Derivacion numerica usando el metodo de los 5 puntos
Q = derivacion_5puntos(t_fine, V_fine, delta_t);    % flujo = dV/dt

% Gráfica comparativa
figure(3);

% Eje izquierdo: volumen
yyaxis left
plot(t_fine, V_fine, 'b-', 'LineWidth', 2); 
hold on;
ylabel('Volumen V(t) [litros]');
set(gca, 'YColor', 'b');

% Eje derecho: flujo
yyaxis right
plot(t_fine, Q, 'm--', 'LineWidth', 2);
ylabel('Flujo Q(t) [litros/min]');
set(gca, 'YColor', 'm');

xlabel('Tiempo (min)');
title('Evolución del volumen y flujo (\delta t = 1e^{-3} min)');
grid on;
legend('Volumen V(t)', 'Flujo Q(t)', 'Location', 'northwest');
hold off;

% Problema 4
disp('Problema 4');
g = @(x) 2 * sqrt(pi) * (exp(-x.^2) + exp(-(x - 2).^2));

% Intervalo de integración
a = -3;
b = 6;

% Número de particiones
n = 100; 

% Calculo de la integral usando el metodo Simpson
I = I_Simpson(g, a, b, n);

% Integral exacta con función de MATLAB
I_exacto = integral(g, a, b);

% Calcular error absoluto
error_abs = abs(I - I_exacto);

% Mostrar resultados
fprintf('Valor por Simpson       : %.10f\n', I);
fprintf('Valor exacto (integral) : %.10f\n', I_exacto);
fprintf('Error absoluto          : %.2e\n', error_abs);