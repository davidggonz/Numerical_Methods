function Yt = Neuville_interpolation(x, y, xt, epsilon)
% NEUVILLE_INTERPOLATION - Performs Neville's algorithm for polynomial interpolation
% Inputs:
%   x: Vector of known x-values
%   y: Vector of known y-values
%   xt: Point to interpolate
%   epsilon: Convergence tolerance
% Output:
%   Yt: Interpolated value at xt

    % Initialize interpolation table
    Q = zeros(length(x));
    Q(:,1) = y(:);
    
    % Neville's algorithm
    for i = 2:length(x)
        for j = 2:i
            Q(i,j) = ((xt - x(i-j+1))*Q(i,j-1) - (xt - x(i))*Q(i-1,j-1)) ...
                    / (x(i) - x(i-j+1));
        end
        
        % Check for convergence
        if abs(Q(i,j) - Q(i-1,j-1)) < epsilon
            break;
        end
    end
    
    Yt = Q(i,i);
end