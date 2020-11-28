--------------------------------------------------------------------------
-- TẠO DATABASE
CREATE DATABASE MyShopping
GO

--------------------------------------------------------------------------
-- DÙNG DATABASE
USE MyShopping
GO

--------------------------------------------------------------------------
-- Tạo Bảng lưu thông tin Tài Khoản
IF  EXISTS (SELECT * FROM sysobjects WHERE name = N'admin' )
DROP TABLE admin
--------------------------------------------------------------------------
CREATE TABLE admin(
	user_name VARCHAR(50) NOT NULL,
	pass_word VARCHAR(255) NOT NULL,
	full_name NVARCHAR(50) NOT NULL,
	access INT NOT NULL,
	PRIMARY KEY(user_name),
)
GO

--------------------------------------------------------------------------
-- Tạo Bảng lưu thông tin Phòng Ban
IF  EXISTS (SELECT * FROM sysobjects WHERE name = N'departments' )
DROP TABLE departments
--------------------------------------------------------------------------
CREATE TABLE departments(
	id INT NOT NULL IDENTITY(1,1),
	code VARCHAR(12) NOT NULL UNIQUE,
	name_department NVARCHAR(50) NOT NULL,
	PRIMARY KEY(id)
)
GO

--------------------------------------------------------------------------
-- Tạo Bảng lưu thông tin Loại Nhân Viên
IF  EXISTS (SELECT * FROM sysobjects WHERE name = N'employee_types' )
DROP TABLE employee_types
--------------------------------------------------------------------------
CREATE TABLE employee_types(
	id VARCHAR(12) NOT NULL,
	name_employee_type NVARCHAR(50) NOT NULL,

	PRIMARY KEY (id)
)
GO

--------------------------------------------------------------------------
-- Tạo Bảng lưu thông tin Nhân Viên
IF  EXISTS (SELECT * FROM sysobjects WHERE name = N'employees' )
DROP TABLE employees
--------------------------------------------------------------------------
CREATE TABLE employees(
	id int NOT NULL IDENTITY(1,1),
	username VARCHAR(50) NOT NULL unique,
	email NVARCHAR(50) NOT NULL,
	password NVARCHAR(255) NOT NULL unique,
	name_employee NVARCHAR(50) NOT NULL,
	gender INT NOT NULL,
	photo NVARCHAR (MAX) NULL,
	address NVARCHAR(50) NOT NULL,
	number_phone NVARCHAR(25) NOT NULL,
	birthday DATETIME NOT NULL,
	access INT NOT NULL,
	activated BIT NOT NULL,
	departmentid INT NOT NULL,
	employee_typeid VARCHAR(12) NOT NULL,

	PRIMARY KEY(id),
	FOREIGN KEY(departmentid) REFERENCES departments(id) ON DELETE NO ACTION ON UPDATE CASCADE,
	FOREIGN KEY(employee_typeid) REFERENCES employee_types(id) ON DELETE NO ACTION ON UPDATE CASCADE,
)
GO

--------------------------------------------------------------------------
-- Tạo Bảng lưu thông tin Hợp Đồng
IF  EXISTS (SELECT * FROM sysobjects WHERE name = N'Contracts' )
DROP TABLE contracts
--------------------------------------------------------------------------
CREATE TABLE contracts(
	id INT NOT NULL,
	name_contract NVARCHAR(50) NOT NULL,
	start_time DATETIME NOT NULL,
	end_time DATETIME NULL,
	subsidize INT NULL,
	salary FLOAT NULL,
	status INT NOT NULL,

	PRIMARY KEY(ID),
	CONSTRAINT FK_Employees FOREIGN KEY(id) REFERENCES Employees(id)
)
GO


--------------------------------------------------------------------------
-- Tạo Bảng lưu thông tin Nhà Sản Xuát
IF EXISTS (SELECT * FROM sysobjects WHERE name = N'producers' )
DROP TABLE producers
--------------------------------------------------------------------------
CREATE TABLE producers
(
	id INT NOT NULL IDENTITY(1,1),
	name_producer NVARCHAR(50) NOT NULL,
	logo NVARCHAR(MAX) NULL,
	address NVARCHAR(50) NOT NULL,
	email NVARCHAR(50) NOT NULL,
	number_phone NVARCHAR(25) NOT NULL,
	PRIMARY KEY(id),
)
GO

--------------------------------------------------------------------------
-- Tạo Bảng lưu thông tin Danh Mục
IF EXISTS (SELECT * FROM sysobjects WHERE name = N'categories' )
DROP TABLE categories
--------------------------------------------------------------------------
CREATE TABLE categories
(
	id INT NOT NULL IDENTITY(1,1),
	name_category NVARCHAR(50) NOT NULL,
	name_categoryen NVARCHAR(50) NOT NULL,
	PRIMARY KEY(id),
)
GO

--------------------------------------------------------------------------
-- Tạo Bảng lưu thông tin Sản Phẩm
IF EXISTS (SELECT * FROM sysobjects WHERE name = N'products' )
DROP TABLE products
--------------------------------------------------------------------------
CREATE TABLE products
(
	id INT NOT NULL IDENTITY(1,1),
	name_product NVARCHAR(50) NOT NULL,
	photo NVARCHAR(MAX) NULL,
	quantity INT NOT NULL,
	product_date DATETIME NOT NULL,
	unit_brief NVARCHAR(50) NOT NULL,
	unit_price FLOAT NOT NULL,
	discount FLOAT NULL,
	description NVARCHAR(1000) NULL,
	views int NULL,
	available BIT NULL,
	special BIT NULL,
	new BIT NULL,
	status BIT NOT NULL,
	categoryid INT NOT NULL,
	producerid INT NOT NULL,

	PRIMARY KEY(id),
	CONSTRAINT FK_Products_Categories FOREIGN KEY (categoryid) REFERENCES Categories(id),
	CONSTRAINT FK_Products_Producers FOREIGN KEY (producerid) REFERENCES Producers(id)
)
GO

--------------------------------------------------------------------------
-- Tạo Bảng lưu thông tin Khách Hàng
IF EXISTS (SELECT * FROM sysobjects WHERE name = N'customers' )
DROP TABLE customers
--------------------------------------------------------------------------
CREATE TABLE customers
(
	id VARCHAR(50) NOT NULL,
	code NVARCHAR(100) NOT NULL,
	email NVARCHAR(50) NOT NULL,
	password NVARCHAR(255) NOT NULL,
	full_name NVARCHAR(50) NOT NULL,
	photo NVARCHAR(MAX) NULL,
	address NVARCHAR(50) NOT NULL,
	number_phone NVARCHAR(25) NOT NULL,
	birthday DATETIME NOT NULL,
	gender INT NOT NULL,
	access INT NOT NULL,
	activated BIT NOT NULL,

	PRIMARY KEY(id),
)
GO

--------------------------------------------------------------------------
-- Tạo Bảng lưu thông tin Đơn Hàng
IF EXISTS (SELECT * FROM sysobjects WHERE name = N'orders' )
DROP TABLE orders
--------------------------------------------------------------------------
CREATE TABLE orders
(
	id INT NOT NULL IDENTITY(1,1),
	order_date DATETIME NOT NULL,
	require_date DATETIME NOT NULL,
	amount FLOAT NOT NULL,
	receiver NVARCHAR(50) NOT NULL,
	address NVARCHAR(50) NOT NULL,
	description NVARCHAR(1000) NULL,
	status INT NOT NULL,
	number_phone VARCHAR(15)NULL,
	customerid VARCHAR(50)NULL,

	PRIMARY KEY (id),
	CONSTRAINT FK_Orders_Customers FOREIGN KEY (customerid) REFERENCES customers(id)
)
GO

--------------------------------------------------------------------------
-- Tạo Bảng lưu thông tin Chi Tiết Đơn Hàng
IF EXISTS (SELECT * FROM sysobjects WHERE name = N'order_details' )
DROP TABLE order_details
--------------------------------------------------------------------------
CREATE TABLE order_details
(
	id INT NOT NULL,
	orderid INT NOT NULL,
	productid INT NOT NULL,
	quantity INT NOT NULL,
	amount FLOAT NOT NULL,
	discount FLOAT NOT NULL,

	PRIMARY KEY (id),
	CONSTRAINT FK_orderdetails_products FOREIGN KEY (productid) REFERENCES products(id),
	CONSTRAINT FK_orderdetails_orders FOREIGN KEY (orderid) REFERENCES orders(id)
)
GO
--Tạo bảng lưu thông tin phản hồi
IF EXISTS (SELECT * FROM sysobjects WHERE name = N'feedback' )
DROP TABLE feedback
--------------------------------------------------------------------------
CREATE TABLE feedback
(
	id INT NOT NULL IDENTITY(1,1),
	name NVARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	theme VARCHAR(30) NULL,
	description NVARCHAR(1500) NOT NULL,

	PRIMARY KEY (id)
)
GO

--------------------------------------------------------------------------
--------------------------------------------------------------------------
--> QUẢN LÝ

-- Chèn dữ liệu Admin - Tài khoản
INSERT INTO Admin (user_name,pass_word,full_name,access) VALUES ('dothanhhuy@gmail.vn','hbs123','Do Thanh Huy',1);

-- Chèn dữ liệu Departments - Phòng ban
INSERT INTO departments (code,name_department) VALUES ('PB1',N'Phòng IT');
INSERT INTO departments (code,name_department) VALUES ('PB2',N'Phòng Kế Toán');
INSERT INTO departments (code,name_department) VALUES ('PB3',N'Phòng Nhân Sự');
INSERT INTO departments (code,name_department) VALUES ('PB4',N'Phòng Marketting');

-- Chèn dữ liệu EmployeeTypes - Loại nhân viên
INSERT INTO employee_types (id,name_employee_type) VALUES ('LNV1','FullTime');
INSERT INTO employee_types (id,name_employee_type) VALUES ('LNV2','PartTime');

-- Chèn dữ liệu Employees - Nhân Viên
INSERT INTO employees (username,departmentid,employee_typeid,email,password,name_employee,gender,photo,address,number_phone,birthday, access,activated)
VALUES ('dothanhhuy2000','1','LNV1','dothanhhuy@gmail.com','hbs123',N'Do Thanh Huy',1,'NV001.PNG',N'Ha Noi','01213321897','2000/03/23',1,1)


-- Chèn dữ liệu Contract - Hợp Đồng
INSERT INTO contracts (id,name_contract,start_time,end_time,subsidize,salary,status)
VALUES (1,'HD Khong Xac Dinh Thoi Han','2019/02/12','2020/05/12',500000,5000000,1)
--------------------------------------------------------------------------

--> BÁN HÀNG

-- Chèn dữ liệu Categories - Danh Mục
INSERT INTO categories (name_category,name_categoryen) VALUES (N'Điện Thoại','Phone')
INSERT INTO Categories (name_category,name_categoryen) VALUES (N'Máy Tính','Computer')
INSERT INTO Categories (name_category,name_categoryen) VALUES (N'Máy Ảnh','Camera')
INSERT INTO Categories (name_category,name_categoryen) VALUES (N'Vô Tuyến','Television')
INSERT INTO Categories (name_category,name_categoryen) VALUES (N'Đồng Hồ Thông Minh','Smart Watch')
INSERT INTO Categories (name_category,name_categoryen) VALUES (N'Nhẫn Đeo Tay','Ring')
INSERT INTO Categories (name_category,name_categoryen) VALUES (N'Mũ Nón','Hat')
INSERT INTO Categories (name_category,name_categoryen) VALUES (N'Vali','Suitcase')
INSERT INTO Categories (name_category,name_categoryen) VALUES (N'Nước Hoa','Perfume')
INSERT INTO Categories (name_category,name_categoryen) VALUES (N'Quạt','Fan')
INSERT INTO Categories (name_category,name_categoryen) VALUES (N'Xe Máy','Motorbike')


-- Chèn dữ liệu Producer - Hãng Sản Xuất
INSERT INTO  producers (name_producer,logo,address,email,number_phone) VALUES ('Apple','Apple.png',N'Hoa Kỳ', 'apple@gmail.com','113')
INSERT INTO  Producers (name_producer,logo,address,email,number_phone) VALUES ('Samsung','Samsung.jpg',N'Hàn Quốc', 'samsung@gmail.com','113')
INSERT INTO  Producers (name_producer,logo,address,email,number_phone) VALUES ('OPPO','Oppo.jpg',N'Hàn Quốc', 'oppo@gmail.com','113')
INSERT INTO  Producers (name_producer,logo,address,email,number_phone) VALUES ('Nokia','Nokia.jpg',N'Hàn Quốc', 'nokia@gmail.com','113')
--
INSERT INTO  Producers (name_producer,logo,address,email,number_phone) VALUES ('Dell','Dell.png',N'Hoa Kỳ', 'dell@gmail.com','113')
INSERT INTO  Producers (name_producer,logo,address,email,number_phone) VALUES ('Acer','Acer.png',N'Nhật Bản', 'acer@gmail.com','113')
INSERT INTO  Producers (name_producer,logo,address,email,number_phone) VALUES ('Asus','Asus.png',N'Đài Loan', 'asus@gmail.com','113')
INSERT INTO  Producers (name_producer,logo,address,email,number_phone) VALUES ('Msi','Msi.jpg',N'Nhật Bản', 'msi@gmail.com','113')
--
INSERT INTO  Producers (name_producer,logo,address,email,number_phone) VALUES ('Canon','Canon.png',N'Nhật Bản', 'canon@gmail.com','113')
INSERT INTO  Producers (name_producer,logo,address,email,number_phone) VALUES ('Sony ','Sony.jpg',N'Hoa Kỳ', 'sony@gmail.com','113')
INSERT INTO  Producers (name_producer,logo,address,email,number_phone) VALUES ('Nikon  ','Nikon.png',N'Nhật Bản', 'nikon@gmail.com','113')
--


-- Chèn dữ liệu Products - Sản Phẩm

-- MÁY TÍNH --

--Macbook--
INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Macbook Pro 15 inch Touch Bar 512GB','MT001.jpg',10,'2012/12/03',N'1 Chiếc', 69990000,0,NULL,0,1,0,0,1,2,1)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Macbook Pro 13 Touch Bar 512GB','MT002.jpg',9, '2019/12/03',N'1 Chiếc', 47999000,0,NULL,0,0,1,0,1,2,1)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Macbook 12 256GB (2017)','MT003.jpg',13, '2020/12/03',N'1 Chiếc', 33990000,0,NULL,0,0,0,1,1,2,1)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Macbook Air 13 256GB MQD42SA/A ','MT004.jpg',25, '2016/12/03',N'1 Chiếc', 28990000,0.03,NULL,0,1,0,0,1,2,1)

--Asus--
INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Asus TUF FX504GD-E4571T/i5-8300H','MT005.jpg',10, '2015/12/03',N'1 Chiếc', 21000000,0,NULL,0,1,0,0,1,2,7)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'ASUS ROG FX503VD-E4119T/i7-7700HQ ','MT006.jpg',5, '2017/12/03',N'1 Chiếc', 24500000,0,NULL,21,0,1,0,1,2,7)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Asus UX430UA-GV261T','MT007.jpg',12, '2006/02/22',N'1 Chiếc', 21300000,0,NULL,2,0,0,1,1,2,7)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Asus GL503VM - GZ219T','MT008.jpg',8, '2017/01/22',N'1 Chiếc', 32490000,0.05,NULL,1,0,0,1,1,2,7)

--Dell--
INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Dell XPS 15 9560','MT009.jpg',3, '2017/12/03',N'1 Chiếc', 53990000,0,NULL,0,0,0,1,1,2,5)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryID,producerid)
VALUES (N'Dell Ins N7370/Core i7-8550U','MT010.jpg',5, '2017/12/22',N'1 Chiếc', 53990000,0,NULL,0,0,1,0,1,2,5)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Dell N7567E','MT011.jpg',2, '2015/01/23',N'1 Chiếc', 34490000,0,NULL,0,0,0,0,1,2,5)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Dell Ins N7370/i5-8250U','MT012.jpg',2, '2020/01/23',N'1 Chiếc', 25990000,0.08,NULL,0,0,1,0,1,2,5)

--MSI--
INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'MSI GE62 6QD-1297XVN','MT013.jpg',7, '2020/01/23',N'1 Chiếc', 28900000,0,NULL,3,0,0,1,1,2,8)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'MSI GP62M 7REX-1884XVN/i7-7700HQ ','MT014.jpg',12, '2020/01/23',N'1 Chiếc', 28000000,0,NULL,0,0,1,0,1,2,8)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,Available,Special,new,status,categoryid,producerid)
VALUES (N'MSI GL72M 7REX - 1427XVN','MT015.jpg',6, '2020/01/23',N'1 Chiếc', 25990000,0,NULL,2,0,0,0,1,2,8)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'MSI GP62 6QE-1221XVN','MT016.jpg',2, '2020/01/23',N'1 Chiếc', 21890000,0,NULL,0,1,0,0,1,2,8)

-- ĐIỆN THOẠI

--Apple--
INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'iPhone X 256GB','DT001.jpg',10,'2020/01/23',N'1 Chiếc', 34790000,0,NULL,0,1,0,0,1,1,1)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'iPhone 7 Plus 32GB','DT002.jpg',23, '2020/01/23',N'1 Chiếc', 19999000,0,NULL,0,0,1,0,1,1,1)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'iPhone 8 256GB','DT003.jpg',18, '2020/01/23',N'1 Chiếc', 34790000,0,NULL,12,0,0,1,1,1,1)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'iPhone 6s Plus 32GB','DT004.jpg',14, '2020/01/23',N'1 Chiếc', 13990000,0.10,NULL,1,0,1,0,1,1,1)

--Samsung--
INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Samsung Galaxy S9 +','DT005.jpg',30, '2018/07/23',N'1 Chiếc', 24990000,0,NULL,1,1,0,0,1,1,2)

INSERT INTO Products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Samsung Galaxy Note 8','DT006.jpg',15, '2018/07/23',N'1 Chiếc', 22499000,0,NULL,1,0,1,0,1,1,2)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Samsung Galaxy A8+ (2018)','DT007.jpg',17, '2018/07/17',N'1 Chiếc', 13490000,0,NULL,0,0,0,1,1,1,2)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Samsung Galaxy J7+','DT008.jpg',14, '2018/07/23',N'1 Chiếc', 7290000,0.08,NULL,0,0,1,0,1,1,2)


--OPPO--
INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'OPPO F7 128GB','DT009.jpg',11, '2019/07/11',N'1 Chiếc', 9990000,0,NULL,0,1,0,0,1,1,3)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'SOPPO F5 6GB','DT010.jpg',12, '2018/07/23',N'1 Chiếc', 8990000,0,NULL,0,0,1,0,1,1,3)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'OPPO F5 Youth','DT011.jpg',7,'2019/07/11',N'1 Chiếc', 6190000,0,NULL,0,0,0,1,1,1,3)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'OPPO F1s 2017 (64GB)','DT012.jpg',14,'2019/07/11',N'1 Chiếc', 4990000,0.05,NULL,0,1,1,0,1,1,3)


--Nokia--
INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Nokia 8','DT013.jpg',9,'2019/07/11',N'1 Chiếc', 12990000,0,NULL,0,1,0,0,1,1,4)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Nokia 6','DT014.jpg',6,'2019/07/11',N'1 Chiếc', 5590000,0,NULL,2,0,1,0,1,1,4)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Nokia 5','DT015.jpg',17,'2019/07/11',N'1 Chiếc', 4259000,0,NULL,2,0,0,1,1,1,4)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Nokia 3','DT016.jpg',11,'2019/07/11',N'1 Chiếc', 2990000,0.03,NULL,0,1,0,1,1,1,4)

-- MÁY ẢNH

--Canon--
INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Canon EOS 3000D + Lens EF-S','MA001.jpg',14,'2019/07/11',N'1 Chiếc', 9600000,0,NULL,0,1,0,0,1,3,9)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Canon EOS M50 + Kit 15-45mm (24.1MP)','MA002.jpg',5,'2020/07/23',N'1 Chiếc', 19000000,0,NULL,9,0,1,0,1,3,9)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Canon 750D + Lens 18-55 IS STM','MA003.jpg',18,'2020/07/23',N'1 Chiếc', 12890000,0,NULL,0,0,0,1,1,3,9)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Canon Powershot G7X Mark II','MA004.jpg',3,'2020/07/23',N'1 Chiếc', 15190000,0.03,NULL,0,0,1,0,1,3,9)

--Nikon--
INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Nikon D7200 Kit 18-140mm','MA005.jpg',7,'2020/07/23',N'1 Chiếc', 25000000,0,NULL,0,1,0,0,1,3,11)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Nikon D5300 KIT 18-55 VR','MA006.jpg',6,'2020/07/23',N'1 Chiếc', 12390000,0,NULL,1,0,1,0,1,3,11)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Nikon D610','MA007.jpg',18,'2020/07/23',N'1 Chiếc', 12890000,0,NULL,0,0,0,1,1,3,11)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Nikon D5600 KIT AF-P 18-55 VR','MA008.jpg',3,CAST(0x0000A8D200000000 AS DateTime),N'1 Chiếc', 14990000,0.08,NULL,1,0,1,0,1,3,11)

--Sony--
INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Sony Alpha A7 Mark II','MA009.jpg',9,'2020/07/23',N'1 Chiếc', 31990000,0,NULL,9,1,0,0,1,3,10)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,Special,new,status,categoryid,producerid)
VALUES (N'Sony Cyber-Shot DSC-RX10 III','MA010.jpg',13,'2020/07/23',N'1 Chiếc', 27990000,0,NULL,3,0,1,0,1,3,10)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Sony Alpha A7R MARK III Body','MA011.jpg',18,'2020/07/23',N'1 Chiếc', 72990000,0,NULL,2,0,0,1,1,3,10)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Sony Alpha A6000 + 16-50mm','MA012.jpg',21,'2020/07/23',N'1 Chiếc', 13490000,0.05,NULL,3,1,0,0,1,3,10)

-- TIVI

--Samsung--
INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Smart TV 4K Samsung QLED 75 inch','TV001.jpg',5,'2020/07/23',N'1 Chiếc', 113000000,0,NULL,0,1,0,0,1,4,2)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Smart Tivi Samsung 75 inch UHD','TV002.jpg',7,'2020/07/23',N'1 Chiếc', 63990000,0,NULL,0,0,1,0,1,4,2)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Smart TV Cong 4K Samsung QLED','TV003.jpg',4,'2020/07/23',N'1 Chiếc', 61990000,0,NULL,0,0,0,1,1,4,2)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Smart TV 4K Samsung QLED 65 inch','TV004.jpg',3,'2020/07/13',N'1 Chiếc', 55900000,0.03,NULL,1,0,1,0,1,4,2)


--Sony--
INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Smart Tivi Sony 55 inch 4K','TV005.jpg',9,'2020/07/21',N'1 Chiếc', 24290000,0,NULL,0,1,0,0,1,4,10)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Smart Tivi Sony 49 inch 4K','TV006.jpg',3,'2020/02/03',N'1 Chiếc', 251990000,0,NULL,3,0,1,0,1,4,10)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Smart Tivi Sony 65 inch 4K HDR','TV007.jpg',7,'2018/07/23',N'1 Chiếc', 54099000,0,NULL,0,0,0,1,1,4,10)

INSERT INTO products (name_product, photo, quantity, product_date, unit_brief,unit_price,discount,description,views,available,special,new,status,categoryid,producerid)
VALUES (N'Smart Tivi Sony 75 inch 4K','TV008.jpg',6,'2020/07/23',N'1 Chiếc', 63990000,0.05,NULL,0,0,1,0,1,4,10)

--


-- Chèn dữ liệu Customers - Khách Hàng
INSERT INTO customers (id,code,email,password,full_name,photo,address,number_phone,birthday,gender,access,activated)
VALUES ('dothanhhuy','DO31883','dothanhhuy@gmail.com','hbs123',N'Do Thanh Huy','KH001.jpg',N'Ha Noi','01213321897','2000/03/23',1,1,1)

-- Chèn dữ liệu vào Đơn Hàng
INSERT INTO orders (order_date,require_date,amount,receiver,address,description,number_phone,status,customerid)
VALUES ('2020/07/23','2018/07/23',127970000,'Do Thanh Huy','Ha Noi',NULL,'01213321897',1,'dothanhhuy')

INSERT INTO orders (order_date,require_date,amount,receiver,address,description,number_phone,status,customerid)
VALUES ('2020/07/23','2018/07/23',85980000,'Do Thanh Huy','Ha Noi',NULL,'01213321897',2,'dothanhhuy')

INSERT INTO orders (order_date,require_date,amount,receiver,address,description,number_phone,status,customerid)
VALUES ('2020/07/23','2018/07/23',105970000,'Do Thanh Huy','Hai Phong',NULL,'01213321897',3,'dothanhhuy')

-- Chèn dữ liệu vào Đơn Hàng Chi Tiết

--INSERT INTO order_details (orderid,productid,quantity,amount,discount) VALUES (7,112,5,127970000,0)
--INSERT INTO order_details (orderid,productid,quantity,amount,discount) VALUES (8,122,5,85980000,0)
--INSERT INTO order_details (orderid,productid,quantity,amount,discount) VALUES (9,131,2,105970000,0)
