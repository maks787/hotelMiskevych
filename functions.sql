CREATE FUNCTION fn_ILTVF_GetEmployees()
  returns table
  as
  return(select id,name,cast(dateofbirth as date) AS BOD
  from tblemployees)
CREATE FUNCTION fn_MSTVF_GetEmployees()
returns @table table (id int,Name nvarchar(20),DOB Date)
as
begin
insert into @Table
Select id,name,cast(DateOfBirth as Date)
From tblEmployees
return
end

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

alter function fn_getEmployeesNameById(@id int)
returns nvarchar(20)
with schemaBinding
as
begin
return(select name from dbo.tblEmployees where id=@id)
end
