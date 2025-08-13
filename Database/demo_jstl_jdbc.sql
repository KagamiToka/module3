create database if not exists product_mng;
use product_mng
create table Product(
	maDH varchar(10) primary key not null,
    name varchar(50),
    description text,
    category varchar(50),
    price double,
    status varchar(50) default ('active')
);

insert into table Product(maDH, name, description, category, price, status) values
("MH01", "Swift 3", "Ultrabook with IPS display", "Laptop", 20052725, "active"),
("MH02", "Legion Y520-15IKBN", "Gaming laptop with GTX 1050", "Laptop", 26016458, "active"),
("MH03", "ASUS ROG Strix Scope NX TKL Deluxe", "Bàn phím cơ gaming TKL với switch ASUS NX Red, đèn RGB, thiết kế nhỏ gọn", "Keyboard", 3500000, "active"),
("MH04", "MSI Clutch GM41 Lightweight", "Lightweight gaming mouse with 16K DPI", "Mouse", 1302125, "active"),
("MH05", "Corsair Virtuoso RGB Wireless", "Premium wireless gaming headset with 7.1 surround", "Headphone", 4687650, "active");