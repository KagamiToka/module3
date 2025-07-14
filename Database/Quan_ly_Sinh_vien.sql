create database if not exists QLSinhVien;
use QLSinhVien;
create table Class (
	id int primary key auto_increment,
    name varchar(50) not null
);

create table Teacher (
	id int primary key auto_increment,
    name varchar(50) not null,
    age int,
    country varchar(20)
);