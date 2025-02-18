# Time Series Analysis with Matlab

Repositorio colaborativo de análisis de series de tiempo utilizando Matlab. Incluye funciones para modelos ARMA, GARCH, pruebas de raíces unitarias y otras herramientas estadísticas.

## Estructura del Proyecto

```
time-series-matlab/
│
├── code/                   # Archivos .m
│
├── README.md               # Descripción general del proyecto
└── LICENSE                 # Licencia del proyecto
```

## Requisitos
- **Matlab** (versión 2021b o superior recomendada)
- **Toolboxes necesarios**: Econometrics Toolbox, Statistics and Machine Learning Toolbox

## Instrucciones de Uso
Clonar el repositorio y añadir el directorio `code/` al path en Matlab.

## Descripción de los archivos

### 1. calcular_correlaciones.m
**Descripción:**
Calcula las correlaciones entre múltiples series temporales contenidas en una matriz.

**Funciones clave utilizadas:** `corr`.

**Parámetros de entrada:**
- `datos`: Matriz donde cada columna representa una serie temporal.

**Salidas:**
- `correlaciones`: Matriz de correlaciones entre todas las series.

**Uso:**
```matlab
correlaciones = calcular_correlaciones(datos);
```

**Notas:**
- El archivo maneja validación de datos faltantes y normalización previa.

---

### 2. calcular_estadisticas.m
**Descripción:**
Calcula estadísticas descriptivas básicas de una serie temporal, incluyendo media, desviación estándar, varianza y curtosis.

**Funciones clave utilizadas:** `mean`, `std`, `var`, `kurtosis`.

**Parámetros de entrada:**
- `serie`: Vector de datos temporales.

**Salidas:**
- Estructura con `media`, `desviacion`, `varianza` y `curtosis`.

**Uso:**
```matlab
estadisticas = calcular_estadisticas(serie);
```

**Notas:**
- Incluye manejo de valores atípicos y datos faltantes.

---

### 3. findARMA1.m y findARMA2.m
**Descripción:**
Estiman parámetros para un modelo ARMA(p,q) utilizando criterios de información como AIC y BIC.

**Funciones clave utilizadas:** `estimate`, `aicbic`.

**Parámetros de entrada:**
- `serie`: Vector de series temporales.
- `max_p`, `max_q`: Máximo orden para AR y MA.

**Salidas:**
- Estructura con coeficientes estimados, varianzas y criterios AIC/BIC.

**Uso:**
```matlab
modelo_arma = findARMA1(serie);
```

**Notas:**
- Implementa validación de residuales y pruebas de Ljung-Box.

---

### 4. findGARCH.m
**Descripción:**
Ajusta un modelo GARCH(p,q) a una serie temporal de volatilidad.

**Funciones clave utilizadas:** `garch`, `estimate`.

**Parámetros de entrada:**
- `serie`: Vector de retornos.

**Salidas:**
- Modelo GARCH estimado con coeficientes y estadísticas de bondad de ajuste.

**Uso:**
```matlab
modelo_garch = findGARCH(serie);
```

**Notas:**
- Incluye validación de heterocedasticidad y pruebas ARCH.

---

### 5. graficar_raices_unitarias.m
**Descripción:**
Grafica las raíces unitarias de un polinomio característico asociado a una serie temporal.

**Funciones clave utilizadas:** `roots`, `plot`.

**Parámetros de entrada:**
- `serie`: Vector de series temporales.

**Salidas:**
- Gráfica de las raíces en el plano complejo.

**Uso:**
```matlab
graficar_raices_unitarias(serie);
```

**Notas:**
- Incluye pruebas de raíz unitaria como ADF.

---

### 6. table2latex.m
**Descripción:**
Convierte una tabla de Matlab en un formato compatible con LaTeX para su inclusión en documentos académicos.

**Funciones clave utilizadas:** `fprintf`.

**Parámetros de entrada:**
- `tabla`: Estructura o tabla de Matlab.
- `nombreArchivo`: Nombre del archivo `.tex` de salida.

**Salidas:**
- Archivo `.tex` con la tabla formateada.

**Uso:**
```matlab
table2latex(tabla, 'resultado.tex');
```

**Notas:**
- Personalizable con títulos y etiquetas de columnas.
