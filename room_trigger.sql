
CREATE TABLE room(
id int not null PRIMARY KEY identity,
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit);

CREATE TRIGGER roomUuendamine
ON room
FOR UPDATE
AS
INSERT INTO logi(kuupaev, kasutaja, andmed, tegevus)
SELECT GETDATE(), USER, 
CONCAT('VANAD - ',
deleted.number, ', ', deleted.name, ', ', deleted.status, ', ', deleted.smoke,
'UUED -',inserted.number, ', ', inserted.name, ', ', inserted.status, ', ', inserted.smoke),
'room on uuendatud'
FROM deleted INNER JOIN inserted
ON deleted.id=inserted.id
--kontroll

SELECT * from room;
UPDATE room SET name = 'luca'
where id = 3;
SELECT * from guest;
select * from logi;

CREATE TRIGGER roomLisamine
ON room
FOR INSERT
AS
INSERT INTO logi(kuupaev, kasutaja, andmed, tegevus)
SELECT GETDATE(), USER, 
CONCAT(inserted.number, ', ', inserted.name, ', ', inserted.status, ', ', inserted.smoke),
'room on lisatud'
FROM inserted;
