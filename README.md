# Optica Database

## Overview

Optica is a relational database designed to manage an optical store. It handles suppliers, brands, products (glasses), customers, employees, and sales transactions. The schema enforces relationships between entities using primary and foreign keys to maintain data integrity.

## Schema

The database creates a schema named `Optica`

## Tables

### `supplier`

Stores supplier information.

| Column | Type | Notes |
|--------|------|-------|
| `supplier_id` | INT | Primary key |
| `name` | VARCHAR(50) | |
| `street` | VARCHAR(50) | |
| `number` | VARCHAR(10) | |
| `floor` | VARCHAR(10) | |
| `door` | VARCHAR(10) | |
| `city` | VARCHAR(35) | |
| `postal_code` | VARCHAR(25) | |
| `country` | VARCHAR(35) | |
| `phone` | VARCHAR(25) | |
| `fax` | VARCHAR(25) | |
| `nif` | VARCHAR(15) | Unique |

---

### `brand`

Stores eyewear brands.

| Column | Type | Notes |
|--------|------|-------|
| `brand_id` | INT | Primary key |
| `name` | VARCHAR(50) | |
| `supplier_supplier_id` | INT | Foreign key → `supplier.supplier_id` |

> Each brand belongs to one supplier.

---

### `glasses`

Stores glasses available for sale.

| Column | Type | Notes |
|--------|------|-------|
| `glasses_id` | INT | Primary key |
| `frame_type` | ENUM | `Rimless`, `Plastic`, `Metal` |
| `frame_color` | VARCHAR(25) | |
| `left_lens_color` | VARCHAR(25) | |
| `right_lens_color` | VARCHAR(25) | |
| `left_lens_presciption` | DECIMAL(10,2) | |
| `right_lens_prescription` | DECIMAL(10,2) | |
| `price` | DECIMAL(10,2) | |
| `brand_brand_id` | INT | Foreign key → `brand.brand_id` |

> Each pair of glasses belongs to one brand.

---

### `customer`

Stores customer data.

| Column | Type | Notes |
|--------|------|-------|
| `customer_id` | INT | Primary key |
| `name` | VARCHAR(50) | |
| `postal_address` | VARCHAR(50) | |
| `phone` | VARCHAR(25) | |
| `email` | VARCHAR(50) | Unique |
| `registration_date` | DATETIME | |
| `recomended_by` | INT | Foreign key → `customer.customer_id`, nullable |

> A customer can optionally be recommended by another existing customer (self-referencing).

---

### `employee`

Stores employee data.

| Column | Type | Notes |
|--------|------|-------|
| `employee_id` | INT | Primary key |
| `name` | VARCHAR(50) | |

---

### `sales`

Stores sales transactions.

| Column | Type | Notes |
|--------|------|-------|
| `sales_id` | INT | Primary key |
| `sale_datetime` | DATETIME | |
| `total` | DECIMAL(10,2) | Total price |
| `customer_customer_id` | INT | Foreign key → `customer.customer_id` |
| `employee_employee_id` | INT | Foreign key → `employee.employee_id` |

> Each sale is linked to one customer and one employee.

---

### `sale_item`

Stores the items included in each sale.

| Column | Type | Notes |
|--------|------|-------|
| `glasses_glasses_id` | INT | Primary key, Foreign key → `glasses.glasses_id` |
| `sales_sales_id` | INT | Primary key, Foreign key → `sales.sales_id` |
| `quantity` | INT | |

> This table implements a many-to-many relationship between sales and glasses.

---

## Relationships Summary

| Relationship | Type |
|---|---|
| One supplier → many brands | 1:N |
| One brand → many glasses | 1:N |
| One customer → many sales | 1:N |
| One employee → many sales | 1:N |
| One sale → many glasses via `sale_item` | N:M |
| One customer → optionally recommended by another customer | 1:N (self-referencing) |

---

# Pizza Database

## Overview

Pizza is a relational database designed to manage a pizza business. It covers customers, stores, employees, products, orders, and deliveries. The schema enforces relationships between entities using primary and foreign keys to maintain data consistency.

## Schema

The database creates a schema named `Pizza`

## Tables

### `customer`

Stores customer information.

| Column | Type | Notes |
|--------|------|-------|
| `customer_id` | INT | Primary key |
| `name` | VARCHAR(50) | |
| `surname` | VARCHAR(50) | |
| `street` | VARCHAR(50) | |
| `postal_code` | VARCHAR(25) | |
| `town` | VARCHAR(35) | |
| `province` | VARCHAR(35) | |
| `phone` | VARCHAR(25) | |

---

### `store`

Stores physical store locations.

| Column | Type | Notes |
|--------|------|-------|
| `store_id` | INT | Primary key |
| `street` | VARCHAR(50) | |
| `postal_code` | VARCHAR(25) | |
| `city` | VARCHAR(35) | |
| `province` | VARCHAR(35) | |

---

### `orders`

Stores customer orders.

| Column | Type | Notes |
|--------|------|-------|
| `order_id` | INT | Primary key |
| `time` | DATETIME | Order timestamp |
| `total` | DECIMAL(10,2) | |
| `is_delivery` | TINYINT | `0` = pickup, `1` = delivery |
| `customer_customer_id` | INT | Foreign key → `customer.customer_id` |
| `store_store_id` | INT | Foreign key → `store.store_id` |

> Each order belongs to one customer and one store.

---

### `category`

Stores product categories (used mainly for pizzas).

| Column | Type | Notes |
|--------|------|-------|
| `category_id` | INT | Primary key |
| `name` | VARCHAR(50) | |

---

### `product`

Stores products available for sale.

| Column | Type | Notes |
|--------|------|-------|
| `product_id` | INT | Primary key |
| `name` | VARCHAR(50) | |
| `description` | TEXT | |
| `image` | VARCHAR(255) | |
| `price` | DECIMAL(10,2) | |
| `product_type` | ENUM | `Pizza`, `Burger`, `Drink` |
| `category_category_id` | INT | Foreign key → `category.category_id`, nullable |

> Only products of type `Pizza` are expected to use categories.

---

### `employee`

Stores employee data.

| Column | Type | Notes |
|--------|------|-------|
| `employee_id` | INT | Primary key |
| `name` | VARCHAR(50) | |
| `surname` | VARCHAR(50) | |
| `nif` | VARCHAR(15) | |
| `phone` | VARCHAR(25) | |
| `role` | ENUM | `Cook`, `Delivery` |
| `store_store_id` | INT | Foreign key → `store.store_id` |

> Each employee is assigned to one store.

---

### `order_items`

Stores products included in each order.

| Column | Type | Notes |
|--------|------|-------|
| `orders_order_id` | INT | Primary key, Foreign key → `orders.order_id` |
| `product_product_id` | INT | Primary key, Foreign key → `product.product_id` |
| `quantity` | INT | |
| `unit_price` | DECIMAL(10,2) | |

> This table represents a many-to-many relationship between orders and products.

---

### `delivery`

Stores delivery details for orders.

| Column | Type | Notes |
|--------|------|-------|
| `orders_order_id` | INT | Primary key, Foreign key → `orders.order_id` |
| `delivery_time` | DATETIME | |
| `employee_employee_id` | INT | Foreign key → `employee.employee_id` |

> Each delivery is linked to one order and one delivery employee.

---

## Relationships Summary

| Relationship | Type |
|---|---|
| One customer → many orders | 1:N |
| One store → many orders | 1:N |
| One store → many employees | 1:N |
| One order → many products via `order_items` | N:M |
| One order → one delivery record (if delivery) | 1:1 |
| One delivery → one delivery employee | N:1 |

---

## Constraints and Integrity

- Primary keys uniquely identify each record.
- Foreign keys enforce relationships between tables.
- `ENUM` is used for:
  - `product_type` in `product` (`Pizza`, `Burger`, `Drink`)
  - `role` in `employee` (`Cook`, `Delivery`)
- The `is_delivery` field indicates whether an order requires home delivery.