clc; clear; close all;
function [y_interp, error] = newton_interp_3rd_degree(x_points, y_points, x, valor_real)
    % calculate the divided differences
    n = length(x_points);
    F = zeros(n, n);
    F(:,1) = y_points;
    
    for j = 2:n
        for i = 1:n-j+1
            F(i,j) = (F(i+1,j-1) - F(i,j-1)) / (x_points(i+j-1) - x_points(i));
        end
    end
    
    % evaluate the polynomial
    y_interp = F(1,1);
    for k = 2:n
        term = F(1,k);
        for m = 1:k-1
            term = term * (x - x_points(m));
        end
        y_interp = y_interp + term;
    end
    
    error = abs((y_interp - valor_real) / valor_real) * 100;
end

% Data with close points
x_points = [1, 1.5, 2.5, 4];
y_points = [0, 0.405465, 0.916291, 1.386294];
x = 2;
valor_real = 0.6931472;

% Interpolation
[y_est, error] = newton_interp_3rd_degree(x_points, y_points, x, valor_real);
fprintf('Estimation: ln(2) ≈ %.6f, Error = %.2f%%\n', y_est, error);