# Desafío: Cubo OLAP con AdventureWorks, Visual Studio y Power BI

**Estudiante:** Guillermo Alejandro Castillo Campos · **Carnet:** CC242330



## Estructura del repositorio

```
.
├── Cubo/            Proyecto de Visual Studio (Analysis Services Multidimensional)
├── PowerBI/         Archivo .pbix con las visualizaciones y el dashboard
├── Scripts/         Scripts SQL (restauración, verificación y consultas)
├── Documento/       Informe en PDF
├── .gitignore
└── README.md
```

## Herramientas utilizadas

- SQL Server 2025 (motor de base de datos)
- SQL Server Analysis Services en modo **Multidimensional**
- SQL Server Management Studio (SSMS)
- Visual Studio 2022 con la extensión *Microsoft Analysis Services Projects*
- Power BI Desktop

## Cómo reproducir el trabajo

### 1. Restaurar la base de datos

El archivo de respaldo `AdventureWorksDW2025.bak` **no se incluye** en este repositorio por su tamaño. Descárgalo desde https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2025.bak y restáuralo con el script de la carpeta `Scripts`:

1. Ejecuta primero `RESTORE FILELISTONLY` para ver los nombres lógicos de los archivos.
2. Ajusta los nombres lógicos y las rutas en el comando `RESTORE DATABASE ... WITH MOVE`.
3. Verifica con `SELECT TOP 10 * FROM dbo.DimCustomer;`.

> Un respaldo de SQL Server 2025 solo puede restaurarse en SQL Server 2025.

### 2. Abrir y desplegar el cubo

1. Abre la solución de la carpeta `Cubo` en Visual Studio.
2. En el **Data Source**, ajusta el servidor del motor de base de datos a tu instancia (en este proyecto: `localhost\MSSQLSERVER02`) y la base `AdventureWorksDW2025`.
3. En *Propiedades del proyecto → Implementación*, indica tu instancia de Analysis Services (en este proyecto: `localhost\SSAS_EVAL`).
4. Asegúrate de que la cuenta del servicio de Analysis Services tenga el rol `db_datareader` sobre `AdventureWorksDW2025`.
5. Ejecuta **Compilar → Implementar solución** hasta ver *Process Succeeded*.

### 3. Ver el dashboard

1. Abre `PowerBI/CuboAdventureWorks.pbix` con Power BI Desktop.
2. El archivo contiene tres páginas, con la visualización de las 3 problemáticas a resolver (Ventas por año y categoría, ventas y utilidad por territorio y rentabilidad por subcategoría)
3. Si Power BI solicita credenciales o la conexión al cubo, usa tu servidor de Analysis Services y elige **Conectar en vivo**.

## Contenido del cubo

- **Tabla de hechos:** `FactInternetSales`
- **Medidas:** Sales Amount, Order Quantity, Total Product Cost, Fact Internet Sales Count y la medida calculada **Utilidad** (Sales Amount − Total Product Cost)
- **Dimensiones:** Fecha (pedido), Producto, Cliente, Promoción y Territorio de ventas
- **Jerarquías:** Año → Trimestre → Mes, y Categoría → Subcategoría → Producto

## Consultas SQL

Las consultas se encuentran en `Scripts/`. Cada una resuelve una problemática, selecciona solo las columnas necesarias, une las tablas por sus llaves y ordena los resultados para facilitar su lectura.

## Informe

El informe completo, con las evidencias gráficas del proceso y el análisis de resultados, está en [`Documento/`](Documento/).