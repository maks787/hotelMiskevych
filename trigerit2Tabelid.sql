CREATE TABLE room_type(
id int not null PRIMARY KEY identity(1,1),
description varchar(80),
max_capacity int)
CREATE TABLE room(
id int not null PRIMARY KEY identity(1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit,
room_type_id int,
foreign key (room_type_id) REFERENCES room_type(id))

CREATE TABLE logi(
id int PRIMARY KEY identity(1,1),
andmed TEXT,
kuupaev datetime,
kasutaja varchar(100)
)
--RoomUENDAMINE---------------------------
CREATE TRIGGER roomUuendamine
ON room
FOR UPDATE
AS
BEGIN
INSERT INTO logi (kuupaev, andmed, kasutaja)
SELECT GETDATE(),
CONCAT('VANAD ANDMED: ', deleted.number, ', ', deleted.name, ', ', deleted.status, ', ', deleted.smoke,
  ' UUED ANDMED: ', inserted.number, ', ', inserted.name, ', ', inserted.status, ', ', inserted.smoke),
 USER
FROM deleted
INNER JOIN inserted ON deleted.id = inserted.id;
END;
--Проверка-------------------------

insert into room(number,name,status,smoke,room_type_id)
VALUES('Viis','ahah','OK',1,1);
insert into room_type(description,max_capacity)
VALUES('room2',4);

UPDATE room
SET number = 'Kuus',
    name = 'max',
    status = 'Not ok',
    smoke = 1, 
    room_type_id = 2
WHERE id = 1
--RoomLisamine----------------
CREATE TRIGGER roomLisamine
ON room
FOR INSERT
AS
BEGIN
    INSERT INTO logi (kuupaev, andmed, kasutaja)
    SELECT GETDATE(),
           CONCAT(inserted.number, ', ', r.name), 
           USER
    FROM inserted
    INNER JOIN room r ON inserted.id = r.id;
END;
--Проверка-----------------------------------
insert into room(number,name,status,smoke,room_type_id)
VALUES('seitse','Artjom','OK',1,1);




----------XAMPP------------------------
CREATE TABLE room_type (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(80),
    max_capacity INT
);

CREATE TABLE room (
    roomID INT PRIMARY KEY AUTO_INCREMENT,
    number VARCHAR(10),
    name VARCHAR(40),
    status VARCHAR(10),
    smoke TINYINT(1),
    room_type_id INT,
    FOREIGN KEY (room_type_id) REFERENCES room_type(id)
);

CREATE TABLE logi (
    id INT PRIMARY KEY AUTO_INCREMENT,
    andmed TEXT,
    kuupaev DATETIME,
    kasutaja VARCHAR(100)
);
------------------roomLisamine-----------------------
INSERT INTO logi(kuupaev,andmed,kasutaja)
SELECT NOW(),
CONCAT('UUED ANDMED- ',NEW.number,', ',NEW.name,', ',NEW.status,', ',NEW.smoke,', ',t.room_type),
USER()
FROM room r
INNER JOIN room_type t
ON r.room_type_id=t.room_type_id
WHERE r.roomID=NEW.roomID


