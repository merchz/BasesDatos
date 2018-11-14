-- orden para conectar root a mysql
mysql -u root -p

-- salir bases de datos
quit;

-- ver bases de datos
show databases;

use mysql;
-- para utilizar base de datos

mysql> GRANT ALL ON nombre-bdd.* TO 'nombre-usuario'@'localhost-ip';
--crear base de datos
CREATE DATABASE coches;

SHOW TABLES;
-- ver registro tablas
select *from nombre_tabla;
select user, host from user;
-- crear tabla nombretipo, nombreTIpo,
create table pet (name varchar(20), owner varchar(20), specie varchar(20), sex char(1), birth date, death date);
