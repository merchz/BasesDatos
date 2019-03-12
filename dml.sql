-- orden para conectar root a mysql
sudo mysql -u root -p
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
SELECT NombreTabla, host from NombreTabla;
-- crear base de datos
CREATE DATABASE nombrebase;
-- borrar base de datos
drop database nombre_bdd; 
-- Ver la estructura de una tabla
DESCRIBE nombre_tabla;
-- Eliminar una tabla
DROP TABLE empleados;
-- Para evitar un mensaje de error si no existe la tabla tipeamos
DROP TABLE IF EXISTS empleados; -- Indicamos que elimine la tabla empleados "si existe"
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
-- Mencionar la clave primaria
PRIMARY KEY (nombrecampo)
--  a la hora de crear una tabla podremos hacer que el valor que se introduzca en ella sea siempre positivo
...edad INT UNSIGNED);
-- FOREIGN KEY() encierra la columna que sera clave referencial en la tabla productos, REFERENCES indica 
-- la tabla a la que hace referencia encerrando entre paréntesis el campo al que hace referencia, en nuestro caso 
-- REFERENCES proveedores(codigo) es el campo “código” de la tabla “proveedores”.
CREATE TABLE productos (codigo_p INT AUTO_INCREMENT, codigo_provee INT, nombre VARCHAR(40), precio FLOAT, disponible INT, PRIMARY KEY(codigo_p), FOREIGN KEY(codigo_provee) REFERENCES proveedores(codigo));
-- para eliminar una clave foreign de una tabla
-- miramos primero el id de la clave con : SHOW CREATE TABLE productos; en el apartado CONSTRAINT
ALTER TABLE productos DROP FOREIGN KEY productos_ibfk_1;
-- añadir la clave a una tabla ya existente
ALTER TABLE productos ADD FOREIGN KEY(codigo_provee) REFERENCES proveedores(codigo) ON DELETE CASCADE ON UPDATE CASCADE;
-- vaciar una tabla
TRUNCATE TABLE nombretabla;
-- autoincrement nos iniciara un contador automático que comenzara en uno, tiene que ser clave primaria.
(nombredato tipodato AUTO_INCREMENT,...,PRIMARY KEY(nombredato));
-- con DEFAULT tras un dato de una tabla al crearla le podemos dar un valor minimo
CREATE TABLE productos (Stock INT DEFAULT 20);