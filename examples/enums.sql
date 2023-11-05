CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  size ENUM('extra small', 'small', 'medium', 'large', 'extra large')
);

INSERT INTO orders (size) VALUES ('small'), ('medium'), ('large');

SELECT size, size+0 FROM orders;
