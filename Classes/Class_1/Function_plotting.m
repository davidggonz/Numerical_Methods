%Plotting of functions in MATLAB

A = 1.0; %Amplitude
phi = pi/2; %Phase
f = 50; %Frecuency (Hz)
w = 2*pi*f; %Omega (rad/s)

t = (0:1e-5:0.1); %Vector time
y1 = A*sin(w*t+phi); %Function to plot
figure(1);
plot(t,y1, '.');
xlabel('Time (s)');
ylabel('Amplitude (m)');
grid("on");

a = -5.0;
b = 10.0;
c = 10.0;
x2 = (-10:0.1:10)';

y2 = a*(x2).^2 + b*x2 + c;

figure(2);
plot(x2,y2,'r');
xlabel('x');
ylabel('y');
ylim([-15,15])

A = 1;
x3 = (-10:0.01:10)';
y3 = (-10:0.01:10)';
[X,Y] = meshgrid(x3,y3);
Z3 = A*exp(-(X.^2 + Y.^2)/50);

figure(3)
h3 = surf(X,Y,Z3, 'FaceAlpha', 0.9);
h3.EdgeColor = 'none';

e = 5/pi;
Z4 = Z3.*cos(X/e).*sin(Y/exp);

figure(4);
h4 = surf(X,Y,Z4, 'FaceAlpha', 0.9);
h4.EdgeColor = 'none';