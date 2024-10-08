-- Create a table to store new login names
CREATE TABLE NewLogins (
    LoginName VARCHAR(128)
);

-- Insert sample login names into the NewLogins table
INSERT INTO NewLogins (LoginName) 
VALUES ('BBrown'), ('CChaplin'), ('DDyer'), ('EEbbers');

select * from NewLogins;

DECLARE @Name AS VARCHAR(MAX),
 @Password AS VARCHAR(MAX),
 @Query AS VARCHAR(MAX);

DECLARE Create_Login CURSOR
DYNAMIC FOR
SELECT LoginName, CONCAT(LEFT(LoginName, 4), '99999') AS 'Pwd' FROM NewLogins;
OPEN Create_Login;
FETCH NEXT FROM Create_Login INTO @Name, @Password;
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @Query = N'CREATE LOGIN ' + @Name + ' WITH PASSWORD = ''' + @Password + '''' +
	', DEFAULT_DATABASE = AP;';
	Exec (@Query);
	SET @Query = N'CREATE USER ' + @Name + ' FOR LOGIN ' + @Name;
	Exec (@Query);
	SET @Query = N'ALTER ROLE PaymentEntry ADD MEMBER ' + @Name;
	Exec (@Query);
	FETCH NEXT FROM Create_Login INTO @Name, @Password;
END
CLOSE Create_Login;
DEALLOCATE Create_Login;


/*DROP LOGIN AAaron
DROP LOGIN BBrown
DROP LOGIN CChaplin
DROP LOGIN DDyer
DROP LOGIN EEbbers*/


DROP USER BBrown;
DROP USER CChaplin;
DROP USER DDyer;
DROP USER EEbbers;