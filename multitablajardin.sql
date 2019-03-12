-- 1. Listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas
SELECT 
    Clientes.NombreCliente,
    Empleados.Nombre,
    Empleados.Apellido1
FROM
    Clientes
        INNER JOIN
    Empleados ON Clientes.CodigoEmpleadoRepVentas = Empleados.CodigoEmpleado;
    
    -- select * from jardineria.Empleados
-- 2. Nombre de los clientes que no hayan realizado pagos junto con el nombre de su representante de ventas

-- 3. Lista las ventas totales de los productos que hayan facturado más de 3000 euros.
-- Mostrar nombre, unidades vendidas, total facturado y total facturado con Impuestos (IVA 21%)

