create database if not exists Furama
use furama;

create table vi_tri(
	ma_vi_tri int primary key auto_increment,
    ten_vi_tri varchar(45) not null
);

create table trinh_do (
	ma_trinh_do int primary key auto_increment,
    ten_trinh_do varchar(45) not null
);

create table bo_phan (
	ma_bo_phan int primary key auto_increment,
    ten_bo_phan varchar(45) not null
);

create table nhan_vien (
	ma_nhan_vien int primary key auto_increment,
    ho_ten varchar(45) not null,
    ngay_sinh date,
    so_cmnd varchar(45) not null,
    luong double,
    so_dien_thoai varchar(45),
    email varchar(45),
    dia_chi varchar(45),
    ma_vi_tri int not null,
    ma_trinh_do int not null,
    ma_bo_phan int not null,
    foreign key (ma_vi_tri) references vi_tri(ma_vi_tri),
    foreign key (ma_trinh_do) references trinh_do(ma_trinh_do),
    foreign key (ma_bo_phan) references bo_phan(ma_bo_phan)
);

create table loai_khach (
	ma_loai_khach int primary key auto_increment,
    ten_loai_khach varchar(45) not null
);

create table khach_hang (
	ma_khach_hang int primary key auto_increment,
    ma_loai_khach int not null,
    ho_ten varchar(45) not null,
    ngay_sinh date,
    gioi_tinh Bit(1),
    so_cmnd varchar(45) not null,
    so_dien_thoai varchar(45),
    email varchar(45),
    dia_chi varchar(45),
    foreign key (ma_loai_khach) references loai_khach (ma_loai_khach)
);

create table kieu_thue (
	ma_kieu_thue int primary key auto_increment,
    ten_kieu_thue varchar(45) not null
);

create table loai_dich_vu (
	ma_loai_dich_vu int primary key auto_increment,
    ten_loai_dich_vu varchar(45) not null
);

create table dich_vu (
	ma_dich_vu int primary key auto_increment,
    ten_dich_vu varchar(45),
    dien_tich int,
    chi_phi_thue double,
    so_nguoi_toi_da int,
    ma_kieu_thue int not null,
    ma_loai_dich_vu int not null,
    tieu_chuan_phong varchar(45),
    mo_ta_tien_nghi_khac varchar(45),
    dien_tich_ho_boi double,
    so_tang int,
    foreign key (ma_kieu_thue) references kieu_thue (ma_kieu_thue),
    foreign key (ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu)
);

create table hop_dong (
	ma_hop_dong int primary key auto_increment,
    ngay_lam_hop_dong datetime,
    ngay_ket_thuc datetime,
    tien_dat_coc double,
    ma_nhan_vien int not null,
    ma_khach_hang int not null,
    ma_dich_vu int not null,
    foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien),
    foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
    foreign key (ma_dich_vu) references dich_vu(ma_dich_vu)
);

create table dich_vu_di_kem (
	ma_dich_vu_di_kem int primary key auto_increment,
    ten_dich_vu_di_kem varchar(45) not null,
    gia double,
    don_vi varchar(10),
    trang_thai varchar(45)
);

create table hop_dong_chi_tiet (
	ma_hop_dong_chi_tiet int primary key auto_increment,
    ma_hop_dong int not null,
    ma_dich_vu_di_kem int not null,
    so_luong int,
    foreign key (ma_hop_dong)references hop_dong (ma_hop_dong),
    foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem (ma_dich_vu_di_kem)
);

-- Câu 1
insert into vi_tri(ten_vi_tri)
values 
	("Quản lý"),
    ("Nhân viên");

insert into trinh_do(ten_trinh_do) 
values 
	("Trung Cấp"),
    ("Cao Đẳng"),
    ("Đại Học"),
    ("Sau Đại Học");

insert into bo_phan(ten_bo_phan)
values
	("Sale-Marketing"),
    ("Hành chính"),
    ("Phục vụ"),
    ("Quản lý");
    
insert into nhan_vien (ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)
values
	("Nguyễn Văn An", "1970-11-07", "456231786", 10000000, "0901234121", "annguyen@gmail.com", "295 Nguyễn Tất Thành, Đà Nẵng", 1, 3, 1),
    ("Lê Văn Bình", "1997-04-09", "654231234", 7000000, "0934212314", "binhlv@gmail.com", "22 Yên Bái, Đà Nẵng", 1, 2, 2),
    ("Hồ Thị Yến", "1995-12-12", "999231723", 14000000, "0412352315", "thiyen@gmail.com", "K234/11 Điện Biên Phủ, Gia Lai", 1, 3, 2),
    ("Võ Công Toản", "1980-04-04", "123231365", 17000000, "0374443232", "toan0404@gmail.com", "77 Hoàng Diệu, Quảng Trị", 1, 4, 4),
    ("Nguyễn Bỉnh Phát", "1999-12-09", "454363232", 6000000, "0902341231", "phatphat@gmail.com", "43 Yên Bái, Đà Nẵng", 2, 1, 1),
    ("Khúc Nguyễn An Nghi", "2000-11-08", "964542311", 7000000, "0978653213", "annghi20@gmail.com", "294 Nguyễn Tất Thành, Đà Nẵng", 2, 2, 3),
    ("Nguyễn Hữu Hà", "1993-01-01", "534323231", 8000000, "0941234553", "nhh0101@gmail.com", "4 Nguyễn Chí Thanh, Huế", 2, 3, 2),
    ("Nguyễn Hà Đông", "1989-09-03", "234414123", 9000000, "0642123111", "donghanguyen@gmail.com", "111 Hùng Vương, Hà Nội", 2, 4, 4),
    ("Tòng Hoang", "1982-09-03", "256781231", 6000000, "0245144444", "hoangtong@gmail.com", "213 Hàm Nghi, Đà Nẵng", 2, 4, 4),
    ("Nguyễn Công Đạo", "1994-01-08", "755434343", 8000000, "0988767111", "nguyencongdao12@gmail.com", "6 Hoà Khánh, Đồng Nai", 2, 3, 2);
    
INSERT INTO loai_khach (ten_loai_khach) VALUES
('Diamond'),
('Platinum'),
('Gold'),
('Silver'),
('Member');

INSERT INTO khach_hang (ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi, ma_loai_khach) VALUES
('Nguyễn Thị Hảo', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng', 5),
('Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuanndieu92@gmail.com', 'K7/22 Thái Phiên, Quảng Trị', 3),
('Trương Đình Nghé', '1990-02-27', 1, '486645199', '037321122', 'nghenhan2702@gmail.com', 'K323/12 Ống Chính Hiểm, Vinh', 1),
('Đường Văn Quan', '1981-07-08', 1, '54342111', '040039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng', 1),
('Hoàng Trần Nhị Nhí', '1995-12-09', 0, '70545345', '031245678', 'nhinh123@gmail.com', '224 Lý Thái Tổ, Gia Lai', 4),
('Tôn Nữ Mộc Châu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng', 4),
('Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh', 1),
('Nguyễn Thị Hảo', '1999-04-08', 0, '96565643', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tum', 3),
('Trần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhha99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi', 1),
('Nguyễn Tâm Đắc', '1989-07-01', 1, '34434342', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng', 2);

INSERT INTO kieu_thue (ten_kieu_thue) VALUES
('year'),
('month'),
('day'),
('hour');

INSERT INTO loai_dich_vu (ten_loai_dich_vu) VALUES
('Villa'),
('House'),
('Room');

INSERT INTO dich_vu (ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, ma_kieu_thue, ma_loai_dich_vu) VALUES
('Villa Beach Front', 25000, 10000000, 10, 'vip', 'Có hồ bơi', 500, 4, 3, 1),
('House Princess 01', 14000, 5000000, 7, 'vip', 'Có thêm bếp núc', NULL, 3, 2, 2),
('Room Twin 01', 5000, 1000000, 2, 'normal', 'Có thêm bếp núc', NULL, 4, 4, 3),
('Villa No Beach Front', 22000, 9000000, 8, 'normal', 'Có hồ bơi', 300, 3, 3, 1),
('House Princess 02', 10000, 4000000, 5, 'normal', 'Có thêm bếp núc', NULL, 2, 3, 2),
('Room Twin 02', 3000, 900000, 2, 'normal', 'Có tivi', NULL, NULL, 4, 3);

INSERT INTO dich_vu_di_kem (ten_dich_vu_di_kem, gia, don_vi, trang_thai) VALUES
('Karaoke', 10000, 'gói', 'tiền nghi, hiện tại'),
('Thuê xe máy', 10000, 'chiếc', 'còn 1 xe'),
('Thuê xe đạp', 20000, 'chiếc', 'tốt'),
('Buffet buổi sáng', 15000, 'suất', 'ngày đầu tiên, trạng miếng'),
('Buffet buổi trưa', 90000, 'suất', 'ngày đầu tiên, trạng miếng'),
('Buffet buổi tối', 16000, 'suất', 'ngày đầu tiên, trạng miếng');

INSERT INTO hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu) VALUES
('2020-12-08', '2020-12-08', 0, 3, 1, 3),
('2020-07-14', '2020-07-21', 2000000, 7, 3, 1),
('2021-03-15', '2021-03-17', 50000, 3, 4, 2),
('2021-01-14', '2021-01-18', 1000000, 7, 5, 5),
('2021-07-14', '2021-07-15', 0, 7, 2, 6),
('2021-06-01', '2021-06-03', 0, 7, 7, 6),
('2021-09-02', '2021-09-05', 1000000, 7, 4, 4),
('2021-06-17', '2021-06-18', 150000, 3, 4, 1),
('2020-11-19', '2020-11-19', 0, 3, 4, 3),
('2021-04-12', '2021-04-14', 0, 10, 3, 5),
('2021-04-25', '2021-04-25', 0, 2, 2, 1),
('2021-05-25', '2021-05-27', 0, 7, 10, 1);

INSERT INTO hop_dong_chi_tiet (so_luong, ma_hop_dong, ma_dich_vu_di_kem) VALUES
(5, 2, 4),
(8, 2, 5),
(15, 2, 6),
(1, 3, 1),
(11, 3, 2),
(1, 1, 3),
(2, 1, 2),
(2, 12, 2);

-- Câu 2
SELECT *
FROM nhan_vien
WHERE (ho_ten LIKE 'H%' OR ho_ten LIKE 'T%' OR ho_ten LIKE 'K%')
AND LENGTH(ho_ten) <= 15;

-- Câu 3
SELECT *
FROM khach_hang
WHERE (YEAR(CURDATE()) - YEAR(ngay_sinh)) BETWEEN 18 AND 50
AND (dia_chi LIKE '%Đà Nẵng%' OR dia_chi LIKE '%Quảng Trị%');

-- Câu 4
SELECT kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, COUNT(hd.ma_hop_dong) AS so_lan_dat_phong
FROM khach_hang kh
LEFT JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
WHERE lk.ten_loai_khach = 'Diamond'
GROUP BY kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach
ORDER BY so_lan_dat_phong ASC;

-- Câu 5
SELECT 
    kh.ma_khach_hang,
    kh.ho_ten,
    lk.ten_loai_khach,
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    (dv.chi_phi_thue + COALESCE(SUM(hdct.so_luong * dvdk.gia), 0)) AS tong_tien
FROM khach_hang kh
LEFT JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
LEFT JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
LEFT JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
LEFT JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc;

-- Câu 6
SELECT 
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
FROM dich_vu dv
JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
WHERE dv.ma_dich_vu NOT IN (
    SELECT DISTINCT hd.ma_dich_vu
    FROM hop_dong hd
    WHERE hd.ngay_lam_hop_dong BETWEEN '2021-01-01' AND '2021-03-31'
);

-- Câu 7
SELECT 
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.so_nguoi_toi_da,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
FROM dich_vu dv
JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
WHERE dv.ma_dich_vu IN (
    SELECT hd.ma_dich_vu
    FROM hop_dong hd
    WHERE YEAR(hd.ngay_lam_hop_dong) = 2020
    GROUP BY hd.ma_dich_vu
)
AND dv.ma_dich_vu NOT IN (
    SELECT hd.ma_dich_vu
    FROM hop_dong hd
    WHERE YEAR(hd.ngay_lam_hop_dong) = 2021
    GROUP BY hd.ma_dich_vu
);

-- Câu 8
-- Cách 1
select distinct ho_ten
from khach_hang;

-- Cách 2
select ho_ten
from khach_hang
group by ho_ten;

-- Cách 3

-- Câu 9
select month(ngay_lam_hop_dong) as thang, count(hd.ma_khach_hang)
from hop_dong hd
where year(ngay_lam_hop_dong) = 2021
group by thang
order by thang;

-- Câu 10
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, if(sum(hdct.so_luong) >0, sum(hdct.so_luong), 0) as so_luong_dich_vu_di_kem
from hop_dong hd
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
group by hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc;

-- Câu 11
select distinct *
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
where lk.ten_loai_khach = 'Diamond'
and (kh.dia_chi like '%Vinh%' or kh.dia_chi like '%Quảng Ngãi%');

-- Câu 12
select hd.ma_hop_dong, nv.ho_ten, kh.ho_ten, kh.so_dien_thoai, dv.ten_dich_vu, if(sum(hdct.so_luong) > 0, sum(hdct.so_luong), 0) as so_luong_dich_vu_di_kem, hd.tien_dat_coc
from hop_dong hd
join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu 
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
where hd.ngay_lam_hop_dong between '2020-10-01' and '2020-12-31'
and hd.ngay_lam_hop_dong not in (
	select hdd.ngay_lam_hop_dong
    from hop_dong hdd
    where hdd.ngay_lam_hop_dong between '2021-01-01' and '2020-6-31'
)
group by hd.ma_hop_dong;

-- Câu 13
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as dich_vu_di_kem
from hop_dong hd
join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
having sum(hdct.so_luong) >= all (
	select sum(so_luong)
    from hop_dong_chi_tiet
    group by ma_dich_vu_di_kem
);

-- Câu 14
select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(hdct.ma_dich_vu_di_kem) as so_lan_su_dung
from hop_dong hd
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
group by hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem
having count(hdct.ma_dich_vu_di_kem) = 1; 