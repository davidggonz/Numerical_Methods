% Fixated charges
clearvars;
e = 1.60217662e-19;
m = 9.10938356e-31;
epsilon0 = 8.8541868128e-12;

n = -1;
q = n*e;
r0 = [0,0,0];
v0 = [0,0,0];

n = 1;
q1 = n*e;
r1 = [0.1,-0.1,0];

n = 2;
q2 = n*e;
r2 = [0.2,-0.1,0];

n = 3;
q3 = n*e;
r3 = [0.2,-0.2,1];

n = 4;
q4 = n*e;
r4 = [0.2,-0.4,-1.0];

figure(1)
plot3(r0(1), r0(2), r0(3), 'o', 'Color','g', 'MarkerFaceColor','k');
hold on;
plot3(r1(1), r1(2), r1(3), 'o', 'Color','b', 'MarkerFaceColor','b');
plot3(r2(1), r2(2), r2(3), 'o', 'Color','r', 'MarkerFaceColor','r');
plot3(r3(1), r3(2), r3(3), 'o', 'Color','r', 'MarkerFaceColor','r');
plot3(r4(1), r4(2), r4(3), 'o', 'Color','r', 'MarkerFaceColor','r');
hold off;
grid on;
xlabel('x(m)');
ylabel('y(m)');
zlabel('z(m)');
text(r1(1),r1(2),r1(3), '\leftarrow q_1');
text(r2(1),r2(2),r2(3), '\leftarrow q_2');
text(r3(1),r3(2),r3(3), '\leftarrow q_3');
text(r4(1),r4(2),r4(3), '\leftarrow q_4');

% Electric field of every fixated particle
E1 = @(r) (1/(4*pi*epsilon0))*q1*(r-r1)/(dot((r-r1),(r-r1)))^(3/2);
E2 = @(r) (1/(4*pi*epsilon0))*q2*(r-r2)/(dot((r-r2),(r-r2)))^(3/2);
E3 = @(r) (1/(4*pi*epsilon0))*q3*(r-r3)/(dot((r-r3),(r-r3)))^(3/2);
E4 = @(r) (1/(4*pi*epsilon0))*q4*(r-r4)/(dot((r-r4),(r-r4)))^(3/2);

%Its defined the acceleration function
f = @(r) (q/m)*(E1(r));
g = @(v) v;

%Simulation parameters
t0 = 0;
tn = 0.135;
N = 10000;
h = (tn-t0)/n;
tol = 3e-1;
hmax = h;
hmin = h/40;
t = t0;
r = r0;
flag = 1;
ti = t0;
vi = v0;
ri = r0;

while flag==1
    kv1 = h*f(ri);
    kv2 = h*f(ri + (1/4)*kv1);
    kv3 = h*f(ri + (3/32)*kv1 + (9/32)*kv2);
    kv4 = h*f(ri + (1932/2197)*kv1 - (7200/2197)*kv2 + (7296/2197)*kv3);
    kv5 = h*f(ri + (439/216)*kv1 - (8)*kv2 + (3680/513)*kv3 - (845/4104)*kv4);
    kv6 = h*f(ri - (8/27)*kv1 + (2)*kv2 - (3544/2565)*kv3 + (1859/4104)*kv4 - (11/40)*kv5);

    v4 = vi + (25/216)*kv1 + (1408/2565)*kv3 + (2197/4104)*kv4 -(1/5)*kv5;
    v5 = vi + (16/135)*kv1 + (6656/12825)*kv3 + (28561/-56430)*kv4 - (9/50)*kv5 + (2/55)*kv6;

    Rv = (1/h)*norm(v5-v4);
    vi = v4;

    kr1 = h*g(vi);
    kr2 = h*g(vi + (1/4)*kr1);
    kr3 = h*g(vi + (3/32)*kr1 + (9/32)*kr2);
    kr4 = h*g(vi + (1932/2197)*kr1 - (7200/2197)*kr2 + (7296/2197)*kr3);
    kr5 = h*g(vi + (439/216)*kr1 - (8)*kr2 + (3680/513)*kr3 - (845/4104)*kr4);
    kr6 = h*g(vi - (8/27)*kr1 + (2)*kr2 - (3544/2565)*kr3 + (1859/4104)*kr4 - (11/40)*kr5);

    r4 = ri + (25/216)*kr1 + (1408/2565)*kr3 + (2197/4104)*kr4 -(1/5)*kr5;
    r5 = ri + (16/135)*kr1 + (6656/12825)*kr3 + (28561/-56430)*kr4 - (9/50)*kr5 + (2/55)*kr6;
    
    if Rv <= tol
        ti = ti + h;
        t = [t;ti];
        r = [r;r4];
        ri = r4;
    end

    delta = 0.84*(tol/Rv)^(1/4);

    if delta <= 0.1
        h = 0.1*h;
    elseif delta >= 4
        h = 4*h;
    else 
        h = delta*h;
    end

    if h > hmax
        h = hmax;
    end

    if ti >= tn
        break;
    elseif ti+h > tn
        h = tn-ti;
    elseif h < hmin 
        break;
    end
end

figure(2);
plot3(r0(1), r0(2), r0(3), 'o', 'Color','g', 'MarkerFaceColor','k');
hold on;
plot3(r1(1), r1(2), r1(3), 'o', 'Color','b', 'MarkerFaceColor','b');
plot3(r2(1), r2(2), r2(3), 'o', 'Color','r', 'MarkerFaceColor','r');
plot3(r3(1), r3(2), r3(3), 'o', 'Color','r', 'MarkerFaceColor','r');
plot3(r4(1), r4(2), r4(3), 'o', 'Color','r', 'MarkerFaceColor','r');
plot3(r(:,1), r(:,2), r(:,3), '.', 'Color','k');
plot3(r(end,1), r(end,2), r(end,3), 'o', 'Color', 'g', 'MarkerFaceColor','k')
hold off;
grid on;
xlabel('x(m)');
ylabel('y(m)');
zlabel('z(m)');
text(r1(1),r1(2),r1(3), '\leftarrow q_1');
text(r2(1),r2(2),r2(3), '\leftarrow q_2');
text(r3(1),r3(2),r3(3), '\leftarrow q_3');
text(r4(1),r4(2),r4(3), '\leftarrow q_4');
