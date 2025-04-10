function [p,i] = FixatedPoint(g, p0, tol, N)
i = 1;
while i <= N
    p = g(p0);
    if abs(p-p0) < tol
        break;
    end
    i = i+1;
    p0 = p;
end
