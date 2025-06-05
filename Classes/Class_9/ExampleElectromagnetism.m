clearvars;

d = 0.0005; %Cable diameter
R = 0.01; %Coil radius

mu0 = 4*pi*1e-7;
er = @(theta) [cos(theta),sin(theta),0];
erp = @(thetap) [cos(thetap), sin(thetap),0];

f = @(r, theta, thetap) (R-r)*r/(r^2 + R^2 - 2*r*R*dot(er(theta), erp(thetap)))^(3/2);

N = 5000000;
V = (R-d)*(pi/2)*(pi/2);
fi = 0;
Fi = zeros(N,1);


for i=1:N
    r = (R-d)*sqrt(rand(1));
    theta = (pi/2)*rand(1);
    thetap = (pi/2)*rand(1);
    fi = fi + f(r, theta, thetap);
    Fi(i) = f(r, theta, thetap);
end

sf = (1/N) * fi;
I = V * sf;
L = 16 * ((mu0*R)/(4*pi)) * I;

df = 0;
for i=1:N
    df = (Fi(i) -sf)^2;
end
dI = (V/sqrt(N))*sqrt((1/N-1)*df);
dL = 16*(mu0*R/(4*pi))*dI;

disp(['L = ', num2str(L/1e-9),' nH ', '+- ', num2str(dL/1e-9), ' nH'])
