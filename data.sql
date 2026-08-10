use shoplab
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