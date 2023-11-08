-- UP SCRIPT 
DROP TABLE IF EXISTS states
CREATE TABLE states
(
    state_name VARCHAR(50) NOT NULL PRIMARY KEY
)

DROP TABLE IF EXISTS products

CREATE TABLE products
(
    product_name VARCHAR(50) NOT NULL PRIMARY KEY,
)

DROP TABLE IF EXISTS user_types

CREATE TABLE user_types
(
    user_type_name VARCHAR(15) NOT NULL PRIMARY KEY
)
INSERT INTO user_types
    (user_type_name)
VALUES('Farmer')
INSERT INTO user_types
    (user_type_name)
VALUES('Distributor')
INSERT INTO user_types
    (user_type_name)
VALUES('Customer')

DROP TABLE IF EXISTS users

CREATE TABLE users
(
    user_id VARCHAR(50) NOT NULL PRIMARY KEY,
    user_type VARCHAR(15) NOT NULL,
    FOREIGN KEY(user_type) REFERENCES user_types(user_type_name),
    user_password VARCHAR(50) NOT NULL
)

DROP TABLE IF EXISTS farmers

CREATE TABLE farmers
(
    farmer_id VARCHAR(50) NOT NULL PRIMARY KEY,
    FOREIGN KEY(farmer_id) REFERENCES users(user_id),
    farmer_name VARCHAR(50) NOT NULL,
    -- farmer_email VARCHAR(50) NOT NULL,
    -- FOREIGN KEY(farmer_email) REFERENCES users(user_id),
    farmer_phone VARCHAR(50) NOT NULL,
    farmer_state VARCHAR(50) NOT NULL,
    FOREIGN KEY(farmer_state) REFERENCES states(state_name),
    farmer_zipcode VARCHAR(50) NOT NULL,
)

DROP TABLE IF EXISTS farmer_inventories
CREATE TABLE farmer_inventories
(
    farmer_inventory_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    farmer_id VARCHAR(50),
    FOREIGN KEY(farmer_id) REFERENCES farmers(farmer_id),
    product_name VARCHAR(50) NOT NULL,
    product_quantity INT NOT NULL,
    product_last_updated DATETIME NOT NULL
)

DROP TABLE IF EXISTS distributors
CREATE TABLE distributors
(
    distributor_id VARCHAR(50) NOT NULL PRIMARY KEY,
    FOREIGN KEY(distributor_id) REFERENCES users(user_id),
    distributor_name VARCHAR(50) NOT NULL,
    -- distributor_email VARCHAR(50) NOT NULL,
    -- FOREIGN KEY(distributor_email) REFERENCES users(user_id),
    distributor_phone VARCHAR(50) NOT NULL,
    distributor_state VARCHAR(50) NOT NULL,
    FOREIGN KEY(distributor_state) REFERENCES states(state_name),
    distributor_zipcode VARCHAR(50) NOT NULL,
)

DROP TABLE IF EXISTS distributor_inventories
CREATE TABLE distributor_inventories
(
    distributor_inventory_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    distributor_id VARCHAR(50) NOT NULL,
    FOREIGN KEY(distributor_id) REFERENCES distributors(distributor_id),
    product_name VARCHAR(50) NOT NULL,
    product_quantity VARCHAR(50) NOT NULL,
    product_last_updated DATETIME NOT NULL
)

DROP TABLE IF EXISTS customers
CREATE TABLE customers
(
    customer_id VARCHAR(50) NOT NULL PRIMARY KEY,
    FOREIGN KEY(customer_id) REFERENCES users(user_id),
    customer_name VARCHAR(50) NOT NULL,
    -- customer_email VARCHAR(50) NOT NULL,
    -- FOREIGN KEY(customer_email) REFERENCES users(user_id),
    customer_phone VARCHAR(50) NOT NULL,
    customer_state VARCHAR(50) NOT NULL,
    FOREIGN KEY(customer_state) REFERENCES states(state_name),
    customer_zipcode VARCHAR(50) NOT NULL,
)

DROP TABLE IF EXISTS customer_inventories
CREATE TABLE customer_inventories
(
    customer_inventory_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id VARCHAR(50) NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
    product_name VARCHAR(50) NOT NULL,
    product_quantity VARCHAR(50) NOT NULL,
    product_last_updated DATETIME NOT NULL
)

DROP TABLE IF EXISTS transaction_types
CREATE TABLE transaction_types
(
    transaction_between VARCHAR(50) NOT NULL PRIMARY KEY
)
INSERT INTO transaction_types
    (transaction_between)
VALUES('Farmer & Distributor')
INSERT INTO transaction_types
    (transaction_between)
VALUES('Distributor & Customer')
INSERT INTO transaction_types
    (transaction_between)
VALUES('Farmer & Customer')
INSERT INTO transaction_types
    (transaction_between)
VALUES('Self')

DROP TABLE IF EXISTS transactions
CREATE TABLE transactions
(
    transaction_id INT IDENTITY(1,1) PRIMARY KEY,
    transaction_seller_id VARCHAR(50) NOT NULL,
    FOREIGN KEY(transaction_seller_id) REFERENCES users(user_id),
    transaction_buyer_id VARCHAR(50) NOT NULL,
    FOREIGN KEY(transaction_buyer_id) REFERENCES users(user_id),
    transaction_type VARCHAR(50) NOT NULL,
    FOREIGN KEY(transaction_type) REFERENCES transaction_types(transaction_between),
    transaction_product_name VARCHAR(50) NOT NULL,
    FOREIGN KEY(transaction_product_name) REFERENCES products(product_name),
    transaction_product_quantity INT NOT NULL,
    transaction_total_cost MONEY NOT NULL,
    transaction_date DATE DEFAULT GETDATE()
)


-- -- DOWN SCRIPT
-- -- drop foreign keys
-- ALTER TABLE distributors DROP CONSTRAINT IF EXISTS FK_distributors_users;
-- ALTER TABLE distributor_inventories DROP CONSTRAINT IF EXISTS FK_distributor_inventories_distributors;
-- ALTER TABLE distributor_inventories DROP CONSTRAINT IF EXISTS FK_distributor_inventories_products;
-- ALTER TABLE customers DROP CONSTRAINT IF EXISTS FK_customers_users;
-- ALTER TABLE customer_inventories DROP CONSTRAINT IF EXISTS FK_customer_inventories_customers;
-- ALTER TABLE customer_inventories DROP CONSTRAINT IF EXISTS FK_customer_inventories_products;
-- ALTER TABLE transactions DROP CONSTRAINT IF EXISTS FK_transactions_users_seller;
-- ALTER TABLE transactions DROP CONSTRAINT IF EXISTS FK_transactions_users_buyer;
-- ALTER TABLE transactions DROP CONSTRAINT IF EXISTS FK_transactions_transaction_types;
-- ALTER TABLE transactions DROP CONSTRAINT IF EXISTS FK_transactions_products;

-- -- drop tables
-- DROP TABLE IF EXISTS transactions;
-- DROP TABLE IF EXISTS customer_inventories;
-- DROP TABLE IF EXISTS customers;
-- DROP TABLE IF EXISTS distributor_inventories;
-- DROP TABLE IF EXISTS distributors;
-- DROP TABLE IF EXISTS farmer_inventories;
-- DROP TABLE IF EXISTS farmers;
-- DROP TABLE IF EXISTS products;
-- DROP TABLE IF EXISTS users;
-- DROP TABLE IF EXISTS transaction_types;
-- DROP TABLE IF EXISTS user_types;
-- DROP TABLE IF EXISTS states;






