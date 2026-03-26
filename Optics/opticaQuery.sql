SELECT SUM(Total)
FROM Sales
WHERE Customer_Id = 1;

SELECT Glasses.Glasses_Id, Glasses.Frame_Type, Glasses.Frame_Color
FROM Glasses
JOIN Sale_Item ON Glasses.Glasses_Id = Sale_Item.Glasses_Id
JOIN Sales ON Sale_Item.Sales_Id = Sales.Sales_Id
WHERE Sales.Employee_Id = 1
AND YEAR(Sales.Sale_Datetime) = 2025;

SELECT DISTINCT Supplier.Name
FROM Supplier
JOIN Brand ON Supplier.Supplier_Id = Brand.Supplier_Id
JOIN Glasses ON Brand.Brand_Id = Glasses.Brand_Id
JOIN Sale_Item ON Glasses.Glasses_Id = Sale_Item.Glasses_Id;