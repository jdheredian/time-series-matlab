function graficar_raices_unitarias(coefficients)
    % Calcula las raíces del polinomio característico
    roots_polynomial = roots(coefficients);
    figure;
    % Grafica las raíces en el plano complejo
    scatter(real(roots_polynomial), imag(roots_polynomial), 'filled');
    hold on;
    xlabel('Parte Real');
    ylabel('Parte Imaginaria');
    title('Raíces del Polinomio Característico');
    grid on;

    % Dibuja el círculo unitario
    theta = linspace(0, 2*pi, 100);
    plot(cos(theta), sin(theta), 'r--');
    axis equal;

    % Marca el origen
    scatter(0,0, 'x', 'k');
end
