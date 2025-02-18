function stats_table = calcular_estadisticas(tabla)
    % Obtener nombres de variables y datos de la tabla
    variables = tabla.Properties.VariableNames;
    datos = table2cell(tabla);
    
    % Inicializar matriz para almacenar resultados
    resultados = cell(length(variables), 5);
    
    % Calcular estadísticas para cada variable
    for i = 1:length(variables)
        variable_actual = datos(:, i);
        
        % Verificar si la variable es numérica o no
        if isnumeric(variable_actual{1})
            % Convertir a tipo numérico y calcular estadísticas
            variable_numerica = cell2mat(variable_actual);
            valor_minimo = min(variable_numerica);
            valor_maximo = max(variable_numerica);
            promedio = mean(variable_numerica, 'omitnan');
            mediana = median(variable_numerica, 'omitnan');
            num_missing = sum(isnan(variable_numerica));
            
            % Guardar resultados en la matriz
            resultados{i, 1} = valor_minimo;
            resultados{i, 2} = valor_maximo;
            resultados{i, 3} = promedio;
            resultados{i, 4} = mediana;
            resultados{i, 5} = num_missing;
        else
            % Para variables no numéricas, solo calcular número de valores faltantes
            num_missing = sum(cellfun(@(x) isempty(x), variable_actual));
            % Guardar resultados en la matriz
            resultados{i, 1} = NaN;
            resultados{i, 2} = NaN;
            resultados{i, 3} = NaN;
            resultados{i, 4} = NaN;
            resultados{i, 5} = num_missing;
        end
    end
    
    % Crear tabla de resultados
    stats_table = rows2vars(cell2table(resultados, 'VariableNames', {'min', 'max', 'mean', 'median', 'missing'}, 'RowNames', variables),'VariableNamingRule','preserve');
    stats_table.Properties.RowNames = stats_table.OriginalVariableNames;
    stats_table = removevars(stats_table, 'OriginalVariableNames');
end