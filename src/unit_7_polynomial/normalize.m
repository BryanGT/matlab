function a_normalized = normalize_coefficients(a, grade, order)
    % Normalize coefficients and adjust order
    % a: vector of coefficients
    % grade: desired degree of the polynomial
    % order: 'descend' (default) or 'ascend'
    
    if nargin < 3
        order = 'descend'; % Default order (MATLAB standard)
    end
    
    % Ensure the vector has the correct length
    if length(a) < grade + 1
        padding = zeros(1, grade + 1 - length(a));
        if strcmpi(order, 'descend')
            a_normalized = [a, padding]; % Fill at the end (for descending order)
        else
            a_normalized = [padding, a]; % Fill at the beginning (for ascending order)
        end
    elseif length(a) > grade + 1
        a_normalized = a(1:grade + 1); % Truncate
    else
        a_normalized = a;
    end
    
    % Reorder if necessary
    if strcmpi(order, 'ascend')
        a_normalized = fliplr(a_normalized); % Convert to descending order
    end
end