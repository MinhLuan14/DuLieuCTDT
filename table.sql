CREATE DATABASE DBSUPPORTAISTUDENTS
USE DBSUPPORTAISTUDENTS
GO

-- 1. Bảng ChuongTrinhDaoTao
CREATE TABLE ChuongTrinhDaoTao(
    MaCTDT VARCHAR(10) PRIMARY KEY,
    TenNganh NVARCHAR(100),
    TenChuyenNganh NVARCHAR(100),
    KhoaApDung NVARCHAR(20),
    TongTinChi INT
);
GO

-- 2. Bảng HocPhan
CREATE TABLE HocPhan(
    MaHP VARCHAR(10) PRIMARY KEY,
    TenHP NVARCHAR(100),
    TongTC INT,
    SoTC_LT INT,
    SoTC_TH_TN INT,
    SOTC_ThucTap INT,
    SOTC_DAMH INT,
    SOTC_KLTN INT,
    LoaiKienThuc NVARCHAR(50)
);
GO

-- 3. Bảng SinhVien
CREATE TABLE SinhVien(
    MaSV VARCHAR(10) PRIMARY KEY,
    KhoaTuyenSinh NVARCHAR(50),
    ChuyenNganh NVARCHAR(100),
    GioiTinh VARCHAR(10),
    Lop VARCHAR(20),
    NamHoc INT,
    TrangThai NVARCHAR(50),
    MaCTDT  VARCHAR(10),
    FOREIGN KEY(MaCTDT) REFERENCES ChuongTrinhDaoTao(MaCTDT)
);
GO

-- 4. Bảng CTDTChi_Tiet
CREATE TABLE CTDTChi_Tiet(
    MaCTDT VARCHAR(10),
    MaHP VARCHAR(10),
    HocKyGoiY INT,
    LoaiMonCTDT NVARCHAR(50),
    PRIMARY KEY(MaCTDT, MaHP),
    FOREIGN KEY (MaCTDT) REFERENCES ChuongTrinhDaoTao(MaCTDT),
    FOREIGN KEY (MaHP) REFERENCES HocPhan(MaHP)
);
GO

-- 5. Bảng ThanhTich,
CREATE TABLE ThanhTich(
    MaSV VARCHAR(10),
    HocKyNamHoc VARCHAR(20),
    TongTCHocKy INT,
    GPAHocKYHe4 FLOAT,
    GPAHocKYHe10 FLOAT,
    TongTCTichLuy INT,
    GPATichLuyHe10 FLOAT,
    GPATichLuyHe4 FLOAT,
    SoMonRoT INT,
    PRIMARY KEY(MaSV, HocKyNamHoc),
    FOREIGN KEY(MaSV) REFERENCES SinhVien(MaSV)
);
GO

-- 6. Bảng KetQuaHocTap
CREATE TABLE KetQuaHocTap(
    IDKetQua INT UNIQUE,
    MaSV VARCHAR(10),
    MaHP VARCHAR(10),
    HocKyNamHoc VARCHAR(20),
    ThangDiem10 FLOAT,
    ThangDiem4 FLOAT,
    DiemChu VARCHAR(5),
    SoLanHoc INT,
    PRIMARY KEY (MaSV, MaHP, HocKyNamHoc),
    FOREIGN KEY (MaSV) REFERENCES SinhVien(MaSV),
    FOREIGN KEY (MaHP) REFERENCES HocPhan(MaHP)
);
GO

-- 7. Bảng TienQuyet
CREATE TABLE TienQuyet(
    Ma_HP_Sau VARCHAR(10),
    Ma_HP_Truoc VARCHAR(10),
    PRIMARY KEY (Ma_HP_Sau,Ma_HP_Truoc),
    FOREIGN KEY (Ma_HP_Sau) REFERENCES HocPhan(MaHP),
    FOREIGN KEY (Ma_HP_Truoc) REFERENCES HocPhan(MaHP)
);
GO

-- 8. Bảng LSDuDoanAI
CREATE TABLE LSDuDoanAI(
    IDDuDoan INT PRIMARY KEY,
    MaSV VARCHAR(10),
    Hoc_Ky_Du_Doan VARCHAR(20),
    Du_Doan_GPA_Hoc_Ky FLOAT,
    Rui_Ro_Rot_Hoc_Vu VARCHAR(50),
    Ket_Qua_Thuc_Te_GPA FLOAT,
    Ket_Qua_Thuc_Te_Rot VARCHAR(50),
    FOREIGN KEY (MaSV) REFERENCES SinhVien(MaSV)
);
GO

