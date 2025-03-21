% Fixed-Point Iteration Method for Systems of Nonlinear Equations

% Define the functions g1(x, y) and g2(x, y)
g1 = @(x, y) sqrt(10 - x*y);
g2 = @(y, x) sqrt((57 - y) / (3*x));

% Initial guess
x0 = 0.5;           % Initial guess for x
y0 = 0.5;           % Initial guess for y

% Tolerance (desired precision)
tol = 1e-6;       % Stop when the approximate relative error is less than 1e-6

% Maximum number of iterations
max_iter = 100;   % To prevent infinite loops

% Initialize variables
x = y0;           % Current value of x
y = x0;           % Current value of y
iter = 0;         % Iteration counter
error_approx = 100; % Initialize approximate relative error (start with 100%)

% Display table header
fprintf('Iteracion\t x_i\t\t y_i\t\t x_{i+1}\t\t y_{i+1}\t\t Aprox. Error Relativo (%%)\n');
fprintf('----------------------------------------------------------------------------------------\n');

% Fixed-point iteration loop
while error_approx > tol && iter < max_iter
    % Compute the next approximation: x_{i+1} = g1(x_i, y_i), y_{i+1} = g2(x_i, y_i)
    x_new = g1(x, y);
    y_new = g2(x, y);
    
    % Calculate the approximate relative error
    error_approx = max(abs((x_new - x) / x_new), abs((y_new - y) / y_new)) * 100;
    
    % Display the current iteration results
    fprintf('%d\t\t %.6f\t %.6f\t %.6f\t %.6f\t %.6f\n', iter, x, y, x_new, y_new, error_approx);
    
    % Update x and y for the next iteration
    % x = x_new;
    y = y_new;
    
    % Increment the iteration counter
    iter = iter + iter;
end

% Display the final result
fprintf('\nRaiz aproximada: x = %.6f, y = %.6f\n', x, y);
fprintf('Iteraciones: %d\n', iter);