use TestDB

create table KHACHHANG
(	
	MaKH char(10) primary key,
	TenKH nvarchar(100),
	DchiKH nvarchar(100))
GO

create table NguoiBan
(
	TenNguoiBan varchar(50) primary key,
	MatKhau varchar(50))
GO

create table LoaiHang
(
	MaLoaiHang char(10) primary key,
	TenLoaiHang nvarchar(100))
Go

create table Hang
(
	MaSP char(10) primary key,
	TenSP nvarchar(100),
	DonVi nvarchar(20),
	GiaBan int,
	GiaNhap int,
	TonKho int,
	MaLoaiHang char(10) foreign key references LoaiHang(MaLoaiHang))
GO

create table NPP
(
	MaNPP char(10) primary key,
	TenNPP nvarchar(100),
	Dchi_NPP nvarchar(100),
	SDT_NPP varchar(11),
	DD_NPP varchar(11),
	STK_NPP varchar(20))
Go

create table HOADON
(
	MaDH char(10) primary key,
	MaKH char(10) foreign key references KHACHHANG(MaKH),
	TongTien int,
	TgBan datetime,
	TenNguoiBan varchar(50) foreign key references NguoiBan(TenNguoiBan),
	LoaiHoaDon bit) -- loại 0: hóa đơn đã bị xóa, loại 1: hóa đơn tồn tại
GO

create table HOADON_CHITIET
(
	MaDH char(10) foreign key references HOADON(MADH),
	MaSP char(10) foreign key references HANG(MaSP),
	SoLuongBan int,
	ThanhTien int,
	primary key (MaDH, MaSP))
GO

create table NHAP
(
	MaNhap char(10) primary key,
	MaNPP char(10) foreign key references NPP(MaNPP),
	TongTienNhap int,
	TgNhap datetime,
	LoaiNhap bit) -- loại 0: phiếu nhập bị xóa, loại 1: phiếu nhập đang tồn tại
GO

create table NHAP_CHITIET
(
	MaNhap char(10) foreign key references NHAP(MaNhap),
	MaSP char(10) foreign key references Hang(MaSP),
	SoLuongNhap int
	primary key(MaNhap, MaSP))
GO

----------------------------------------------------------------------------------

-- Bảng KHACHHANG

-- Bảng NGUOIBAN

-- Bảng LOAIHANG

-- Bảng HANG

-- Bảng NPP

-- Bảng HOADON

-- Bảng HOADON_CHITIET

-- Bảng NHAP

-- Bảng NHAP_CHITIET

