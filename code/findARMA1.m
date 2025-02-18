function output = findARMA1(variable, maxAR,I, maxMA)
    AR = maxAR;
    MA = maxMA;
    T = length(variable(~isnan(variable))); % Longitud de la serie temporal sin NaNs
    AIC = NaN(AR, MA); % Preasignación para AIC
    BIC = NaN(AR, MA); % Preasignación para BIC

    for i = 0:AR
        for j = 0:MA
            try
                Mdl = arima(i, I, j); % Asume que quieres un modelo ARMA
                [EstMdl, ~, Logl] = estimate(Mdl, variable, 'Display', 'off'); % Suprime la salida de 'estimate'
                param = i + j; % Número de parámetros estimados
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
    output = struct('AIC',AIC, 'BIC',BIC);
end
