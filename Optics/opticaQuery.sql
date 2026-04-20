SELECT 
    c.customer_id,
    c.name,
    SUM(s.total) AS total_purchases
FROM customer c
JOIN sales s 
    ON c.customer_id = s.customer_customer_id
WHERE c.customer_id = 1
GROUP BY c.customer_id, c.name;

SELECT DISTINCT
    e.employee_id,
    e.name AS employee_name,
    g.glasses_id,
    g.frame_type,
    g.frame_color,
    g.price
FROM employee e
JOIN sales s 
    ON e.employee_id = s.employee_employee_id
JOIN sale_item si 
    ON s.sales_id = si.sales_sales_id
JOIN glasses g 
    ON si.glasses_glasses_id = g.glasses_id
WHERE e.employee_id = 1
  AND YEAR(s.sale_datetime) = 2025
ORDER BY g.glasses_id;

SELECT DISTINCT
    sup.supplier_id,
    sup.name AS supplier_name
FROM supplier sup
JOIN brand b 
    ON sup.supplier_id = b.supplier_supplier_id
JOIN glasses g 
    ON b.brand_id = g.brand_brand_id
JOIN sale_item si 
    ON g.glasses_id = si.glasses_glasses_id
JOIN sales s 
    ON si.sales_sales_id = s.sales_id;