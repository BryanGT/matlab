function [p_normalized, q_normalized] = normalize_polynomials(p, q)
    % Maximum length between the two polynomials
    max_length = max(length(p), length(q));
    
    % Fill with zeros at the beginning (to align terms of equal degree)
    p_normalized = [zeros(1, max_length - length(p)), p];
    q_normalized = [zeros(1, max_length - length(q)), q];
end