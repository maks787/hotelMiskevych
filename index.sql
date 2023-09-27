Create Clustered index IX_tblEmployee_name
ON tblEmployee(Name)

  
 
Create Clustered index Gender_Salary
ON tblEmployee(Gender DESC,Salary ASC)
 
Create Unique NonClustered Index UIX_tblEmployee_FirstName_LastName
On tblEmployee(FirstName, LastName)
ALTER TABLE tblEmployee 
ADD CONSTRAINT UQ_tblEmployee_City 
UNIQUE NONCLUSTERED (City)

  CREATE UNIQUE INDEX IX_tblEmployee_City
ON tblEmployee(City)
WITH IGNORE_DUP_KEY
Create nonClustered index IX_tblEmployee_salary
on tblEmployee (Salary ASC)

 
select * from tblEmployee where Salary > 4000 and Salary < 8000

 
delete from tblEmployee where salary = 2500 
 
UPDATE tblEmployee set salary = 9000 where Salary = 7500

select * from tblEmployee order by salary
 

select * from tblEmployee order by salary Desc
 

select salary, COUNT(salary) as Total
from tblEmployee
Group by salary

