create database if not exists product_mg;
use product_mg;

create table Product(
	maDH varchar(10) primary key not null,
    name varchar(50),
    description text,
    price double,
    status varchar(50) default ('active')
);

create table Category(
	id int primary key not null,
    name varchar(50)
);

alter table Product 
add category_id int not null;

alter table Product 
add constraint cate_id foreign key (category_id) references Category(id);

insert into Category(id, name) values
(1, 'Laptop'), (2, 'Keyboard'), (3, 'Mouse'), (4, 'Headphone');

insert into Product(maDH, name, description, category_id, price, status) values
("MH01", "Swift 3", "Ultrabook with IPS display", 1, 20052725, "active"),
("MH02", "Legion Y520-15IKBN", "Gaming laptop with GTX 1050", 1, 26016458, "active"),
("MH03", "ASUS ROG Strix Scope NX TKL Deluxe", "Bàn phím cơ gaming TKL với switch ASUS NX Red, đèn RGB, thiết kế nhỏ gọn", 2, 3500000, "active"),
("MH04", "MSI Clutch GM41 Lightweight", "Lightweight gaming mouse with 16K DPI", 3, 1302125, "active"),
("MH05", "Corsair Virtuoso RGB Wireless", "Premium wireless gaming headset with 7.1 surround", 4, 4687650, "active");

select * from Product;

select p.maDH, p.name, p.description, c.name as category, p.price, p.status
from Product p 
join Category c on p.category_id = c.id;

select p.maDH, p.name, p.description, c.name as category, p.price, p.status
from Product p 
join Category c on p.category_id = c.id
where c.name = "Laptop";