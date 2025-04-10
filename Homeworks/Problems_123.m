%Problema 1:
%Definimos las funciones a utilizar
f_x = @(x) 3*x - exp(x);
g_x = @(x) 2*x + 3*cos(x) - exp(x);
h_x = @(x) x.^2 - 4*x + 4 - log(x);

%Para f:
[p1_f1,i1_f1] = Bisection(f_x,0,1,1e-5, 100); 
%Para g:
[p1_g2,i1_g2] = Bisection(g_x,0,1,1e-5, 100); 
%Para h:
%h. Parte 1 
[p1_h1,i1_h1] = Bisection(h_x,1,2,1e-5, 100);
%h. Parte 2
[p1_h2,i1_h2] = Bisection(h_x,2,4,1e-5, 100);

%---------------------------------------------------
%Problema 2:
a_x = @(x) 2 + sin(x) - x;
b_x = @(x) 3*x.^2 - exp(x); %Se repite por lo que se omite su reescritura
c_x = @(x) x.^3 - 2*x - 5;
d_x = @(x) x - cos(x);
%Se plantean sus respectivas derivadas para analizar su gráfica y obtener
%p0's adecuados ya que sus derivadas |dx(p0)| <= 1
da = @(x) cos(x) - 1;
db = @(x) 6*x - exp(x);
dc = @(x) 3*x.^2 - 2;
dd = @(x) 1 + sin(x);
% %Proceso de graficación: (Este se hizo para buscar p0's que puedan funcionar)
% x1 = (2:0.1:3)';
%plot(x1,da(x),'r'); Cualquier punto funciona porque toda es negativa en [2,3]
%plot(x,db(x),'r'); Cualquier punto funciona porque toda es negativa
%plot(x1,dc(x),'r'); [-0.9, ..., 0.9]
%plot(x,dd(x),'r'); [-9.4, -6.3, -3.1, -0.1, 3.2, ...]

%----------------------------------------------------
%Problema 3:
tol3 = 1e-6;
%Se plantean las funciones a utilizar
i_x = @(x) exp(x) - 2^(-x) + 2*cos(x) - 6;
j_x = @(x) 2*x*cos(2*x) - (x - 2).^2;
k_x = @(x) (x - 2).^2 - log(x);
l_x = @(x) sin(x) - exp(-x);

%Se hace su derivada
di = @(x) exp(x) + log(2)*2^(-x) - 2*sin(x);
dj = @(x) 2*cos(2*x) - 4*x*sin(2*x)  - 2*x + 4;
dk = @(x) 2*(x - 2) - 1./x;
dl = @(x) cos(x) - exp(-x);

%Para i:
[p3_i,i3_i] = Newton_Raphson(i_x,di,1.5,1e-6,100); %1.94
%Para j:
%j. Parte 1
[p3_j1,i3_j1] = Newton_Raphson(j_x,dj,2.5,tol3,100); %2.37
%j. Parte 2
[p3_j2,i3_j2] = Newton_Raphson(j_x,dj,3.5,tol3,100); %3.72
%Para k:
%k. Parte 1
[p3_k1,i3_k1] = Newton_Raphson(k_x,dk,1.5,tol3,100); %1.41
%k. Parte 2
[p3_k2,i3_k2] = Newton_Raphson(k_x,dk,2.71,tol3,100); %3.05
%Para l
%l. Parte 1
[p3_l1,i3_l1] = Newton_Raphson(l_x,dl,0.5,tol3,100); %
%l. Parte 2
[p3_l2,i3_l2] = Newton_Raphson(l_x,dl,3.1,tol3,100); %3.09
%l. Parte 3
[p3_l3,i3_l3] = Newton_Raphson(l_x,dl,6.3,tol3,100); %6.28

