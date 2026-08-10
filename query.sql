use shoplab
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



declare @amount as int 
set @amount=(select sum(amount)
             from dbo.transactions)


select sum(balance)+@amount
from dbo.acounts as a
go