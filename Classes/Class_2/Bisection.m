%We define a function of order 3
f = @(x) x.^3 + 4*x.^2 -7;
%We define a vector over the one is going to be plotted
x = (-10:0.1:10)';
%Let's define a figure
figure(1)
plot(x, f(x));
xlabel('x');
ylabel('y = f(x)');
xlim([-5,2]);
grid("on");

%Bisection method

%Let's define an under limit for the first zero
a1 = -4;
%Let's define an upper limit for the first zero
b1 = -3;
%Let's define a tolerance
tol = 1e-8;
%And the steps
N = 100;
%-------------
%First zero
i = 1;
f_a = f(a1);
while i < N
    p = a1 + (b1-a1)/2;
    f_p = f(p);
    if (f_p == 0 || ((b1-a1)/2) < tol)
        break;
    end
    i = i+1;
    if f_a * f_p > 0
        a1 = p;
    else
        b1 = p;
    end
end
%Second zero------------------------
a2 = -2;
b2 = -1;
j = 1;
f_a = f(a2);
while j < N
    p2 = a2 + (b2-a2)/2;
    f_p = f(p2);
    if (f_p == 0 || ((b2-a2)/2) < tol)
        break;
    end
    j = j+1;
    if f_a * f_p > 0
        a2 = p2;
    else
        b2 = p2;
    end
end
%Third zero------------------------
a3 = 1;
b3 = 1.3;
k = 1;
f_a = f(a3);
while j < N
    p3 = a3 + (b3-a3)/2;
    f_p = f(p3);
    if (f_p == 0 || ((b3-a3)/2) < tol)
        break;
    end
    k = k+1;
    if f_a * f_p > 0
        a3 = p3;
    else
        b3 = p3;
    end
end