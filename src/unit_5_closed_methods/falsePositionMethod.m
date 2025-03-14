f = @(x) x.^3 - 2*x.^2 - 4*x + 8;
a = -3; b = 0; tol = 1e-6;
c_prev = 0; % Valor inicial para el error relativo

fprintf('Iteración |   a      |   b      |   c      | f(a)*f(c) | Error Relativo Aproximado\n');
fprintf('------------------------------------------------------------------------------\n');

for iter = 1:100
    % Calcular el punto c usando el método de falsa posición
    c = (a * f(b) - b * f(a)) / (f(b) - f(a));
    
    % Calcular el error relativo aproximado
    if iter > 1
        error_rel = abs(c - c_prev) / abs(c);
    else
        error_rel = NaN; % No aplica en la primera iteración
    end
    
    fprintf('%9d | %7.4f | %7.4f | %7.4f | %9.4f | %24.6f\n', iter, a, b, c, f(a)*f(c), error_rel);
    
    % Verificar convergencia
    if iter > 1 && error_rel < tol
        break;
    end
    
    % Actualizar el intervalo
    if f(a) * f(c) < 0
        b = c;
    else
        a = c;
    end
    
    % Guardar el valor actual de c para la próxima iteración
    c_prev = c;
end

fprintf('Raíz aproximada: %.6f\n', c);