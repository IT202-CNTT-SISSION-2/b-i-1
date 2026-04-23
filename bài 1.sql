CREATE DATABASE dtb_bai1ss3;
USE dtb_bai1ss3;

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

INSERT INTO categories (name) VALUES
('Electronics'),
('Food'),
('Drink');

INSERT INTO products (name, price, category_id) VALUES
('TV', 1000, 1),
('Laptop', 1500, 1),
('Apple', 5, 2),
('Milk', 10, 2),
('Coca', 2, 3);
START TRANSACTION;

SELECT p.*
FROM products p
JOIN categories c ON p.category_id = c.id
WHERE c.name = 'Electronics';

UPDATE products p
JOIN categories c ON p.category_id = c.id
SET p.price = p.price * 0.9
WHERE c.name = 'Electronics';

SELECT p.*
FROM products p
JOIN categories c ON p.category_id = c.id
WHERE c.name = 'Electronics';
COMMIT;