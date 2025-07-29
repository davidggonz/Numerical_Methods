function [yt, Lk] = Lagrange(x, y, xt)
% Lagrange interpolation for a given point xt
% Inputs:
%   x: vector of known nodes (x-values)
%   y: vector of known function values (y-values)
%   xt: point to interpolate
% Outputs:
%   yt: interpolated value at xt
%   Lk: Lagrange coefficients (optional)

    n = length(x);
    Lk = zeros(n, 1);
    
    for k = 1:n
        L = 1;
        for i = 1:n
            if i ~= k
                L = L * (xt - x(i)) / (x(k) - x(i));
            end
        end
        Lk(k) = L;
    end
    
    yt = sum(y .* Lk);
end