function output = findGARCH(variable, AR,I,MA)
    T = length(variable(~isnan(variable))); % Longitud de la serie temporal sin NaNs
    AIC = NaN(3, 3); % Preasignación para AIC
    BIC = NaN(3, 3); % Preasignación para BIC

    for i = 0:2
        for j = 0:2
            try
                Mdl = arima(AR, I, MA); % Asume que quieres un modelo ARMA
                Mdl.Variance = garch(i,j);
                [~, ~, Logl] = estimate(Mdl, variable, 'Display', 'off'); % Suprime la salida de 'estimate'
                param = i + j  + AR + MA + 1; % Número de parámetros estimados
                [aic, bic] = aicbic(Logl, param, T);
                AIC(i+1, j+1) = aic; % +1 para ajustar índices MATLAB
                BIC(i+1, j+1) = bic; % +1 para ajustar índices MATLAB
            catch
                % Manejo de errores para modelos que no se pueden estimar
                AIC(i+1, j+1) = NaN;
                BIC(i+1, j+1) = NaN;
            end
        end
    end
    output = struct( ...
        'AIC', array2table(AIC, "RowNames",  compose("p = %d", 0:2),"VariableNames",compose("q = %d", 0:2)), ...
        'BIC', array2table(BIC, "RowNames",  compose("p = %d", 0:2),"VariableNames",compose("q = %d", 0:2)));
end
