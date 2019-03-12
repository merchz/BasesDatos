1. Nombre, apellidos y email de los empleados a cargo de Alberto Soria

select CodigoEmpleado, nombre from Empleados;
+----------------+-----------------+
| CodigoEmpleado | nombre          |
+----------------+-----------------+
|              1 | Marcos          |
|              2 | Ruben           |
|              3 | Alberto         |
|              4 | Maria           |
|              5 | Felipe          |
|              6 | Juan Carlos     |
|              7 | Carlos          |
|              8 | Mariano         |
|              9 | Lucio           |
|             10 | Hilario         |
|             11 | Emmanuel        |
|             12 | José Manuel     |
|             13 | David           |
|             14 | Oscar           |
|             15 | Francois        |
|             16 | Lionel          |
|             17 | Laurent         |
|             18 | Michael         |
|             19 | Walter Santiago |
|             20 | Hilary          |
|             21 | Marcus          |
|             22 | Lorena          |
|             23 | Nei             |
|             24 | Narumi          |
|             25 | Takuma          |
|             26 | Amy             |
|             27 | Larry           |
|             28 | John            |
|             29 | Kevin           |
|             30 | Julian          |
|             31 | Mariko          |
+----------------+-----------------+

select Nombre, Apellido1, Apellido2, Email from Empleados where CodigoJefe = 3;
+-------------+------------+-----------+---------------------------+
| Nombre      | Apellido1  | Apellido2 | Email                     |
+-------------+------------+-----------+---------------------------+
| Felipe      | Rosas      | Marquez   | frosas@jardineria.es      |
| Juan Carlos | Ortiz      | Serrano   | cortiz@jardineria.es      |
| Carlos      | Soria      | Jimenez   | csoria@jardineria.es      |
| Emmanuel    | Magaña     | Perez     | manu@jardineria.es        |
| Francois    | Fignon     |           | ffignon@gardening.com     |
| Michael     | Bolton     |           | mbolton@gardening.com     |
| Hilary      | Washington |           | hwashington@gardening.com |
| Nei         | Nishikori  |           | nnishikori@gardening.com  |
| Amy         | Johnson    |           | ajohnson@gardening.com    |
| Kevin       | Fallmer    |           | kfalmer@gardening.com     |
+-------------+------------+-----------+---------------------------+

2. Ciudad y teléfono de las oficinas de EEUU

describe Oficinas;
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| CodigoOficina   | varchar(10) | NO   | PRI | NULL    |       |
| Ciudad          | varchar(30) | NO   |     | NULL    |       |
| Pais            | varchar(50) | NO   |     | NULL    |       |
| Region          | varchar(50) | YES  |     | NULL    |       |
| CodigoPostal    | varchar(10) | NO   |     | NULL    |       |
| Telefono        | varchar(20) | NO   |     | NULL    |       |
| LineaDireccion1 | varchar(50) | NO   |     | NULL    |       |
| LineaDireccion2 | varchar(50) | YES  |     | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+

select Ciudad, Telefono from Oficinas where Pais = 'EEUU';
+---------------+-----------------+
| Ciudad        | Telefono        |
+---------------+-----------------+
| Boston        | +1 215 837 0825 |
| San Francisco | +1 650 219 4782 |
+---------------+-----------------+

3. Nombre, apellidos y cargo de aquellos que _no_ sean representantes de ventas

select Nombre, Apellido1, Apellido2, Puesto from Empleados where Puesto<>'Representante Ventas';
+----------+------------+-----------+-----------------------+
| Nombre   | Apellido1  | Apellido2 | Puesto                |
+----------+------------+-----------+-----------------------+
| Marcos   | Magaña     | Perez     | Director General      |
| Ruben    | López      | Martinez  | Subdirector Marketing |
| Alberto  | Soria      | Carrasco  | Subdirector Ventas    |
| Maria    | Solís      | Jerez     | Secretaria            |
| Carlos   | Soria      | Jimenez   | Director Oficina      |
| Emmanuel | Magaña     | Perez     | Director Oficina      |
| Francois | Fignon     |           | Director Oficina      |
| Michael  | Bolton     |           | Director Oficina      |
| Hilary   | Washington |           | Director Oficina      |
| Nei      | Nishikori  |           | Director Oficina      |
| Amy      | Johnson    |           | Director Oficina      |
| Kevin    | Fallmer    |           | Director Oficina      |
+----------+------------+-----------+-----------------------+

4. Cargo, nombre, apellidos y email del jefe de la empresa.

select Nombre, Apellido1, Apellido2, Email, Puesto from Empleados where Puesto = 'Director General';
+--------+-----------+-----------+----------------------+------------------+
| Nombre | Apellido1 | Apellido2 | Email                | Puesto           |
+--------+-----------+-----------+----------------------+------------------+
| Marcos | Magaña    | Perez     | marcos@jardineria.es | Director General |
+--------+-----------+-----------+----------------------+------------------+

5. Número de clientes que tiene la empresa.

 select count(NombreCliente) from Clientes;
+----------------------+
| count(NombreCliente) |
+----------------------+
|                   36 |
+----------------------+

6. Nombre de los clientes españoles.

select NombreCliente,Pais from Clientes where Pais='Spain';
+-----------------------+-------+
| NombreCliente         | Pais  |
+-----------------------+-------+
| Lasas S.A.            | Spain |
| Lasas S.A.            | Spain |
| Camunas Jardines S.L. | Spain |
| Dardena S.A.          | Spain |
+-----------------------+-------+
7. Cuántos clientes tiene cada país.
select Pais, count(*) from Clientes group by Pais;
+----------------+----------+
| Pais           | count(*) |
+----------------+----------+
| USA            |        4 |
| Spain          |        4 |
| España         |       23 |
| France         |        2 |
| Australia      |        2 |
| United Kingdom |        1 |
+----------------+----------+

8. Cuántos clientes tiene Madrid.

select count(*) from Clientes where Region='Madrid';
+----------+
| count(*) |
+----------+
|       20 |
+----------+
9. Cuántos clientes tienen las ciudades que empiezan por M.

select Region, count(NombreCliente) from Clientes where Region like 'M%' group by Region;
+--------+----------------------+
| Region | count(NombreCliente) |
+--------+----------------------+
| Miami  |                    1 |
| Madrid |                   20 |
+--------+----------------------+
10. Código de empleado y número de clientes al que atiende cada representante de ventas.

select CodigoEmpleadoRepVentas, count(CodigoEmpleadoRepVentas) from Clientes group by CodigoEmpleadoRepVentas;
+-------------------------+--------------------------------+
| CodigoEmpleadoRepVentas | count(CodigoEmpleadoRepVentas) |
+-------------------------+--------------------------------+
|                       5 |                              5 |
|                       8 |                              4 |
|                       9 |                              2 |
|                      11 |                              5 |
|                      12 |                              5 |
|                      16 |                              2 |
|                      18 |                              2 |
|                      19 |                              2 |
|                      22 |                              2 |
|                      30 |                              5 |
|                      31 |                              2 |
+-------------------------+--------------------------------+

select CodigoEmpleado, nombre from Empleados;

-- 11. Cuántos clientes no tienen asignado representante de ventas.
select count(*) from Clientes where CodigoEmpleadoRepVentas is NULL;
-- 12. Cuál han sido el primer y último pagos hechos por clientes.
select min(FechaPago) from Pagos;
select max(FechaPago) from Pagos;
-- 13. Código de cliente de los que hicieron pagos en 2008.
SELECT 
    CodigoCliente
FROM
    Pagos
WHERE
    FechaPago LIKE '2008%';
-- 14. Qué estados distintos puede tener un pedido.
select Estado from Pedidos group by Estado;
-- 15. El número de pedido, código de cliente, fecha requerida y fecha de entrega de los pedidos _no_ entregados a tiempo.
select CodigoPedido, CodigoCliente, FechaEsperada, FechaEntrega from Pedidos where FechaEntrega>FechaEsperada;
-- 16. Cuántos productos existen en cada línea de pedido.
select sum(Cantidad), NumeroLinea from DetallePedidos group by NumeroLinea order by NumeroLinea ;
-- 17. Listar los 20 códigos de productos más pedidos ordenando por cantidad pedida.
select count(CodigoProducto), Cantidad from DetallePedidos group by CodigoProducto order by Cantidad;
-- 18.Número de pedido, código de cliente, fecha requerida y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos
-- dos días antes de la fecha requerida.
select CodigoPedido, CodigoCliente, FechaEsperada, FechaEntrega from Pedidos where FechaEntrega<=FechaEsperada-2;
select Clientes.NombreCliente, Empleados.Nombre, Empleados.Apellido1 from Clientes inner join Empleados on Clientes.CodigoEmpleadoRepVentas = Empleados. CodigoEmpleado;


CREATE VIEW ejercicio18 AS select CodigoPedido, CodigoCliente, FechaEsperada, FechaEntrega from Pedidos where FechaEntrega=FechaEsperada;
 select *
 from ejercicio18
 where CodigoCliente=15;
 
