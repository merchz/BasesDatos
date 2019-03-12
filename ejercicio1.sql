-- crear db de nombre 'productos' con utf y su correspondiente collate
create database productos character set utf8 collate utf8_spanish_ci;
-- crear tabla productos con los campos: id, nombre, descripción, stock, fecha_alta, proveedor, nacional ('s','n')
 create table productos(id int, nombre varchar(20), descripcion varchar(70), stock int,fecha_alta date, proveedor varchar(20), nacional set ('si','no'));
-- insertar 5 productos en la tabla
insert into productos values('123', 'altavoces','altavoces con subwoofer','120','2018-07-20','woxter','n');
insert into productos values('223', 'impresora','Impresora con fax y escaner','90','2018-07-10','canon','n');
insert into productos values('323', 'portatil','portatil con 1tb hdd y 8 GB','40','2018-06-12','lenovo','n');
insert into productos values('423', 'desodorante','desodorante con 150ml','22','2018-06-13','axe','n');
insert into productos values('423', 'movil','movil con 8gb de almacenamiento','45','2018-06-14','LG','n');
-- mostrar las tablas de la bd
show tables;
-- eliminar la bd productos
DROP DATABASE productos;

