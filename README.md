Each databases contains their own schemas, relational diagrams, and queries (to prove it works)!

For the Optica it includes 7 main tables:
Customer: Stores customer informations and aswell as referalls (customer -> customer)
Employee: For staff members
Supplier: For the glasses, it provides multiple Brands
Brand: Is linked to Supplier, also provide multiple Glasses
Glasses: Product sold in the store
Sales: Transactions. Its linked to a Customer and an Employee
Sale_Item: Detailed transaction for every product that is sold (multiple products products).

For the Pizzeria it includes 8 main tables:
Customer: Customer information and address. Also they can place more than 1 orders
Store: Location. It stores multiple Employees
Employee: Has option if cooks or delivery staff
Product: Sold items(pizzas, burgers, drinks)
Category: For pizzas
Orders: For Customer orders. 
Order_Items: Detailed orders, can contain multiples products from Orders.
Delivery: Delivery details for every delivery.


