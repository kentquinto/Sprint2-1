-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Pizza
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Pizza
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Pizza` DEFAULT CHARACTER SET utf8 ;
USE `Pizza` ;

-- -----------------------------------------------------
-- Table `Pizza`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizza`.`customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `surname` VARCHAR(50) NOT NULL,
  `street` VARCHAR(50) NOT NULL,
  `postal_code` VARCHAR(25) NOT NULL,
  `town` VARCHAR(35) NOT NULL,
  `province` VARCHAR(35) NOT NULL,
  `phone` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizza`.`store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizza`.`store` (
  `store_id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(50) NOT NULL,
  `postal_code` VARCHAR(25) NOT NULL,
  `city` VARCHAR(35) NOT NULL,
  `province` VARCHAR(35) NOT NULL,
  PRIMARY KEY (`store_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizza`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizza`.`orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `time` DATETIME NOT NULL COMMENT 'Order Time',
  `total` DECIMAL(10,2) NOT NULL,
  `is_delivery` TINYINT NOT NULL COMMENT '0 = false\n1 = true\n',
  `customer_customer_id` INT NOT NULL,
  `store_store_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_orders_customer1_idx` (`customer_customer_id` ASC) VISIBLE,
  INDEX `fk_orders_store1_idx` (`store_store_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `Pizza`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_store1`
    FOREIGN KEY (`store_store_id`)
    REFERENCES `Pizza`.`store` (`store_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizza`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizza`.`category` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizza`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizza`.`product` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `image` VARCHAR(200) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `product_type` ENUM("Pizza", "Burger", "Drink") NOT NULL,
  `category_category_id` INT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `fk_product_category1_idx` (`category_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_category1`
    FOREIGN KEY (`category_category_id`)
    REFERENCES `Pizza`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizza`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizza`.`employee` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `surname` VARCHAR(50) NOT NULL,
  `nif` VARCHAR(25) NOT NULL,
  `phone` VARCHAR(25) NOT NULL,
  `role` ENUM("Cook", "Delivery") NOT NULL COMMENT '\n',
  `store_store_id` INT NOT NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `fk_employee_store1_idx` (`store_store_id` ASC) VISIBLE,
  CONSTRAINT `fk_employee_store1`
    FOREIGN KEY (`store_store_id`)
    REFERENCES `Pizza`.`store` (`store_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizza`.`order_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizza`.`order_items` (
  `quantity` INT NOT NULL,
  `unit_price` DECIMAL(10,2) NOT NULL,
  `orders_order_id` INT NOT NULL,
  `product_product_id` INT NOT NULL,
  PRIMARY KEY (`orders_order_id`, `product_product_id`),
  INDEX `fk_order_items_orders1_idx` (`orders_order_id` ASC) VISIBLE,
  INDEX `fk_order_items_product1_idx` (`product_product_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_items_orders1`
    FOREIGN KEY (`orders_order_id`)
    REFERENCES `Pizza`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_items_product1`
    FOREIGN KEY (`product_product_id`)
    REFERENCES `Pizza`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizza`.`delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizza`.`delivery` (
  `delivery_time` DATETIME NOT NULL,
  `orders_order_id` INT NOT NULL,
  `employee_employee_id` INT NOT NULL,
  PRIMARY KEY (`orders_order_id`),
  INDEX `fk_delivery_employee1_idx` (`employee_employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_delivery_orders1`
    FOREIGN KEY (`orders_order_id`)
    REFERENCES `Pizza`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_employee1`
    FOREIGN KEY (`employee_employee_id`)
    REFERENCES `Pizza`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
