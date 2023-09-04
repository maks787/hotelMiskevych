CREATE TABLE guest(
id int not null PRIMARY KEY identity ,
first_name varchar(80),
last_name varchar(80) NULL,
member_since date )

------lisamine
CREATE PROCEDURE AddGuest
    @first_name varchar(80),
    @last_name varchar(80),
    @member_since date
AS
BEGIN
    INSERT INTO guest (first_name, last_name, member_since)
    VALUES (@first_name, @last_name, @member_since);
END;

EXEC AddGuest 'John', 'Doe', '2023-09-04';
---------select
CREATE PROCEDURE GetGuests
AS
BEGIN
    SELECT id, first_name, last_name, member_since
    FROM guest;
END;

EXEC GetGuests;

CREATE PROCEDURE deleteGuest
@id int 
AS
BEGIN
SELECT * FROM guest;
DELETE FROM guest
WHERE @id=id;
SELECT * FROM guest;
select * from logi;
END;
EXEC deleteGuest 1

CREATE PROCEDURE UpdateGuest
    @guest_id int,
    @new_first_name varchar(80),
    @new_last_name varchar(80),
    @new_member_since date
AS
BEGIN
    UPDATE guest
    SET 
        first_name = @new_first_name,
        last_name = @new_last_name,
        member_since = @new_member_since
    WHERE id = @guest_id;
END;

EXEC UpdateGuest 
    @guest_id = 3,
    @new_first_name = 'Luca',
    @new_last_name = 'aaaa',
    @new_member_since = '2023-10-05';
