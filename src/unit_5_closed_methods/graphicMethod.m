% Define the function
f = @(x) x.^3 - 2*x.^2 - 4*x + 8;

% Define the interval
x = linspace(-3, 4, 1000);

% Plot the function
figure;
plot(x, f(x));
grid on;
xlabel('x');
ylabel('f(x)');
title('Graphical Method: f(x) = x^3 - 2x^2 - 4x + 8');

% Highlight the x-axis
hold on;
plot(x, zeros(size(x)), 'k--');
hold off;