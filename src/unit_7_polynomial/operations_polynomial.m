clc; clear; close all;

function [p_normalized, q_normalized] = normalize_polynomials(p, q)
    % Check if both polynomials are empty
    if isempty(p) || isempty(q)
        error('Error: Ambos polinomios deben contener coeficientes.');
    end

    % Maximum length between the two polynomials
    max_length = max(length(p), length(q));
    
    % Fill with zeros at the beginning (to align terms of equal degree)
    p_normalized = [zeros(1, max_length - length(p)), p];
    q_normalized = [zeros(1, max_length - length(q)), q];
end

function addition = sum_polynomial(p, q)
    % Addition polynomial
    [p_norm, q_norm] = normalize_polynomials(p, q); % use the function normalize_polynomials
    addition = p_norm + q_norm; % add the polynomials
    disp('Suma de polinomios:');
    disp(addition);
end

function product = product_polynomial(p, q)
    % Product polynomial
    [p_norm, q_norm] = normalize_polynomials(p, q); % use the function normalize_polynomials
    product = conv(p_norm, q_norm); % multiply the polynomials
    disp('Producto de polinomios:');
    disp(product);
end

function division = division_polynomial(p, q)
    % Division polynomial
    [p_norm, q_norm] = normalize_polynomials(p, q); % use the function normalize_polynomials
    [cociente, residuo] = deconv(p_norm, q_norm); % divide the polynomials
    disp('Cociente:');
    disp(cociente);
    disp('Residuo:');
    disp(residuo);
end

% Define
p = [1 -3 2];  % equal to x^2 - 3x + 2
q = [1 1];     % equal to x + 1

% Addition polynomial
sum_polynomial(p, q);

% Product polynomial
product_polynomial(p, q);

% Division polynomial
[cociente, residuo] = deconv(p, q);
cociente = cociente(find(cociente, 1, 'first'):end);
residuo = residuo(find(residuo, 1, 'first'):end);
disp('Cociente:'); disp(cociente);
disp('Residuo:');  disp(residuo); 