select
	sod.SalesOrderID,
	P.NAME PRODUTO,
	SOD.OrderQty QUANTIDADE,
	SOD.UnitPrice PRECO_UNITARIO,
	SOD.SpecialOfferID COD_PROMO,
	SOD.UnitPriceDiscount,
	SOD.LineTotal TOTAL,
	(
		SELECT NAME FROM Sales.SalesTerritory ST
		WHERE ST.TerritoryID = SOH.TerritoryID
	) REGIAO,
	SOD.ModifiedDate DATA_VENDA
from Sales.SalesOrderDetail SOD
LEFT JOIN Production.Product P
ON SOD.ProductID = P.ProductID
LEFT JOIN Sales.SalesOrderHeader SOH
ON SOD.SalesOrderID = SOH.SalesOrderID