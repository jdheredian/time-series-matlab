function correlacion_table = calcular_correlaciones(tabla)
    % Obtener nombres de variables y datos de la tabla
    variables = tabla.Properties.VariableNames;
    datos = table2array(tabla);
    
    % Inicializar matriz de correlaciones
    num_variables = size(datos, 2);
    matriz_correlacion = zeros(num_variables);
    
    % Calcular correlaciones para cada par de variables
    for i = 1:num_variables
        for j = i:num_variables
            % Verificar si los datos son numéricos
            if isnumeric(datos(:, i)) && isnumeric(datos(:, j))
                % Calcular la correlación
                correlacion_ij = corrcoef(datos(:, i),datos(:, j));
            else
                % Si los datos no son numéricos, asignar NaN
                correlacion_ij = NaN;
            end
            
            % Asignar el coeficiente de correlación a la matriz de correlación
            matriz_correlacion(i, j) = correlacion_ij;
            matriz_correlacion(j, i) = correlacion_ij; % Reflejar la correlación en la otra diagonal
        end
    end
    
    % Crear tabla de correlaciones
    correlacion_table = array2table(matriz_correlacion, 'VariableNames', variables, 'RowNames', variables);
end
