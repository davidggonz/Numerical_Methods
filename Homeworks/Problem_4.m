%Parte 1)
A = readmatrix('PTC_Thermistor_1K.dat');
Temperature = A(:,1); %Valores de la temperatura
Resistance = A(:,2); %Valores de la resistencia
%Valores de resistencia para averiguar su correspondiente en resistencia
R1 = 36;
R2 = 900;
R3 = 10000;
%Interpolación para cada caso
C_Lagrange1 = Lagrange_Interpolation(Resistance,Temperature, R1);
C_Lagrange2 = Lagrange_Interpolation(Resistance, Temperature, R2);
C_Lagrange3 = Lagrange_Interpolation(Resistance,Temperature, R3);

%----------------------------------------
%Parte a) ¿Qué resultados obtuvo?
%R/ Se obtuvieron los siguientes resultados:
% Para R = 36Ω se obtuvo una temperatura de 123°C
% Para R = 900Ω se obtuvo una temperatura de 4.27e+07
% Para R = 10000Ω se obtuvo una temperatura de 5.66e+24

%----------------------------------------
%Parte b) ¿Cómo explica los resultados obtenidos?
%R/ Esto puede ser porque cuando se utiliza un polinomio de grado muy alto
%para la interpolación, puede ocurrir un fenómeno conocido como el fenómeno
%de Runge. Donde aunque puede coincidir en un intervalo, también abran
%oscilaciones excesivas entre pares de datos.

