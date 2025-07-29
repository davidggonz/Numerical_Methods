% clearvars; Clears the workspace

filename = "Data/two_signals.csv"; %Read the signal
A = readmatrix(filename); %Separates data

n = A(:,1); 

dt = 2.0e-9; %We define a dt
t = n*dt;

VC1 = A(:,2); %Channel 1 voltaje
VC2 = A(:,3); %Vhannel 2 voltaje

%Grafication 
figure(1);
plot(t,VC1, 'b');
xlabel("Time (s)");
ylabel("Potential (V)");
grid("on");

figure(2);
plot(t,VC2, 'r');
xlabel("Time (s)");
ylabel("Potential (V)");
grid("on");

%Update of both plots put together
figure(3)
plot(t,VC1, '-g');
hold on;
plot(t,VC2, '-b');
xlabel("Time (s)");
ylabel("Potential (V)");
grid("on");
hold off;



