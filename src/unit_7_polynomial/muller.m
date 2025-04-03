function raiz = muller(f, x0, x1, x2, tol, max_iter)
    % Method of Muller
    % Inputs:
    %   f: function to evaluate (e.g., @(x) x^3 - 13*x - 12)
    %   x0, x1, x2: initial values
    %   tol: tolerance (e.g., 1e-6)
    %   max_iter: maximum number of iterations (e.g., 100)
    
    fprintf('Iter\t x0\t\t x1\t\t x2\t\t x3\t\t Error\n');
    fprintf('----------------------------------------------------\n');
    
    for iter = 1:max_iter
        % Evaluate f at the points
        f0 = f(x0); f1 = f(x1); f2 = f(x2);
        
        % Calculate divided differences
        h0 = x1 - x0; h1 = x2 - x1;
        delta0 = (f1 - f0)/h0; delta1 = (f2 - f1)/h1;
        
        % Coefficients of the quadratic polynomial
        a = (delta1 - delta0)/(h1 + h0);
        b = a*h1 + delta1;
        c = f2;
        
        % Calculate x3 (choose sign for larger denominator)
        discriminante = sqrt(b^2 - 4*a*c);
        if abs(b + discriminante) > abs(b - discriminante)
            x3 = x2 - (2*c)/(b + discriminante);
        else
            x3 = x2 - (2*c)/(b - discriminante);
        end
        
        % Calculate approximate error
        if iter > 1
            error_aprox = abs((x3 - x2)/x3) * 100;
            fprintf('%d\t %.6f\t %.6f\t %.6f\t %.6f\t %.2f%%\n', ...
                    iter, x0, x1, x2, x3, error_aprox);
        else
            fprintf('%d\t %.6f\t %.6f\t %.6f\t %.6f\t -\n', ...
                    iter, x0, x1, x2, x3);
        end
        
        % Check convergence
        if abs(f(x3)) < tol
            raiz = x3;
            fprintf('\nRaíz encontrada: x = %.6f\n', raiz);
            return;
        end
        
        % Update points for the next iteration
        x0 = x1; x1 = x2; x2 = x3;
    end
    
    error('No se alcanzó convergencia en %d iteraciones.', max_iter);
end

f = @(x) x^3 - 13*x - 12;
x0 = 4.5; x1 = 5.5; x2 = 5;
tol = 1e-6; max_iter = 100;
raiz = muller(f, x0, x1, x2, tol, max_iter);