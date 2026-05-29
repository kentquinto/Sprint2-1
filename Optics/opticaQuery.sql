Total purchase of a customer

SELECT c.name, SUM(s.total) AS total_purchases
FROM customer c
JOIN sales s ON s.customer_customer_id = c.customer_id
GROUP BY c.customer_id, c.name;

Glasses sold by an employee during a year

SELECT e.name, g.glasses_id, g.frame_type, g.frame_color
FROM employee e
JOIN sales s ON s.employee_employee_id = e.employee_id
JOIN sale_item si ON si.sales_sales_id = s.sales_id
JOIN glasses g ON g.glasses_id = si.glasses_glasses_id
WHERE YEAR(s.sale_datetime) = 2026
GROUP BY e.name, g.glasses_id;

Suppliers whose glasses have been successfully sold

SELECT DISTINCT sup.name
FROM supplier sup
JOIN brand b ON b.supplier_supplier_id = sup.supplier_id
JOIN glasses g ON g.brand_brand_id = b.brand_id
JOIN sale_item si ON si.glasses_glasses_id = g.glasses_id;

