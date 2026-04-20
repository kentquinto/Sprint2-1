SELECT 
    c.town,
    SUM(oi.quantity) AS total_drinks_sold
FROM order_items oi
JOIN product p 
    ON oi.product_product_id = p.product_id
JOIN orders o 
    ON oi.orders_order_id = o.order_id
JOIN customer c 
    ON o.customer_customer_id = c.customer_id
WHERE p.product_type = 'Drink'
  AND c.town = 'Barcelona'
GROUP BY c.town;

SELECT 
    e.employee_id,
    e.name,
    e.surname,
    COUNT(d.orders_order_id) AS total_orders
FROM employee e
JOIN delivery d 
    ON e.employee_id = d.employee_employee_id
WHERE e.employee_id = 1
GROUP BY e.employee_id, e.name, e.surname;