CREATE DATABASE [Minions]

CREATE TABLE [Minions](
		[Id] INT PRIMARY KEY NOT NULL,
		[Name] NVARCHAR(50),
		[Age] INT
)

ALTER TABLE [Minions]
ADD CONSTRAINT PK_IdMinions PRIMARY KEY (Id)

CREATE TABLE [Towns](
		[Id] INT PRIMARY KEY NOT NULL,
		[Name] NVARCHAR(50)
)

ALTER TABLE [Towns] ADD [TownId] FK_TownId FOREIGN KEY REFERENCES Towns(Id)

ALTER TABLE [Towns]
DROP CONSTRAINT [Id]



ALTER TABLE [Minions]
DROP CONSTRAINT [PK__Minions__3214EC0783700869]

ALTER TABLE [Minions]
DROP CONSTRAINT [Id]

ALTER TABLE [Towns]
DROP CONSTRAINT [PK__Towns__3214EC07EF27110C]

INSERT INTO [Towns] VALUES
		(1, 'Sofia'),
		(2, 'Plovdiv'),
		(3, 'Varna')


ALTER TABLE [Minions]
ADD [TownID] INT

ALTER TABLE [Minions]
ADD CONSTRAINT FK_TownIdMinions FOREIGN KEY (TownId) REFERENCES Towns(Id)



INSERT INTO [Minions] VALUES 
		(1, 'Kevin', 22, 1),
		(2, 'Bob', 15, 3),
		(3, 'Steward', NULL, 2)

ALTER TABLE [Minions] ALTER COLUMN [TownId] INT NOT NULL;

DELETE FROM [Minions];

DROP TABLE [Minions];

DROP TABLE [Towns];

CREATE TABLE [People](
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[Name] NVARCHAR(200) NOT NULL,
	[Picture] VARBINARY(MAX),
	CHECK (DATALENGTH([Picture]) <= 2000000),
	[Height] DECIMAL(4,2),
	[Weight] DECIMAL(4,2),
	[Gender] VARCHAR(1) NOT NULL,
	[Birthdate] DATE NOT NULL,
	[Biography] NVARCHAR(MAX)
)

INSERT INTO [People] VALUES
		('Kevin', 200000, 1.23, 80.23, 'm', '1996-12-01', 'sdfgdsaag'),
		('Bob', 1452, 1.32, 80.23, 'm', '1996-12-01', 'sdfgdsaag'),
		('Steward', 24524, 1.40, 80.23, 'm', '1996-12-01', 'sdfgdsaag'),
		('Kris', 15, 1.85, 80.23, 'm', '1996-12-01', 'sdfgdsaag'),
		('Sponjebob', 12345, 1.80, 80.20, 'm', '1996-12-01', 'sdfgdsaag')

ALTER TABLE [People] ALTER COLUMN [Height] DECIMAL(4,2);

ALTER TABLE [People] ALTER COLUMN [Weight] DECIMAL(4,2);

ALTER TABLE [People] ALTER COLUMN [Gender] VARCHAR(1);

CREATE TABLE [Users](
	[Id] BIGINT IDENTITY PRIMARY KEY NOT NULL,
	[Username] VARCHAR(30) UNIQUE NOT NULL,
	[Password] VARCHAR(30) NOT NULL,
	[ProfilePicture] VARBINARY(MAX),
	CHECK (DATALENGTH ([ProfilePicture]) <= 900000),
	[LastLoginTime] DATETIME2,
	[IsDeleted] BIT
)

INSERT [Users] VALUES 
	('Kevin', 'pass', 500, '2005-03-14', 0),
	('Sam', 'passe', 500, '2005-04-24', 1),
	('Kris', 'passd', 500, '2006-05-03', 1),
	('Ivan', 'passsss', 500, '2005-04-14', 0),
	('Mario', 'passw1', 500, '2007-03-14', 1)

ALTER TABLE [Users] DROP [PK__Users__3214EC0798B2529E];

ALTER TABLE [Users] ADD CONSTRAINT PK_MultipleKey PRIMARY KEY (Id, Username);

SELECT [Password] FROM [Users] WHERE LEN(Password) >= 5;

ALTER TABLE [Users] ADD CONSTRAINT DT_DefaultValue DEFAULT SYSDATETIME() FOR [LastLoginTime];

INSERT INTO [Users] (Username, [Password], ProfilePicture, IsDeleted) VALUES ('KrulTepes', 'password', 500, 1);

ALTER TABLE [Users] ADD CHECK(LEN(Password) >= 5);

ALTER TABLE [Users] ADD CHECK (LEN([Password]) > 5);

SELECT TABLE_NAME,
       CONSTRAINT_TYPE,CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME= 'Users';

--SELECT [Id] FROM [Users] ORDER BY [Id] DESC LIMIT 1;

--DELETE FROM [Users] WHERE [Id] = LEN(Id);

--DELETE FROM [Users] WHERE [Id] = MAX(Id);

SELECT * FROM [Users];

DELETE FROM [Users] WHERE [Id] = MAX(Id);

ALTER TABLE [Users] DROP [UQ__Users__536C85E4076B0F13];

ALTER TABLE [Users] ADD CONSTRAINT UQ_Usern UNIQUE (Username);

ALTER TABLE [Users] DROP [PK_MultipleKey];

ALTER TABLE [Users] ADD CONSTRAINT PK_IdKey PRIMARY KEY (Id);

DELETE FROM [Users] WHERE [Id] = 6;

ALTER TABLE [Users] ADD CHECK (LEN([Username]) >= 3);

--INSERT [Users] VALUES
	--('Ke', 'pass', 500, '2005-03-14', 0)

CREATE DATABASE [Movies];

CREATE TABLE [Directions](
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[DirectorName] NVARCHAR(50) NOT NULL,
	[Notes] NVARCHAR(1000)
)

INSERT INTO [Directions] VALUES
	('dname1', 'asdfadsfdasfdasfdas'),
	('dname2', 'asdfadsfdasfdasfdas'),
	('dname3', 'asdfadsfdasfdasfdas'),
	('dname4', 'asdfadsfdasfdasfdas'),
	('dname5', 'asdfadsfdasfdasfdas')

CREATE TABLE [Genres](
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[GenreName] NVARCHAR(50) NOT NULL,
	[Notes] NVARCHAR(1000)
)
INSERT INTO [Genres] VALUES
	('genre1', 'asdfadsfdasfdasfdas'),
	('genre2', 'asdfadsfdasfdasfdas'),
	('genre3', 'asdfadsfdasfdasfdas'),
	('genre4', 'asdfadsfdasfdasfdas'),
	('genre5', 'asdfadsfdasfdasfdas')
	
CREATE TABLE [Categories](
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[CategoryName] NVARCHAR(50) NOT NULL,
	[Notes] NVARCHAR(1000)
)
INSERT INTO [Categories] VALUES
	('category1', 'asdfadsfdasfdasfdas'),
	('category2', 'asdfadsfdasfdasfdas'),
	('category3', 'asdfadsfdasfdasfdas'),
	('category4', 'asdfadsfdasfdasfdas'),
	('category5', 'asdfadsfdasfdasfdas')

CREATE TABLE [Movies](
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[DirectorId] INT UNIQUE NOT NULL,
	[CopyrightYear] DATE NOT NULL,
	[Length] TIME NOT NULL,
	[GenreId] INT UNIQUE NOT NULL,
	[CategoryId] INT UNIQUE NOT NULL,
	[Rating] TINYINT NOT NULL CHECK(Rating BETWEEN 0 AND 10),
	[Notes] NVARCHAR(1000)
)

INSERT INTO [Movies] VALUES
	(12132, '1994-01-01', '02:22:21', 14314, 13412, 5, 'dsssw'),
	(12232, '1995-01-01', '02:22:21', 43214, 23412, 5, 'dsssw'),
	(12332, '1996-01-01', '02:22:21', 13214, 21412, 5, 'dsssw'),
	(12432, '1997-01-01', '02:22:21', 14321, 21312, 5, 'dsssw'),
	(12532, '1993-01-01', '02:22:21', 1434, 21342, 5, 'dsssw')

EXEC sp_rename 'Directions', 'Directors';

CREATE DATABASE [CarRental];

CREATE TABLE [Categories](
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[CategoryName] NVARCHAR(50) UNIQUE NOT NULL,
	[DailyRate] DECIMAL NOT NULL,
	[WeeklyRate] DECIMAL NOT NULL,
	[MonthlyRate] DECIMAL NOT NULL,
	[WeekendRate] DECIMAL NOT NULL,
)

INSERT INTO [Categories] VALUES
	('category1', 3.18, 4.18, 20.18, 21.18),
	('category2',  3.18, 4.18, 20.18, 21.18),
	('category3',  3.18, 4.18, 20.18, 21.18)

CREATE TABLE [Cars](
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[PlateNumber] NVARCHAR(20) UNIQUE NOT NULL,
	[Manufacturer] NVARCHAR(50) NOT NULL,
	[Model] NVARCHAR(50) NOT NULL,
	[CarYear] DATE NOT NULL,
	[CategoryId] INT UNIQUE NOT NULL,
	[Doors] TINYINT NOT NULL CHECK([Doors] BETWEEN 2 AND 4),
	[Picture] VARBINARY(MAX),
	CHECK (DATALENGTH([Picture]) <= 10000000),
	[Condition] NVARCHAR(20) NOT NULL,
	[Available] BIT NOT NULL
)
INSERT INTO [Cars] VALUES
	('category1','bg 0011 X', 'mustang', '1994-01-01', 124, 2, 12342, 'new', 1),
	('category2','bg 011 X', 'mustang', '1994-01-01', 234, 3, 1242, 'old', 0),
	('category3','bg 001 X', 'mustang', '1994-01-01', 134, 4, 1242, 'used', 0)

CREATE TABLE [Employees](
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[FirstName] NVARCHAR(30) NOT NULL,
	[LastName] NVARCHAR(30) NOT NULL,
	[Title] NVARCHAR(20) NOT NULL,
	[Notes] NVARCHAR(1000)
)
INSERT INTO [Employees] VALUES
	('kris', 'mustang', 'storage worker', null),
	('ivan', 'porsche', 'production', null),
	('mitko', 'shelby', 'cashier', null)


CREATE TABLE [Customers](
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[DriverLicenseNumber] NVARCHAR(40) UNIQUE NOT NULL,
	[FullName] NVARCHAR(80) NOT NULL,
	[Address] NVARCHAR(80) NOT NULL,
	[City] NVARCHAR(30) NOT NULL,
	[ZIPCode] INT NOT NULL CHECK([ZIPCode] BETWEEN 0 AND 10),
	[Notes] NVARCHAR(1000) NOT NULL,
)
INSERT INTO [Customers] VALUES
	('bg 0011 X', 'kris', 'address1', 'Rousse', 4, 'asdfas'),
	('bg 011 X', 'ivan', 'address2', 'VARNA', 2, 'sfasda'),
	('bg 001 X', 'mitko', 'address3', 'SODIEA', 3, 'dsgfd')

CREATE TABLE [RentalOrders](
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[EmployeeId] INT UNIQUE NOT NULL,
	[CustomerId] INT UNIQUE NOT NULL,
	[CarId] INT UNIQUE NOT NULL,
	[TankLevel] DECIMAL NOT NULL,
	[KilometrageStart] DECIMAL NOT NULL,
	[KilometrageEnd] DECIMAL NOT NULL,
	[TotalKilometrage] DECIMAL NOT NULL,
	[StartDate] DATETIME2 NOT NULL,
	[EndDate] DATETIME2 NOT NULL,
	[TotalDays] INT NOT NULL,
	[RateApplied] DECIMAL NOT NULL,
	[TaxRate] DECIMAL NOT NULL,
	[OrderStatus] BIT NOT NULL,
	[Notes] NVARCHAR(1000)
)
INSERT INTO [RentalOrders] VALUES
	(1234, 2342, 4564,3.80, 3.80,3.80,3.80, '1994-01-01', '1994-01-01', 12, 1.20, 23.4, 1, null),
	(234, 23, 16454,3.80, 3.80,3.80,3.80, '1994-01-01', '1994-01-01', 13, 2.10, 34.2, 0, null),
	(456, 2332, 64353, 3.80,3.80,3.80,3.80,'1994-01-01', '1994-01-01', 14, 4.20, 12.3, 1, null)


CREATE DATABASE [Hotel];

CREATE TABLE [Employees](
	[Id] INT IDENTITY PRIMARY KEY NOT NULL,
	[FirstName] NVARCHAR(30) NOT NULL,
	[LastName] NVARCHAR(30) NOT NULL,
	[Title] NVARCHAR(30) NOT NULL,
	[Notes] NVARCHAR(50)
)



CREATE TABLE [Customers](
	[AccountNumber] INT PRIMARY KEY NOT NULL,
	[FirstName] NVARCHAR(30) NOT NULL,
	[LastName] NVARCHAR(30) NOT NULL,
	[PhoneNumber] NVARCHAR(20) NOT NULL,
	[EmergencyName] NVARCHAR(30) NOT NULL,
	[EmergencyNumber] INT NOT NULL,
	[Notes] NVARCHAR(50)
)



CREATE TABLE [RoomStatus](
	[RoomStatus] VARCHAR(50) PRIMARY KEY NOT NULL,
	[Notes] NVARCHAR(50)
)



CREATE TABLE [RoomTypes](
	[RoomType] VARCHAR(50) PRIMARY KEY NOT NULL,
	[Notes] NVARCHAR(50)
)


CREATE TABLE [BedTypes](
	[BedTypes] INT PRIMARY KEY NOT NULL,
	[Notes] NVARCHAR(50)
)
INSERT INTO [BedTypes] VALUES
	(1234, null),
	(123, null),
	(222, null)

CREATE TABLE [Rooms](
	[RoomNumber] INT PRIMARY KEY NOT NULL,
	[RoomType] NVARCHAR(50) NOT NULL,
	[BedType] NVARCHAR(30) NOT NULL,
	[Rate] DECIMAL NOT NULL,
	[RoomStatus] NVARCHAR(30) NOT NULL,
	[Notes] NVARCHAR(1000)
)



CREATE TABLE [Payments](
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[EmpoyeeId] INT UNIQUE NOT NULL,
	[PaymentDate] DATE NOT NULL,
	[AccountNumber] INT UNIQUE NOT NULL,
	[FirstDateOccupied] DATE NOT NULL,
	[LastDateOccupied] DATE NOT NULL,
	[TotayDays] INT NOT NULL,
	[AmountCharged] DECIMAL NOT NULL,
	[TaxRate] DECIMAL NOT NULL,
	[TaxAmount] DECIMAL NOT NULL,
	[PaymentTotal] DECIMAL NOT NULL,
	[Notes] NVARCHAR(1000)
)



CREATE TABLE [Occupancies](
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[EmpoyeeId] INT UNIQUE NOT NULL,
	[DateOccupied] DATE NOT NULL,
	[AccountNumber] NVARCHAR(20) UNIQUE NOT NULL,
	[RoomNumber] INT UNIQUE NOT NULL,
	[RateApplied] DECIMAL NOT NULL,
	[PhoneCharge] DECIMAL NOT NULL,
	[Notes] NVARCHAR(1000)
)

INSERT INTO [Employees] VALUES
	('fname1', 'lname1', 'title1', null),
	('fname2', 'lname2', 'title1', null),
	('fname3', 'lname3', 'title1', null)
INSERT INTO [Customers] VALUES 
	(432876, 'fname1', 'lname1','title1', 'NAME', 213, null),
	(432376, 'fname1', 'lname1','title1', 'NAME', 123, null),
	(432276, 'fname1', 'lname1','title1', 'NAME', 3123, null)
INSERT INTO [RoomStatus] VALUES
	('FREE', NULL),
	('NOT FREE', NULL),
	('FREEX3', NULL)
INSERT INTO [RoomTypes] VALUES
	('FREE', NULL),
	('NOT FREE', NULL),
	('FREEX3', NULL)
INSERT INTO [Rooms] VALUES
	(1, 'DUAL', 'DUAL', 3.18, 'FREE', NULL),
	(2, 'DUAL', 'DUAL', 3.18, 'FREE', NULL),
	(3, 'DUAL', 'DUAL', 3.18, 'FREE', NULL)
INSERT INTO [Payments] VALUES
	(123213, '2002-02-21', 1212, '2002-02-20', '2021-03-12', 10, 3.19, 3.18, 3.18, 44.50, null),
	(1223213, '2002-02-21', 1232, '2002-02-20', '2021-03-12', 10, 3.19, 3.18, 3.18, 44.50, null),
	(23213, '2002-02-21', 1231, '2002-02-20', '2021-03-12', 10, 3.19, 3.18, 3.18, 44.50, null)
INSERT INTO [Occupancies] VALUES
	(123123, '2000-02-21', '222-333-22', 1, 3.18, 22.22, NULL),
	(12313, '2000-02-21', '222-323-22', 2, 3.18, 22.22, NULL),
	(13123, '2000-02-21', '222-3133-22', 3, 3.18, 22.22, NULL)

CREATE DATABASE [SoftUni];

CREATE TABLE [Towns](
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[Name] NVARCHAR(80)
)

ALTER TABLE [Towns] ADD FOREIGN KEY ([Id]) REFERENCES [Addresses](TownId);

ALTER TABLE [Towns] DROP [FK__Towns__Id__32E0915F]

CREATE TABLE [Addresses](
	[Id] INT IDENTITY PRIMARY KEY NOT NULL,
	[AddressText] NVARCHAR(80),
	[TownId] INT UNIQUE NOT NULL,
)

ALTER TABLE [Addresses] ADD FOREIGN KEY ([Id]) REFERENCES [Employees](AddressId);

ALTER TABLE [Addresses] DROP [FK__Addresses__TownI__34C8D9D1];

CREATE TABLE [Departments](
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[Name] NVARCHAR(80)
)

ALTER TABLE [Employees] ADD FOREIGN KEY ([DepartmentId]) REFERENCES [Departments](Id);

ALTER TABLE [Departments] ADD FOREIGN KEY ([Id]) REFERENCES [Employees](DepartmentId);

CREATE TABLE [Employees](
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[FirstName] NVARCHAR(50) NOT NULL,
	[MiddleName] NVARCHAR(50),
	[LastName] NVARCHAR(50) NOT NULL,
	[JobTitle] NVARCHAR(30) NOT NULL,
	[DepartmentId] NVARCHAR(50),
	[HireDate] NVARCHAR(20),
	[Salary] DECIMAL NOT NULL,
	[AddressId] INT
)
DROP TABLE [Employees]

ALTER TABLE [Addresses] DROP [FK__Addresses__Id__36B12243]

INSERT INTO [Employees]([FirstName],[MiddleName],[LastName],[JobTitle],[DepartmentId],[HireDate],[Salary]) VALUES
	('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 'Software Development', '01/02/2013', 3500.00),
	('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 'Engineering', '02/03/2004', 4000.00),
	('Maria', 'Petrova', 'Ivanova', 'Intern', 'Quality Assurance', '28/08/2016', 525.25),
	('Georgi', 'Teziev', 'Ivanov', 'CEO', 'Sales', '09/12/2007', 3000.00),
	('Peter', 'Pan', 'Pan', 'Intern', 'Marketing', '28/08/2016', 599.88)
--mysqldump -u [Kristiyan] -p [SoftUni] > [C:\Users\Kristiyan\Documents\SQL Server Management Studio].sql

INSERT INTO [Towns] VALUES
	('Sofia'),
	('Plovdiv'),
	('Varna'),
	('Burgas')

INSERT INTO [Departments] VALUES
	('Engineering'),
	('Sales'),
	('Marketing'),
	('Software Development'),
	('Quality Assurance')


SELECT * FROM [Towns];

SELECT * FROM [Departments];

SELECT * FROM [Employees];

SELECT * FROM [Towns] ORDER BY [Name] asc;
SELECT * FROM [Departments] ORDER BY [Name] asc;
SELECT * FROM [Employees] ORDER BY [Salary] desc;

SELECT [Name] FROM [Towns] ORDER BY [Name] asc;
SELECT [Name] FROM [Departments] ORDER BY [Name] asc;
SELECT [FirstName], [LastName], [JobTitle], [Salary] FROM [Employees] ORDER BY [Salary] desc;

UPDATE [Employees] SET [Salary] *= 1.10;
SELECT [Salary] from [Employees];

UPDATE [Payments] SET [TaxRate] *= 0.97;
SELECT [TaxRate] FROM [Payments];

DELETE FROM [Occupancies]