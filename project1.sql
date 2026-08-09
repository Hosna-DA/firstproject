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

insert into dbo.categories1(CategoryName,CategoryType)
    values('rent','Expense'),
	( 'hanging out','Expense'),
	(  'food','Expense'),
	( 'salary','Income'),
	( 'cloths','Expense')
go

insert into dbo.acounts(AccountName,Balance)
  values('Pasargad_Bank',100000000),
        ('Blue_Bank',5000000)
go


insert into dbo.transactions(Amount,AcountID,TransactionDate,descriptions,CategoryID)
    values(-200000,2,'2025/06/03','cafee',2),
	       (-70000000 ,1,'2025/06/01','rent of home',1),
		   (400000000,1,'2025/06/01','salary of month',4)
go  

update dbo.acounts
  set Balance=Balance+400000000
where AccountID=1
go

delete from dbo.categories1
where CategoryName='cloths'
go

--full amounts
select (a.NetAmount + a.Balance) AS NetBalance
from(select sum(amount) as NetAmount,sum(Balance) as Balance
from dbo.transactions AS t 
join dbo.acounts as a on a.AccountID=t.AcountID
) as a
go


select *
from dbo.acounts
go

select *
from dbo.transactions
go



declare @amount as int 
set @amount=(select sum(amount)
             from dbo.transactions)


select sum(balance)+@amount
from dbo.acounts as a
go


