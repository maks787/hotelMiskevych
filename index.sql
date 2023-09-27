Create Clustered index IX_tblEmployee_name
ON tblEmployee(Name)
--индекс ускоряет поиск по столбцу Name
  
 
Create Clustered index Gender_Salary
ON tblEmployee(Gender DESC,Salary ASC)
 --в порядке убываниия Gender, в порядке возррастания salary так сортрирует этот тригер
Create Unique NonClustered Index UIX_tblEmployee_FirstName_LastName
On tblEmployee(FirstName, LastName)
ALTER TABLE tblEmployee 
ADD CONSTRAINT UQ_tblEmployee_City 
UNIQUE NONCLUSTERED (City)
--не дублируются first name last name, не может быть 2 или более значения в city
  CREATE UNIQUE INDEX IX_tblEmployee_City
ON tblEmployee(City)
WITH IGNORE_DUP_KEY
Create nonClustered index IX_tblEmployee_salary
on tblEmployee (Salary ASC)
--если будет ошибка дублированного ключа то сервер проигрнорирует ее и не вызовет оишбку, упорядочен по возрастанию
 
select * from tblEmployee where Salary > 4000 and Salary < 8000
--значение в колонке Salary больше 4000 и меньше 8000
 
delete from tblEmployee where salary = 2500 
 --удаляет всех у кого 2500
UPDATE tblEmployee set salary = 9000 where Salary = 7500
-- обновляет у всех у кого было 7500 на 9000
select * from tblEmployee order by salary
 --сортировка по столбу salary

select * from tblEmployee order by salary Desc
 --сортировка по столбцу salary по убыванию

select salary, COUNT(salary) as Total
from tblEmployee
Group by salary
-- покажет сколько сотрудников имеют каждый из уровней заработной платы

