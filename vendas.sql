SELECT 
	SOH.SalesOrderID,
	soh.DueDate,
	SOH.SalesPersonID,
	(SELECT CONCAT(P.FIRSTNAME, ' ', P.LastName) FROM Person.Person P WHERE P.BusinessEntityID = SOH.SalesPersonID) VENDEDOR,
	SP.CommissionPct PERC_COMISSAO,
	SOH.CustomerID,
	(SELECT CONCAT(P.FirstName, ' ', P.LastName) FROM Person.Person P where P.BusinessEntityID = SOH.CustomerID) CLIENTE,
	SOH.Status,
	SOH.OnlineOrderFlag ONLINE_VEND,
	ST.Name TERRITORIO,
	SOH.SubTotal SUBTOTAL,
	SOH.TaxAmt IMPOSTO,
	soh.Freight FRETE,
	SOH.TotalDue TOTAL_VENDA
FROM Sales.SalesOrderHeader SOH
LEFT JOIN Sales.Customer C
ON SOH.CustomerID = C.CustomerID
left join Sales.SalesPerson sp
on sp.BusinessEntityID = SOH.SalesPersonID
LEFT JOIN Sales.SalesTerritory ST
ON ST.TerritoryID = SOH.TerritoryID