function [r, s, raices] = bairstow(a, r, s, es, max_iter)
    n = length(a) - 1; % grade of the polynomial
    for iter = 1:max_iter
        % synthetic division for b and c
        b = zeros(1, n+1);
        c = zeros(1, n+1);
        b(n+1) = a(n+1);
        b(n) = a(n) + r*b(n+1);
        for i = n-1:-1:1
            b(i) = a(i) + r*b(i+1) + s*b(i+2);
        end
        c(n+1) = b(n+1);
        c(n) = b(n) + r*c(n+1);
        for i = n-1:-1:2
            c(i) = b(i) + r*c(i+1) + s*c(i+2);
        end
        
        % solve the system for Δr and Δs
        A = [c(3), c(4); c(2), c(3)];
        B = [-b(2); -b(1)];
        delta = A \ B;
        dr = delta(1);
        ds = delta(2);
        
        % update r and s
        r_new = r + dr;
        s_new = s + ds;
        
        % calculate errors
        er = abs(dr / r_new) * 100;
        es_actual = abs(ds / s_new) * 100;
        
        % check convergence
        if er < es && es_actual < es
            r = r_new;
            s = s_new;
            raices = roots([1, -r, -s]); % roots of the quadratic
            fprintf('Convergence in iteration %d\n', iter);
            return;
        end
        
        r = r_new;
        s = s_new;
    end
    error('No convergencia en %d iteraciones', max_iter);
end

a = [1, -3.5, 2.75, 2.125, -3.875, 1.25]; % coefficients
r = -1; s = -1; % initial values
es = 1; % 1% tolerance
max_iter = 100;
[r, s, raices] = bairstow(a, r, s, es, max_iter);
disp('Raices del polinomio:'); disp(raices);