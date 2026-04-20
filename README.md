# Optica Database

## Overview

Optica is a relational database designed to manage an optical store. It handles suppliers, brands, products (glasses), customers, employees, and sales transactions. The schema enforces relationships between entities using primary and foreign keys to maintain data integrity.

## Schema

The database creates a schema named Optica

## Tables

### supplier

Stores supplier information.

* supplier_id (primary key)
* name
* street, number, floor, door, city, postal_code, country
* phone, fax
* nif (unique)

### brand

Stores eyewear brands.

* brand_id (primary key)
* name
* supplier_supplier_id (foreign key to supplier)

Each brand belongs to one supplier.

### glasses

Stores glasses available for sale.

* glasses_id (primary key)
* frame_type (Rimless, Plastic, Metal)
* frame_color
* left_lens_color, right_lens_color
* left_lens_presciption, right_lens_prescription
* price
* brand_brand_id (foreign key to brand)

Each pair of glasses belongs to one brand.

### customer

Stores customer data.

* customer_id (primary key)
* name
* postal_address
* phone
* email (unique)
* registration_date

### employee

Stores employee data.

* employee_id (primary key)
* name

### sales

Stores sales transactions.

* sales_id (primary key)
* sale_datetime
* total
* customer_customer_id (foreign key to customer)
* employee_employee_id (foreign key to employee)

Each sale is linked to one customer and one employee.

### sale_item

Stores the items included in each sale.

* glasses_glasses_id (foreign key to glasses)
* sales_sales_id (foreign key to sales)
* quantity
* primary key (glasses_glasses_id, sales_sales_id)

This table implements a many-to-many relationship between sales and glasses.

### customer_has_customer

Stores customer referrals.

* customer_recommender_id (foreign key to customer)
* customer_recommended_id (foreign key to customer)
* primary key (customer_recommender_id)

Each record represents one customer recommending another.

## Relationships Summary

* One supplier can have many brands.
* One brand can have many glasses.
* One customer can have many sales.
* One employee can handle many sales.
* One sale can include many glasses through sale_item.
* Customers can recommend other customers.

# Pizza Database

## Overview

Pizza is a relational database designed to manage a pizza business. It covers customers, stores, employees, products, orders, and deliveries. The schema enforces relationships between entities using primary and foreign keys to maintain data consistency.

## Schema

The database creates a schema named Pizza

## Tables

### customer

Stores customer information.

* customer_id (primary key)
* name
* surname
* street
* postal_code
* town
* province
* phone

### store

Stores physical store locations.

* store_id (primary key)
* street
* postal_code
* city
* province

### orders

Stores customer orders.

* order_id (primary key)
* time (order timestamp)
* total
* is_delivery (0 = pickup, 1 = delivery)
* customer_customer_id (foreign key to customer)
* store_store_id (foreign key to store)

Each order belongs to one customer and one store.

### category

Stores product categories (used mainly for pizzas).

* category_id (primary key)
* name

### product

Stores products available for sale.

* product_id (primary key)
* name
* description
* image
* price
* product_type (Pizza, Burger, Drink)
* category_category_id (foreign key to category, nullable)

Only products of type "Pizza" are expected to use categories.

### employee

Stores employee data.

* employee_id (primary key)
* name
* surname
* nif
* phone
* role (Cook, Delivery)
* store_store_id (foreign key to store)

Each employee is assigned to one store.

### order_items

Stores products included in each order.

* orders_order_id (foreign key to orders)
* product_product_id (foreign key to product)
* quantity
* unit_price
* primary key (orders_order_id, product_product_id)

This table represents a many-to-many relationship between orders and products.

### delivery

Stores delivery details for orders.

* orders_order_id (primary key, foreign key to orders)
* delivery_time
* employee_employee_id (foreign key to employee)

Each delivery is linked to one order and one delivery employee.

## Relationships Summary

* One customer can have many orders.
* One store can handle many orders.
* One store can have many employees.
* One order can include many products through order_items.
* One product can appear in many orders.
* One order can have one delivery record if it is marked as delivery.
* One delivery is handled by one employee with role "Delivery".

## Constraints and Integrity

* Primary keys uniquely identify each record.
* Foreign keys enforce relationships between tables.
* ENUM is used for:

  * product_type in product
  * role in employee
* The is_delivery field indicates whether an order requires delivery.
