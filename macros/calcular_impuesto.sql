{% macro calcular_impuesto(columna_valor, tasa=0.21) %}
    -- Esta macro toma una columna y le suma el impuesto (por defecto 21%)
    ROUND( ({{ columna_valor }} * (1 + {{ tasa }})), 2 )
{% endmacro %}