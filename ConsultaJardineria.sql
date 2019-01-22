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
 
