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