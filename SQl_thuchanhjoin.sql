create database Khoa;
use khoa;
CREATE TABLE `khoa`.`khoa` (
  `idKhoa` VARCHAR(10) NOT NULL,
  `tenkhoa` VARCHAR(30) NOT NULL,
  `dienthoai` VARCHAR(10) NULL,
  PRIMARY KEY (`idKhoa`),
  UNIQUE INDEX `tenkhoa_UNIQUE` (`tenkhoa` ASC) VISIBLE,
  UNIQUE INDEX `dienthoai_UNIQUE` (`dienthoai` ASC) VISIBLE);
  create table GiangVien(
  magv int primary key,
  hotengv varchar(30) not null,
  luong decimal(5,2),
  makhoa char(10),
  foreign key (makhoa) references khoa(idKhoa)
  );
  create table SinhVien(
  masv int primary key,
  hotensv varchar(30) not null,
  makhoa char(10),
  foreign key (makhoa) references khoa(idKhoa),
  namsinh int not null,
  quequan varchar(30) not null
  );
  create table DeTai(
  madt char(10) primary key,
  tendt char(30),
  kinhphi int, 
  NoiThucTap varchar(30)
  );	
create table HuongDan(
masv int,
foreign key (masv) references SinhVien(masv),
madt char(10),
foreign key (madt) references DeTai(madt),
 magv int primary key,
 ketqua decimal(5,2)
 ); 
INSERT INTO khoa VALUES
 ('Geo','Dia ly va QLTN',3855413),
 ('Math','Toan',3855411),
 ('Bio','Cong nghe sinh hoc',3855412);
 INSERT INTO giangvien VALUES
 (11,'Thanh Binh',700,'Geo'), 
 (12,'Thu Huong',500,'Math'),
 (13,'Chu Vinh',650,'Geo'),
 (14,'Le Thi Ly',500,'Bio'),
 (15,'Tran Son',900,'Math');
 INSERT INTO sinhvien VALUES
 (1,'Le Van Son','Bio',1990,'Nghe An'),
 (2,'Nguyen Thi Mai','Geo',1990,'Thanh Hoa'),
 (3,'Bui Xuan Duc','Math',1992,'Ha Noi'),
 (4,'Nguyen Van Tung','Bio',1992,'Ha Tinh'),
 (5,'Le Khanh Linh','Bio',1989,'Ha Nam'),
 (6,'Tran Khac Trong','Geo',1991,'Thanh Hoa'),
 (7,'Le Thi Van','Math',1994,'null'),
 (8,'Hoang Van Duc','Bio',1992,'Nghe An');
 INSERT INTO detai VALUES
 ('Dt01','GIS',100,'Nghe An'),
 ('Dt02','ARC GIS',500,'Nam Dinh'),
 ('Dt03','Spatial DB',100, 'Ha Tinh'),
 ('Dt04','MAP',300,'Quang Binh' );
 INSERT INTO huongdan VALUES
 (1,'Dt01',13,8),
 (2,'Dt03',14,0),
 (3,'Dt03',12,10),
 (5,'Dt04',14,7),
 (6,'Dt01',13,7),
 (7,'Dt04',11,10),
 (8,'Dt03',15,6);
select magv,hotengv,makhoa from giangvien;
select magv,hotengv,makhoa from giangvien inner join  khoa
on khoa.tenkhoa ='Dia ly va QLTN';
select * from giangvien inner join  khoa
on khoa.tenkhoa ='Dia ly va QLTN';
select masv from sinhvien inner join khoa
on khoa.idKhoa=sinhvien.makhoa 
where khoa.tenkhoa ='Cong nghe sinh hoc';
select masv, hotensv,(year(now())-namsinh) as 'tuoi' from sinhvien inner join khoa
on  khoa.idKhoa=sinhvien.makhoa 
where khoa.tenkhoa='Toan';
select * from sinhvien left join huongdan
on sinhvien.masv=huongdan.masv
where huongdan.masv is null;
 