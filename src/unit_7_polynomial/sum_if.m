clc; clear; close all;

% Definition of polynomials
p = [1 -3 2];  % Represents x^2 - 3x + 2
q = [1 1];     % Represents x + 1

% Validate that they have the same length
if length(p) ~= length(q)
    error('Los polinomios no tienen la misma longitud.');
end

% Addition of polynomials
addition = p + q;  % Now they have the same length
disp('Suma de polinomios:');
disp(addition);