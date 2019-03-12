-- usuarios del sistema
SELECT * from mysql.user;
-- crear un usuario
create user 'enrique'@'localhost' identified by 'P@ssw0rd';
grant all privileges on *.* to 'enrique'@'localhost';
SELECT * from mysql.user;
show grants for 'enrique'@'localhost';
-- revocar privilegios
REVOKE ALL ON *.* FROM 'enrique'@'localhost';
SHOW GRANTS FOR enrique@localhost;
SELECT * from mysql.user;
-- eliminar un usuario
DROP USER enrique@localhost;
SELECT * from mysql.user


