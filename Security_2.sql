-- Create login ID named AAaron with password "AAar99999"
CREATE LOGIN AAaron WITH PASSWORD = 'AAar99999';


-- Set default database for the login to AP database
ALTER LOGIN AAaron WITH DEFAULT_DATABASE = AP;


-- Create user named AAaron for the login
USE AP;


CREATE USER AAaron FOR LOGIN AAaron;


-- Assign user AAaron to the PaymentEntry role created in exercise 1
ALTER ROLE PaymentEntry ADD MEMBER AAaron;

DROP LOGIN AAaron;

