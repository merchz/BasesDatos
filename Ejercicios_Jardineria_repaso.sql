-- 1. Listado de clientes indicando nombre del cliente y cuántos pedidos ha efectuado.

    SELECT 
    COUNT(*) AS pedidos,
    Clientes.NombreCliente,
    Pedidos.CodigoCliente
FROM
    Clientes,
    Pedidos
WHERE
    Pedidos.CodigoCliente = Clientes.CodigoCliente
GROUP BY CodigoCliente;
-- 2. Listado con los nombres de los clientes y el total pagado por cada uno de ellos.
-- 3.El nombre de los clientes que hayan hecho pedidos en 2009.
SELECT 
    Clientes.NombreCliente, Pedidos.FechaPedido
FROM
    Clientes
        INNER JOIN
    Pedidos ON Clientes.CodigoCliente = Pedidos.CodigoCliente
WHERE
Pedidos.FechaPedido LIKE '2009%';
-- 4. El nombre del cliente y el nombre y apellido de sus representantes de los clientes de Madrid.

SELECT 
    Clientes.NombreCliente,
    Empleados.Nombre,
    Empleados.Apellido1
FROM
    Clientes
        INNER JOIN
    Empleados ON Clientes.CodigoEmpleadoRepVentas = Empleados.CodigoEmpleado
WHERE
Clientes.Ciudad = 'Madrid';
-- 5. Un listado de clientes con el nombre de su representante y la ciudad donde está su oficina.
SELECT 
    Clientes.NombreCliente, Empleados.Nombre as Nombre_Representante, Oficinas.Ciudad
FROM
    Clientes
        INNER JOIN
    Empleados ON Clientes.CodigoEmpleadoRepVentas = Empleados.CodigoEmpleado
        INNER JOIN
Oficinas ON Empleados.CodigoOficina = Oficinas.CodigoOficina; 
-- 6. Nombre, apellidos, oficina y cargo de los empleados que no son reprentantes de ventas.
SELECT 
    Empleados.Nombre,
    Empleados.Apellido1,
    Empleados.Apellido2,
    Empleados.Puesto,
    Oficinas.Ciudad
   
FROM
    Empleados
        INNER JOIN
    Oficinas ON Empleados.CodigoOficina = Oficinas.CodigoOficina
WHERE
Empleados.Puesto <> 'Representante Ventas';
-- 7. Número de empleados de cada oficina y ciudad donde está situada.	
SELECT 
    Oficinas.CodigoOficina,
    Oficinas.Ciudad,
    COUNT(Empleados.CodigoEmpleado)
FROM
    Oficinas
        INNER JOIN
    Empleados ON Oficinas.CodigoOficina = Empleados.CodigoOficina
GROUP BY CodigoOficina;
-- 8. Listado con el nombre de los empleados y el nombre de sus jefes.

 



