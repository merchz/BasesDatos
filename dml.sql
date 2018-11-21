-- orden para conectar root a mysql
mysql -u root -p
-- salir bases de datos
quit;
-- ver bases de datos
show databases;
-- mostrar versión
select version();
-- mostrar fecha y hora actual
select now();
-- mostrar usuario que esta usando la base de datos.
select user();
-- Crear un usuario dentro de una bdd.
GRANT ALL ON nombre_bdd. * TO 'nombre_usuario'@'localhost';
-- entrar a la bdd
USE nombre_bdd;
-- mostrar las tablas de la base de datos
SHOW TABLES;
-- ver registros de tabla
SELECT * From nombre_tabla;
-- Mostrar una tabla para ver sus registros
SELECT NombreTabla, host from NombreTabl
CREATE DATABASE coches;
-- borrar base de datos
drop database nombre_bdd; 
-- mostrar descripción de una tabla
DESCRIBE nombre_tabla;
-- ver registro tablas
select *from nombre_tabla;
select user, host from user;
-- crear tabla nombretipo, nombreTIpo,
create table mascotas (raza varchar(20), owner varchar(20), specie varchar(20), sex char(1), birth date, death date);
-- modificar propiedad de la bdd
alter database testsql character set utf8;
-- especificar tipo de datos en cada columna
 create table productos(id int, nombre varchar(20), descripcion varchar(70), stock int,fecha_alta date, proveedor varchar(20), nacional set ('y','n'));
-- insertar datos en la columna de las tablas
insert into nombre_tabla values('323', 'portatil','portatil con 1tb hdd y 8 GB','40','2018-06-12','lenovo','n');

-- subir archivo al repositorio git-hub
git add dml.sql
git config --global user.email "manuelenrique.ruiz.chimborazo.tubalcain.net"
git config --global user.name "merchz"
git commit -m "primeros_pasos"
git push origin master
-- restriccion a nivel de tabla
create table empleados (cedula int(8), nombre varchar(30),apellido varchar(30), tiempo_servicio INT, primary key(cedula) );