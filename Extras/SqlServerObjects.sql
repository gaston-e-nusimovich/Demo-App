use [AdventureWorks2012]
go


IF OBJECT_ID('tempdb..#my_temp_table', 'U') IS NOT NULL 
  DROP TABLE #my_temp_table; 
go




declare @SalesOrderNumber varchar(100);
set @SalesOrderNumber = (select 'SO75123');

select @@spid;


select soh.SalesOrderNumber, soh.OrderDate, c.AccountNumber, sum(sod.OrderQty * sod.UnitPrice) Totals into #my_temp_table from Sales.SalesOrderHeader soh inner join Sales.Customer c on soh.CustomerID = c.CustomerID inner join Sales.SalesOrderDetail sod on soh.SalesOrderID = sod.SalesOrderID where soh.SalesOrderNumber = @SalesOrderNumber group by soh.SalesOrderNumber, soh.OrderDate, c.AccountNumber; 


select * from #my_temp_table;

select @@spid;


