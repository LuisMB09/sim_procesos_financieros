-- Cuántas filas tiene la tabla
SELECT COUNT(*)
FROM SimLVDF.dbo.FinancialStatement

-- Cuántas empresas aparecen?
SELECT COUNT(DISTINCT ticker)
FROM SimLVDF.dbo.FinancialStatement

-- Para cuántos años tienes datos?
SELECT COUNT(DISTINCT YEAR(fiscalDateEnding))
FROM SimLVDF.dbo.FinancialStatement

-- Calcula el Gross Profit promedio de AMD
SELECT AVG(grossProfit)
FROM SimLVDF.dbo.FinancialStatement
WHERE ticker = 'AMD'

-- Obtén las 20 empresas con el mayor EBITDA en 2018
SELECT TOP 20 ticker, SUM(ebitda) AS TotalEBITDA
FROM SimLVDF.dbo.FinancialStatement
WHERE YEAR(fiscalDateEnding) = 2018
GROUP BY ticker
ORDER BY TotalEBITDA DESC


-- Cuál fue el total Revenue por año de Microsoft entre 2015 y 2020?
SELECT YEAR(fiscalDateEnding) AS Anio, SUM(totalRevenue) AS TotalRevenue
FROM SimLVDF.dbo.FinancialStatement
WHERE ticker = 'MSFT' AND YEAR(fiscalDateEnding) BETWEEN 2015 AND 2020
GROUP BY YEAR(fiscalDateEnding)
ORDER BY Anio


-- Cuál fue el total Revenue (acumulado) de Microsoft entre 2015 y 2020?
SELECT SUM(totalRevenue) as TotalRevenue
FROM SimLVDF.dbo.FinancialStatement
WHERE ticker = 'MSFT' and YEAR(fiscalDateEnding) >= 2015 and YEAR(fiscalDateEnding) <= 2020


