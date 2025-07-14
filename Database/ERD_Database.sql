create database if not exists QL_DonDatHang;
use QL_DonDatHang;

create table NHACC (
	MaNCC int primary key auto_increment,
    TenNCC varchar(50) not null,
    DiaChi varchar(255),
    SDT varchar(20)
);

create table DONDH (
	SoDH int primary key auto_increment,
    MaNCC int not null,
    NgayDH datetime default current_timestamp,
    foreign key (MaNCC) references NHACC (MaNCC)
);

create table PHIEUNHAP (
	SoPN int primary key auto_increment,
    NgayNhap datetime default current_timestamp
);

create table VATTU (
	MaVTU int primary key auto_increment,
    TenVTU varchar(20) not null
);

create table CHITIETPHIEUNHAP (
	id int primary key auto_increment,
	SoPN int not null,
    MaVTU int not null,
    DGNhap float,
    SLNhap int,
    foreign key (SoPN) references PHIEUNHAP(SoPN),
	foreign key (MaVTU) references VATTU(MaVTU)
);

create table PHIEUXUAT (
	SoPX int primary key auto_increment,
    NgayXuat datetime default current_timestamp
);

create table CHITIETPHIEUXUAT (
	id int primary key auto_increment,
	SoPX int not null,
    MaVTU int not null,
    DGXuat float,
    SLXuat int,
    foreign key (SoPX) references PHIEUXUAT(SoPX),
	foreign key (MaVTU) references VATTU(MaVTU)
);

