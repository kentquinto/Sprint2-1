SELECT SUM(`Order Items`.Quantity)
FROM `Order Items`
JOIN Product ON `Order Items`.Product_Id = Product.Product_Id
JOIN Orders ON `Order Items`.Order_Id = Orders.Order_Id
JOIN Store ON Orders.Store_Id = Store.Store_Id
WHERE Product.Product_Type = 'Drink'
AND Store.City = 'Barcelona';

SELECT COUNT(Order_Id)
FROM Delivery
WHERE Employee_Id = 1;