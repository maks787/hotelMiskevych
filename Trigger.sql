Create trigger trMyFirstTrigger
On Database
FOR CREATE_TABLE
AS
BEGIN
print 'New table created'
END
 --триггер который реагирует на создание таблицы
 
Create table Test(id int)
ALTER TRIGGER trMyFirstTrigger
On Database
FOR CREATE_TABLE,ALTER_TABLE,DROP_TABLE
AS
BEGIN
print'A table has just been created,modified or deleted'
END
 --тригер который реагирует на создание удаление и обновление таблицы
Alter TRIGGER trMyFirstTrigger
ON Database
FOR create_table,ALTER_TABLE,DROP_TABLE
AS
BEGIN
ROLLBACK
Print'You cannot create,alter or drop a table'
END
 --тригер который не даст добавить удалить или зименить таблицу

 DISABLE TRIGGER trmyfirsttrigger ON DATABASE--отключение тригера
DROP TRIGGER trMyFirstTrigger ON DATABASE--удаление тригера
 
CREATE TRIGGER trRenameTable
ON DATABASE
FOR RENAME
AS
BEGIN
 print'You just renamed something'
END
 --тригер который реагирует на изменение имени таблицы
CREATE TRIGGER tr_DatabaseScopeTrigger
ON DATABASE
FOR CREATE_TABLE,ALTER_TABLE,DROP_TABLE
AS
BEGIN
ROLLBACK
PRINT'You cannot create, alter or drop a table in thee current database'
END
 --тригер который не дает создать изменить или удалить таблицу в этой базе данных
CREATE TRIGGER tr_serverScopeTrigger
ON ALL SERVER 
FOR CREATE_TABLE,ALTER_TABLE,DROP_TABLE
AS
BEGIN
ROLLBACK
PRINT'You cannot create alter or drop a table in any database in the server'
END
 --тригер который не дает изменит удалить или добавить таблицу на сервере
Disable TRIGGER tr_serverScopeTrigger ON ALL SERVER
 
ENABLE TRIGGER tr_serverScopeTrigger ON ALL SERVER --отключить на всем сервере
 
DROP TRIGGER tr_ServerScopeTrigger ON ALL SERVER 
 
Create trigger tr_DatabaseScopeTrigger
ON DATABASE
FOR CREATE_TABLE
AS
BEGIN
Print 'Database scope trigger'
END 
GO
--тригер реагирует на создание таблицы в базе данных
CREATE TRIGGER tr_ServerScopeTrigger
On all server
FOR CREATE_TABLE
AS
BEGIN
Print'Server Scope trigger'
END 
GO
 --тригер реагирует на создание таблицы в сервере

 

EXEC sp_settriggerorder
@triggername='tr_DatabaseScopeTrigger',
@order='none',
@stmttype='CREATE_TABLE',
@namespace='DATABASE'
GO
--запустить тригер который реагирует на создание таблицы и в базе данных
CREATE TRIGGER tr_LogonAuditTriggers
ON all server 
FOR LOGON
AS 
BEGIN


declare @loginName NVARCHAR(100)
SET @loginName = ORIGINAL_LOGIN()
IF (SELECT COUNT(*) FROM sys.dm_exec_sessions
WHERE is_user_process=1
AND original_login_name = @loginName)>3
BEGIN
Print 'Fourth connection of'+@LoginName+'Blocked'
ROLLBACK
END
END
  --триггер для логона запрещающий зайти с 4 раза такому же никнейму

Execute sp_readerrorlog
