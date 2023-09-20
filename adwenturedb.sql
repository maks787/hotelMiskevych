
create function fn_ILTVF_GetEmployees()
Returns table
AS
Return(select EmployeeKey,FirstName,Cast(BirthDate as Date) as DB
from DimEmployee);
Select * from fn_ILTVF_GetEmployees()


CREATE function fn_MSTVF_GetEmployees()
Returns @Table Table(id int,name varchar(20),DOB Date)
as
begin
insert into @Table
select EmployeeKey,FirstName,Cast(BirthDate as Date)
from DimEmployee
Return
end
select * from fn_MSTVF_GetEmployees();

UPDATE fn_ILTVF_GetEmployees set FirstName='sam1'Where id=1


Create table [dbo].[DimEmployees]
(
[EmployeeKey] [int] Primary Key,
[FirstName][nvarchar](50) NULL,
[BirthDate][datetime]Null,
[Gender][nvarchar](10) NULL
)


create function fn_GetEmployeeNameByld(@id int)
Returns varchar(20)
as
begin
Return(select FirstName from DimEmployee where EmployeeKey=@id)
End

select dbo.fn_GetEmployeeNameByld(5);

alter function fn_GetEmployeeNameByld(@id int)
Returns nvarchar(20)
with encryption
as
begin
return (select FirstName from DimEmployee where EmployeeKey=@id)
End

alter function fn_GetEmployeeNameByld(@id int)
Returns nvarchar(20)
With SchemaBinding
as
Begin
Return(Select FirstName from dbo.DimEmployee Where EmployeeKey = @id)
End


Create table #PersonDetails(
Id int Primary key,
Name nvarchar(20)
);

insert into #PersonDetails values(1,'Tom');
insert into #PersonDetails values(2,'Rob');
insert into #PersonDetails values(3,'Rom');

select name from tempdb.sys.all_objects
where name like '#PersonDetails%'

Create procedure spCreateLocalTempTable
as
begin
Create table #PersonDetails(Id int Primary key,Name nvarchar(20)
)

insert into #PersonDetails values(1,'Tom')
insert into #PersonDetails values(2,'Rob')
insert into #PersonDetails values(3,'Rom')
select * from #PersonDetails
End
exec spCreateLocalTempTable

Create table ##PersonDetails(
id int primary key,
Name varchar(20)
);
select * from ##PersonDetails

select * from DimEmployee

select * from DimEmployee where BaseRate > 35 and BaseRate < 50

Create index IX_DimEmployee_BaseRate
ON DimEmployee(BaseRate ASC)
 

SELECT * FROM DimEmployee
ORDER BY BaseRate ASC;

exec sys.sp_helpindex @objname = 'DimEmployee'

execute sp_helptext DimEmployee

drop index DimEmployee.firstNameLastName
