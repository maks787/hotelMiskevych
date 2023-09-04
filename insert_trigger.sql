CREATE TRIGGER guestLisamine
ON guest
FOR INSERT
AS
INSERT INTO logi(kuupaev, kasutaja, andmed, tegevus)
SELECT GETDATE(), USER, 
CONCAT(inserted.first_name, ', ', inserted.last_name),
'guest on lisatud'
FROM inserted
