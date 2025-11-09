--membuat Database
CREATE DATABASE TokoRetailDb; 

--Gunakan DB TokoRetailDB
USE TokoRetailDB;

--membuat tabel KategoriProduk
CREATE TABLE Kategoriproduk (
   kategoriID INT IDENTITY(1,1) PRIMARY KEY,
   Namakategori VARCHAR (100) NOT NULL UNIQUE
);

--membuat tabel produk
CREATE TABLE Produk(
   ProdukID INT IDENTITY(1001,1) PRIMARY KEY,
   SKU VARCHAR(20) NOT NULL UNIQUE,
   NamaProduk VARCHAR(150) NOT NULL,
   Harga DECIMAL(10,2) NOT NULL,
   Stok INT NOT NULL,
   KategoriID INT NULL,

   --harganya gaboleh negatif
   CONSTRAINT CHK_HargaPositif CHECK (Harga >= 0),
   --stoknya gakboleh negartig
   CONSTRAINT CHK_StokPositif CHECK (Stok>=0),
   --Relasikan dengan tabel kategoriProduk memalui kategoriID
   CONSTRAINT FK_Produk_Kategori
     FOREIGN KEY (KategoriID)
     REFERENCES KategoriProduk(KategoriID)
);

--memasukan data kategoriProduk
INSERT INTO KategoriProduk (NamaKategori)
VALUES
('Eletronik');

INSERT INTO KategoriProduk (NamaKategori)
VALUES
('Pakaian'),
('Buku');

--menampilkan tabel KategoriProduk
SELECT *
FROM KategoriProduk;

--Hanya menampilkan NamaKategori
SELECT NamaKategori
FROM KategoriProduk;

--menambahkan data ke tabel Produk
INSERT INTO Produk (SKU,NamaProduk,Harga,Stok,KategoriID)
VALUES 
('ELEC-001', 'Latop gaming', 15000000.00, 50, 2);

INSERT INTO Produk (SKU,NamaProduk,Harga,Stok,KategoriID)
VALUES 
('ELEC-022', 'HP Gaming',50000000.00, 50, 1);

--menampilkan tabel Produk
SELECT *
FROM Produk;

--Mengubah data stok laptop gaming menjadi 30
UPDATE Produk
SET Stok =30
WHERE ProdukID = 1001;

--menghapus data HP Gaming
BEGIN TRANSACTION;

DELETE FROM Produk
WHERE ProdukID = 1002;

COMMIT TRANSACTION;

--menambahkan data ke tabel produk
INSERT INTO Produk (SKU,NamaProduk,Harga,Stok,KategoriID)
VALUES 
('BAJU-001' , 'Kaos Putih', 50000.00,30, 2);

INSERT INTO Produk (SKU,NamaProduk,Harga,Stok,KategoriID)
VALUES 
('BAJU-002' , 'Kaos hitam', 50000.00,30, 2);

SELECT*FROM Produk

--memnghapus kaos putih
BEGIN TRAN;
DELETE FROM Produk
WHERE ProdukID = 1005;

ROLLBACK TRANSACTION;

COMMIT TRANSACTION;