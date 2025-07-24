-- Bước 1: Tạo cơ sở dữ liệu demo
CREATE DATABASE IF NOT EXISTS QLProduct;
USE QLProduct;

-- Bước 2: Tạo bảng Products và chèn dữ liệu mẫu
CREATE TABLE Products (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    productCode VARCHAR(50) NOT NULL,
    productName VARCHAR(100) NOT NULL,
    productPrice DECIMAL(10,2) NOT NULL,
    productAmount INT NOT NULL,
    productDescription TEXT,
    productStatus VARCHAR(20) NOT NULL
);

-- Chèn dữ liệu mẫu
INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus) VALUES
('P001', 'Laptop Dell XPS', 1500.00, 10, 'Laptop cao cấp 15 inch', 'Active'),
('P002', 'iPhone 13', 999.00, 20, 'Smartphone Apple', 'Active'),
('P003', 'Samsung TV', 1200.00, 15, 'Smart TV 55 inch', 'Inactive'),
('P004', 'MacBook Pro', 2000.00, 8, 'Laptop Apple 16 inch', 'Active'),
('P005', 'Sony Headphones', 300.00, 30, 'Tai nghe không dây', 'Active');


-- Tạo Unique Index trên productCode
CREATE UNIQUE INDEX idx_product_code ON Products(productCode);

-- Tạo Composite Index trên productName và productPrice
CREATE INDEX idx_name_price ON Products(productName, productPrice);

-- Truy vấn mẫu
EXPLAIN SELECT * FROM Products WHERE productCode = 'P001';
EXPLAIN SELECT * FROM Products WHERE productName = 'Laptop Dell XPS' AND productPrice = 1500.00;

-- Tạo View
CREATE VIEW ProductView AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;

-- Sửa đổi View
CREATE OR REPLACE VIEW ProductView AS
SELECT productCode, productName, productPrice, productStatus, productAmount
FROM Products
WHERE productStatus = 'Active';

-- Xóa View
DROP VIEW ProductView;

-- SP lấy tất cả sản phẩm
DELIMITER //
CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT * FROM Products;
END //
DELIMITER ;

-- SP thêm sản phẩm mới
DELIMITER //
CREATE PROCEDURE AddProduct(
    IN p_productCode VARCHAR(50),
    IN p_productName VARCHAR(100),
    IN p_productPrice DECIMAL(10,2),
    IN p_productAmount INT,
    IN p_productDescription TEXT,
    IN p_productStatus VARCHAR(20)
)
BEGIN
    INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (p_productCode, p_productName, p_productPrice, p_productAmount, p_productDescription, p_productStatus);
END //
DELIMITER ;

-- SP sửa thông tin sản phẩm
DELIMITER //
CREATE PROCEDURE UpdateProduct(
    IN p_id INT,
    IN p_productCode VARCHAR(50),
    IN p_productName VARCHAR(100),
    IN p_productPrice DECIMAL(10,2),
    IN p_productAmount INT,
    IN p_productDescription TEXT,
    IN p_productStatus VARCHAR(20)
)
BEGIN
    UPDATE Products
    SET productCode = p_productCode,
        productName = p_productName,
        productPrice = p_productPrice,
        productAmount = p_productAmount,
        productDescription = p_productDescription,
        productStatus = p_productStatus
    WHERE Id = p_id;
END //
DELIMITER ;

-- SP xóa sản phẩm
DELIMITER //
CREATE PROCEDURE DeleteProduct(
    IN p_id INT
)
BEGIN
    DELETE FROM Products WHERE Id = p_id;
END //
DELIMITER ;

-- Ví dụ gọi các stored procedures:
CALL GetAllProducts();
CALL AddProduct('P006', 'New Product', 500.00, 25, 'New description', 'Active');
CALL UpdateProduct(1, 'P001', 'Updated Dell XPS', 1600.00, 12, 'Updated description', 'Active');
CALL DeleteProduct(1);