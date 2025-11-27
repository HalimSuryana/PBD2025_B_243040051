--Menampilkan semua data pada tabel product
SELECT *
FROM Production.Product;

--Menampikan Name, ProductNumber, dan ListPrice
SELECT Name, ProductNumber, ListPrice
FROM Production.Product;

--Menampikan data menggunakan alias kolom
SELECT Name AS [Nama Barang], ListPrice AS 'Harga Jual'
FROM Production.Product;

--Menampikan HargaBaru = ListPrice * 1.1
SELECT Name, Listprice, (ListPrice*1.1) AS HargaBaru
FROM Production.Product;

--Menampikan data dengan Menggunakan String
SELECT Name + '(' + ProductNumber + ')' AS ProdukLengkap
FROM Production.Product;

--Filterasi Data
--Menampilkan produk yang berwarna 'red'
SELECT Name,Color, ListPrice
FROM Production.Product
WHERE Color = 'red';

--Menampikan Produk yang ListPricenya lebih dari 10000
SELECT Name,ListPrice
FROM Production.Product
WHERE ListPrice < 1000;

--Menampikan Produk yang warna HITAM dan list pricenya Lebih dari 500
SELECT Name,Color, ListPrice
FROM Production.Product
WHERE Color = 'black' AND ListPrice >500;

--menampikan produk yang berwarna red,blue,ATAU HITAM
SELECT Name,Color
FROM Production.Product
WHERE Color IN ('red', 'blue', 'black')

--menampilakan produk yang namanya mengandung kata 'road'
SELECT Name,ProductNumber
FROM Production.Product
WHERE NAME LIKE '%Road%';

--Agregasi dan pengelompokan
--menghitung total baris
SELECT COUNT(*) AS TotalProduk
FROM Production.Product;

--menampilkan warna produk dan jumlahnya
SELECT Color, COUNT(*) AS JumlahProdukFROM 
FROM Production.Product
GROUP BY Color;

--menampilkan ProductID ,jumlah OrderQty, dan rata2 UnitPrice
SELECT ProductID, SUM(OrderQty) AS TotalTerjual, AVG(UnitPrice) AS RataRataHarga
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

SELECT *
FROM Sales.SalesOrderDetail

--Menampilkan data dengan grouping lebih dari satu kolom
SELECT Color,Size,COUNT(*) AS jumlah
FROM Production.Product
GROUP BY ProductID;

SELECT *
FROM Production.Product

--Filter Hasil Agregasi
--menampilkan warna produk yang jumlahnya lebih dari 2
SELECT Color,COUNT(*) AS jumlah
FROM Production.Product
GROUP BY Color
HAVING COUNT(*) > 2;

--menampilkan warna produk yang ListPricenya > 500 dan jumlahnya > 1
SELECT Color,COUNT(*) AS jumlah
FROM Production.Product
WHERE ListPrice > 500
GROUP BY Color
HAVING COUNT(*) > 1;

--menampilkan ProductID yang jumlah OrderQtynya lebih dari 100
SELECT ProductID, SUM(OrderQty) AS RataRataBeli
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM (Orderqty) > 10;

--menampilkan SpecialOfferID yang rata2 OrderQty Kurang dari 2
SELECT SpecialOfferID, AVG(OrderQty) AS RataRataBeli
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID
HAVING AVG (Orderqty) > 2;

--menampilkan warna yang ListPricenya Lebih dari 3000 menggunakan MAX 
SELECT Color
FROM Production.Product
GROUP BY Color
HAVING MAX (ListPrice) > 3000;

--Advanced Select dan Order By
--Menampilkan JobTitel tanpa duplikat
SELECT DISTINCT JobTitle
FROM HumanResources.Employee;

SELECT JobTitle
FROM HumanResources.Employee;

--menampilkan 5 nama produk termahal
SELECT TOP 5 Name,ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;

--OFFSET FETCJ
SELECT Name,ListPrice
FROM Production.Product
ORDER BY ListPrice DESC
OFFSET 2 ROWS
FETCH NEXT 4 ROWS ONLY;

SELECT Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC

SELECT TOP 3 Color, SUM(ListPrice) AS TotalNilaiStok
FROM Production.Product
WHERE ListPrice > 0
GROUP BY Color
ORDER BY ListPrice DESC;


--Tugas Mandri
-- no 1
SELECT ProductID,SUM(LineTotal) AS TotalUang -- menampilkan ProductID & LineTotal AS TotalUang dan setiap kelompok produk, SQL melakukan SUM(LineTotal).
FROM Sales.SalesOrderDetail -- SQL mengambil semua data dari kolom SalesOrderDetail.
GROUP BY ProductID; -- Mengelompok kan baris berdasarkan ProductID.

--no 2
SELECT ProductID, SUM(LineTotal) AS TotalUang -- Menampilkan ProductID dan total uangnya, lalu menghitung total uang per produk dari baris yang sudah lolos filter.
FROM Sales.SalesOrderDetail -- Ambil semua data dari SalesOrderDetail.
WHERE OrderQty >= 2 -- SQL menyaring baris – hanya transaksi dengan OrderQty minimal 2 yang diproses.
GROUP BY ProductID; -- Setelah disaring, data dikelompokkan berdasarkan ProductID.

-- no 3
SELECT ProductID, SUM(LineTotal) AS TotalUang -- Menampilkan total uang dari tiap produk.
FROM Sales.SalesOrderDetail -- Mengambil data dari SalesOrderDetail.
WHERE OrderQty >= 2 -- Filter: hanya transaksi dengan jumlah beli minimal 2.
GROUP BY ProductID; -- Mengelompokkan berdasarkan ProductID (tahap inti dari nomor 3).
;

-- no 4
SELECT ProductID, SUM(LineTotal) AS TotalUang -- Menampilkan ProductID & total pendapatan.
FROM Sales.SalesOrderDetail -- Mengambil data dari tabel SalesOrderDetail.
WHERE OrderQty >= 2 -- Filter awal: hanya transaksi OrderQty >= 2.
GROUP BY ProductID -- SQL mengelompokkan baris berdasarkan ProductID.
HAVING SUM(LineTotal) > 50000; -- Filter hasil agregasi: hanya produk dengan total > 50.000.


-- no 5
SELECT ProductID, SUM(LineTotal) AS TotalUang -- Menampilkan ProductID & total pendapatan.
FROM Sales.SalesOrderDetail -- Sumber data SalesOrderDetail.
WHERE OrderQty >= 2 -- Filter baris sebelum pengelompokan.
GROUP BY ProductID -- Kelompokkan per produk.
HAVING SUM(LineTotal) > 50000 -- Filter hasil agregasi.
ORDER BY TotalUang DESC; -- Mengurutkan dari pendapatan terbesar ke terkecil.


-- no 6 
SELECT TOP 10 ProductID, SUM(LineTotal) AS TotalUang -- Menampilkan 10 produk dengan pendapatan tertinggi.
FROM Sales.SalesOrderDetail -- Mengambil semua data transaksi.
WHERE OrderQty >= 2 -- Filter transaksi dengan OrderQty minimal 2.
GROUP BY ProductID -- Mengelompokkan baris berdasarkan ProductID.
HAVING SUM(LineTotal) > 50000 -- Hanya produk dengan total uang > 50.000.
ORDER BY TotalUang DESC; -- Urutkan dari total pendapatan tertinggi.