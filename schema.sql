use shoplab
go

--categories
create table dbo.categories1 (
CategoryID int primary key identity(1,1),
CategoryName varchar(50),
CategoryType varchar(10))
go
--acounts
create table dbo.acounts(
AccountID int primary key identity(1,1),
AccountName varchar(100),
Balance int)
go
--Transaction
create table dbo.transactions(
TransactionID int primary key identity(1,1),
Amount int ,
AcountID int foreign key references dbo.acounts(AccountID),
TransactionDate date not null ,
descriptions varchar(200),
CategoryID int foreign key references dbo.categories1)
go
