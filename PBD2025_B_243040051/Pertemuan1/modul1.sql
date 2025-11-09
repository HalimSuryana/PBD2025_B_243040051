--membuat database
CREATE DATABASE UNPAS;

USE Localhost;

--membuat tabel mahasiswa
CREATE TABLE Mahasiswa (
    npm CHAR(9),
    nama VARCHAR(100),
    jurusan VARCHAR(50)

);

EXEC sp_help 'Mahasiswa';

--mengubah tabel memakai ALTER TABLE
--Memnambah kolom
ALTER TABLE mahasiswa
ADD alamat VARCHAR (100) NOT NULL;

--mengubah tipe data 
ALTER TABLE Mahasiswa
ALTER COLUMN nama VARCHAR(50);

--menambahkan constraint unique
ALTER TABLE Mahasiswa
ADD CONSTRAINT UQ_npm_mahasiswa UNIQUE (npm);

--membuat tabel Dosen
CREATE TABLE Dosen (
   nama VARCHAR(50),
   nip CHAR(9),
   alamat VARCHAR(100),
   prodi VARCHAR(50)
 );

--menghapus tabel
DROP TABLE Dosen;

--menghapus data base
DROP DATABASE Localhost;

--menambahkan not nul pada kolom nip
ALTER TABLE Dosen 
ALTER COLUMN nip CHAR (9) NOT NULL;

--membahkan pk di kolom nip pada tabel dosen
ALTER TABLE Dosen
ADD CONSTRAINT Pk_nip_dosen PRIMARY KEY (nip);

--menghapus constraint unique pada kolom npm
ALTER TABLE mahasiswa
DROP CONSTRAINT UQ_npm_mahasiswa;

--menambahkan not nul pada kolom npm
ALTER TABLE mahasiswa 
ALTER COLUMN npm CHAR (9) NOT NULL;

--membahkan pk di kolom nip pada tabel mahasiwa
ALTER TABLE mahasiswa
ADD CONSTRAINT Pk_npm_mahasiswa PRIMARY KEY (npm);

--menambahkan nip ke tabel mahasiswa 
ALTER TABLE mahasiswa 
ADD nip_pembimbing CHAR(9);

--menambahkan foresign key di tabel mahasiswa
ALTER TABLE Mahasiswa
ADD CONSTRAINT Fk_mahasiswa_dosen 
FOREIGN KEY (nip_pembimbing)
REFERENCES Dosen(nip);