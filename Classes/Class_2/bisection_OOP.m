%Now we define it in a OOP way
function [p,i] = bisection_OOP(f,a,b, tol, N)
i = 1;
f_a = f(a);
while i < N
    p = a + (b-a)/2;
    f_p = f(p);
    if (f_p == 0 || ((b-a)/2) < tol)
        break;
    end
    i = i+1;
    if f_a * f_p > 0
        a = p;
    else
        b = p;
    end
end
end