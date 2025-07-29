clear; clc; close all;

% Cargar datos
data = readmatrix('absortion_of_pure_water_300_to_800_nm_s.txt', ...
                 'NumHeaderLines', 3);
lambda = data(:,1);  % Longitud de onda (nm)
k = data(:,2);       % Coeficiente de absorción (1/cm)

% Seleccionar 10 puntos equidistantes para interpolación
num_points = 10;
lambdat = linspace(300, 800, num_points)';
epsilon = 1e-4;

% Pre-alocar resultados
results = table(lambdat, 'VariableNames', {'Wavelength'});
results.Lagrange = zeros(num_points, 1);
results.Neville = zeros(num_points, 1);

% Calcular interpolaciones
for i = 1:num_points
    results.Lagrange(i) = Lagrange_Approximation(lambda, k, lambdat(i));
    results.Neville(i) = Neuville_interpolation(lambda, k, lambdat(i), epsilon);
end

% Visualización compacta
figure('Name', 'Comparación de Interpolación', 'Color', 'white', ...
       'Position', [100 100 1000 600]);

% Gráfico principal
subplot(2,1,1);
plot(lambda, k, 'o', 'Color', [0.2 0.6 0.2], 'MarkerSize', 5, ...
     'DisplayName', 'Datos originales');
hold on;
plot(results.Wavelength, results.Lagrange, 's', 'MarkerSize', 8, ...
     'MarkerFaceColor', [0.8 0.2 0.2], 'DisplayName', 'Lagrange');
plot(results.Wavelength, results.Neville, 'd', 'MarkerSize', 8, ...
     'MarkerFaceColor', [0.2 0.2 0.8], 'DisplayName', 'Neville');
xlabel('Longitud de onda (nm)');
ylabel('Absorción (1/cm)');
title('Comparación en 10 puntos equidistantes');
legend('Location', 'northwest');
grid on;

% Gráfico de diferencias
subplot(2,1,2);
bar(results.Wavelength, abs(results.Lagrange - results.Neville), ...
    'FaceColor', [0.9 0.6 0]);
xlabel('Longitud de onda (nm)');
ylabel('Diferencia absoluta');
title('Error entre métodos');
grid on;

% Mostrar tabla de resultados
disp('Resultados de interpolación:');
disp(results);

% Función para mostrar detalles en puntos seleccionados
fprintf('\nDetalles en puntos clave:\n');
fprintf('| %-12s | %-12s | %-12s | %-12s |\n', ...
        'λ (nm)', 'Lagrange', 'Neville', 'Diferencia');
fprintf('|--------------|--------------|--------------|--------------|\n');
for i = [1, round(num_points/2), num_points]
    fprintf('| %-12.1f | %-12.2e | %-12.2e | %-12.2e |\n', ...
            results.Wavelength(i), ...
            results.Lagrange(i), ...
            results.Neville(i), ...
            abs(results.Lagrange(i)-results.Neville(i)));
end