# Análisis de Inventario y Control de Stock en SQL (DVD Rental)

Este repositorio contiene un script desarrollado en **SQL Avanzado** utilizando el motor **PostgreSQL** para resolver un problema estratégico de negocio e inventario en una cadena de arriendo de películas.

El objetivo principal es entregarle a la gerencia métricas claras sobre qué categorías de productos generan más ingresos y cuáles presentan mayor riesgo de quiebre de stock debido a retrasos en las devoluciones.

## 🛠️ Conceptos de SQL Aplicados
* **Expresiones de Tabla Comunes (CTEs / comando WITH)**: Para segmentar y aislar la lógica de limpieza y consolidación antes de la entrega de datos.
* **Multi-Join**: Conexión relacional de 6 tablas en una sola consulta para trazar el flujo completo del dato.
* **Lógica Condicional (COUNT con CASE WHEN)**: Implementación de filtros para identificar celdas vacías (NULL) en las fechas de devolución y contabilizar el inventario actualmente retenido por clientes.

## 📊 Impacto del Proyecto
El script permite identificar de forma automática las categorías de mayor rentabilidad y contrastarlas con las unidades físicas que se encuentran fuera de bodega, facilitando la toma de decisiones para compras de nuevo inventario.
