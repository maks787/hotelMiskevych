Create view vWEmployeeByDepartment
as
Select id,name,salary,gender,deptname
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId
 
 select * from vWEmployeeByDepartment
 

Create view vWITDepartment_Employees
as
Select id,name,salary,gender,deptname
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId
where tblDepartment.DeptName='IT'

select * from vWITDepartment_Employees
 
Create view vWEmployeesNonConfidentialData
as
Select id,name,gender,deptname
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId
select * from vWEmployeesNonConfidentialData
 
create view vWemployeesCountByDepartment
as
Select DeptName,COUNT(ID) as totalEmployees
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId
Group by DeptName
select * from vWemployeesCountByDepartment
 
Create view vWEmployeeByDepartment
as
Select id,name,salary,gender,deptname
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId
 
 select * from vWEmployeeByDepartment
 

Create view vWITDepartment_Employees
as
Select id,name,salary,gender,deptname
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId
where tblDepartment.DeptName='IT'

select * from vWITDepartment_Employees
 
Create view vWEmployeesNonConfidentialData
as
Select id,name,gender,deptname
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId
select * from vWEmployeesNonConfidentialData
 
create view vWemployeesCountByDepartment
as
Select DeptName,COUNT(ID) as totalEmployees
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId
Group by DeptName
select * from vWemployeesCountByDepartment
 
create view vWtotalSalesByProduct
with schemaBinding
as
Select name,
Sum(ISNULL((QuantitySold * UnitPrice),0)) as totalSales,
Count_Big(*) as totalTransactions
from dbo.tblProductSales
join dbo.tblProduct
on dbo.tblProduct.ProductId = dbo.tblProductSales.ProdutctId
group by name

select * from vWtotalSalesByProduct
 

create unique clustered index UIX_vWTotalSalesByProduct_Name
on vWTotalSalesByProduct(Name)
Create View vWEmployeeDetailsSorted
as
Select Id, Name, Gender, DepartmentId
from tblEmployee
order by Id
Create View vwOnTempTable
as
Select Id, Name, Gender
from ##TestTempTable

