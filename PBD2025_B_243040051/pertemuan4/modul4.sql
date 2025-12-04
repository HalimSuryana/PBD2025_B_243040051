USE KampusDB;

--CROSS JOIN
--menampilkan semua mahasiswa dan mata kuliah
SELECT NamaMahasiswa FROM Mahasiswa
SELECT NamaMk FROM MataKuliah

SELECT M.NamaMahasiswa, MK.NamaMk
FROM Mahasiswa AS M
CROSS JOIN Matakuliah AS MK;

--menampilkan semua kombinasi dosen dan ruangan
SELECT D.NamaDosen, R.KodeRuangan
FROM Dosen D
CROSS JOIN Ruangan R

--LEFT JOIN
--menampilkan semua mahasiswa termasuk yang belum mengambil krs
SELECT M.NamaMahasiswa, K.MataKuliahID
FROM Mahasiswa M
LEFT JOIN KRS K ON M.MahasiswaID = K.MahasiswaID;

--menampilkan semua mata kuliah,termasuk yang belum punya jadwal
SELECT MK.NamaMk, J.Hari
FROM MataKuliah MK
LEFT JOIN JadwalKuliah J ON MK.MataKuliahID = J.MataKuliahID;

--RIGT JOIN
--Menampilkan semua jadwal, walaupun tidak ada matakuliah
SELECT MK.NamaMk, J.Hari
FROM MataKuliah Mk
RIGHT JOIN JadwalKuliah J ON MK.MataKuliahID = J.MataKuliahID;

--Menampilkan semua ruangan, apakah dipakai di jadwal atau tidak
SELECT R.KodeRuangan, J.Hari
FROM JadwalKuliah J
RIGHT JOIN Ruangan R ON J.RuanganID = R.RuanganID;

--INNER JOIN
--menampilkan nama mahasiswa dan matakuliahnya,tapi melalui tabel KRS
SELECT M.NamaMahasiswa, MK.NamaMK
FROM KRS K
INNER JOIN Mahasiswa M ON K.MahasiswaID = M.MahasiswaID
INNER JOIN MataKuliah MK ON K.MahasiswaID = MK.MataKuliahID;

--Menampilkan mata kuliah dan dosen pengampuh
SELECT MK.NamaMK, D.NamaDosen
FROM MataKuliah MK
JOIN Dosen D ON MK.DosenID = D.DosenID;

--Menampilkan jadwal lengkap
SELECT MK.NamaMk, D.NamaDosen, R.KodeRuangan, J.Hari
FROM JadwalKuliah J
INNER JOIN MataKuliah MK ON J.MatakuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON J.DosenID = D.DosenID
INNER JOIN Ruangan R ON J.RuanganID = R.RuanganID;

--Menampilkan nama mahasiswa,matakul,dan nilai Akhir
SELECT M.NamaMahasiswa, MK.NamaMK, N.NilaiAkhir
FROM Nilai N
INNER JOIN Mahasiswa M ON N.MahasiswaID = M.MahasiswaID
INNER JOIN MataKuliah MK ON N.MataKuliahID = MK.MataKuliahID;

--Menampilkan Dosen dan Matakuliah yang di ajar
SELECT D.NamaDosen, MK.NamaMK
FROM Dosen D
INNER JOIN MataKuliah MK ON D.DosenID = MK.DosenID;

--Menampilkan nama mahasiswa dan nilai akhir
SELECT M.NamaMahasiswa, N.NilaiAkhir
FROM Mahasiswa M
INNER JOIN Nilai N ON M.MahasiswaID = N.MahasiswaID;

--SELF JOIN 
--Mencari pasangan mahasiswa dari prodi yang sama
SELECT A.NamaMahasiswa AS Mahasiswa1,
       B.NamaMahasiswa AS Mahasiswa2,
       A.Prodi
FROM Mahasiswa A
INNER JOIN Mahasiswa B ON A.Prodi = B.Prodi
WHERE A.MahasiswaID < B.MahasiswaID; -- Agar gaada pasangan yang sama

--LATIHAN DI KELAS
--1
SELECT m.NamaMahasiswa, m.Prodi
FROM Mahasiswa m
INNER JOIN Nilai n ON m.MahasiswaID = n.MahasiswaID

--2
SELECT D.DosenID, R.KodeRuangan
FROM Dosen D
INNER JOIN JadwalKuliah JK ON D.DosenID = JK.DosenID
INNER JOIN Ruangan R ON JK.RuanganID = R.KodeRuangan;

--3
SELECT m.NamaMahasiswa, mk.NamaMK, d.NamaDosen
FROM Mahasiswa m
INNER JOIN Nilai n ON m.MahasiswaID= N.MahasiswaID
INNER JOIN MataKuliah mk ON n.MataKuliahID= mk.MataKuliahID
INNER JOIN Dosen d ON mk.DosenID = D.DosenID

--4
SELECT MK.NamaMK, D.NamaDosen, JK.Hari
FROM JadwalKuliah JK
INNER JOIN MataKuliah MK ON JK.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON JK.DosenID = D.DosenID;

--5
SELECT M.NamaMahasiswa, MK.NamaMK, D.NamaDosen, N.NilaiAkhir
FROM Nilai N
INNER JOIN Mahasiswa M ON N.MahasiswaID = M.MahasiswaID
INNER JOIN MataKuliah MK ON N.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON MK.DosenID = D.DosenID;