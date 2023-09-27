CREATE FUNCTION fn_ILTVF_GetEmployees()
  returns table
  as
  return(select id,name,cast(dateofbirth as date) AS BOD
  from tblemployees)
  --создает и возвращает результат в виде таблицы.
  
CREATE FUNCTION fn_MSTVF_GetEmployees()
returns @table table (id int,Name nvarchar(20),DOB Date)
as
begin
insert into @Table
Select id,name,cast(DateOfBirth as Date)
From tblEmployees
return
end
--функция возвращает таблицу с данными о сотрудниках из таблицы tblEmployees, где столбец DateOfBirth преобразуется в формат типа данных Date. 

CREATE FUNCTION fn_getEmployeesNameByid(@id int)
returns nvarchar(20)
as
begin
return(select name from tblEmployees where id=@id)
end
ALter function fn_GetEmployeeNameByid(@id int)
returns nvarchar(20)
with encryption
as
begin
return(select name from tblEmployees where id=@id)
end
--таблицы возвращают имя сотрудника из таблицы tblEmployees по заданному идентификатору (id).
alter function fn_getEmployeesNameById(@id int)
returns nvarchar(20)
with schemaBinding
as
begin
return(select name from dbo.tblEmployees where id=@id)
end
--функция привязана к схеме базы данных,функция принимает один аргумент @id типа int и возвращает имя сотрудника с этим идентификатором из таблицы dbo.tblEmployees. 

