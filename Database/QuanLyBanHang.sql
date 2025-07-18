create database if not exists QuanLyBanHang;
use QuanLyBanHang;

create table Customer (
	cID int primary key auto_increment,
    cName varchar (50) not null,
    cAge int
);

create table `Order` (
	oID int primary key auto_increment,
    cID int not null,
    oDate datetime default current_timestamp,
    oTotalPrice double,
    foreign key (cID) references Customer (cID)
);

create table Product (
	pID int primary key auto_increment,
    pName varchar (50),
    pPrice double
);

create table OrderDetail (
	id int primary key auto_increment,
    oID int not null,
    pID int not null,
    odQTY varchar(50),
    foreign key (oID) references `Order`(oID),
    foreign key (pID) references Product(pID)
);

INSERT INTO Customer (cID, cName, cAge) VALUES 
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);

INSERT INTO `Order` (oID, cID, oDate, oTotalPrice) VALUES 
(1, 1, '2006-03-21', NULL),
(2, 2, '2006-03-23', NULL),
(3, 1, '2006-03-16', NULL);

INSERT INTO Product (pID, pName, pPrice) VALUES 
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);

INSERT INTO OrderDetail (oID, pID, odQTY) VALUES 
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(2, 1, 8),
(2, 5, 4),
(2, 3, 3);

select o.oID, o.oDate, o.oTotalPrice
from `Order` o;

select c.cName,  p.pName, count(od.odQTY) as SoLuong
from Customer c 
join `Order` o on c.cID = o.cID 
join OrderDetail od on o.oID = od.oID 
join Product p on od.pID = p.pID
group by c.cName, p.pName;

select c.cName
from Customer c
left join `Order` o on c.cID = o.cID
where o.oID is null;

select o.oID, o.oDate, sum(od.odQTY*p.pPrice)
from `Order` o
join OrderDetail od on o.oID = od.oID
join Product p on od.pID = p.pID
group by o.oID, o.oDate;