-- Importar bd
mysql -u root -p nombreBD < RutaArchivo.sql;
-- Consultas realizadas el 12/12/2018
-- mostrar registros de la columna 'conferencia' de la tabla 'equipos' cuyos registros sean 'East'
select conferencia from equipos where conferencia = 'East';
-- mostrar todas las columnas de la tabla 'equipos' con registros 'East' de la columna conferencia
select * from equipos where conferencia = 'East';
-- Devuelve el número de filas, sabremos cuantos equipos hay en la conferencia 'East'
select count(*) from equipos where conferencia='East';
-- Mostrar todas las columnas de la tabla jugadores donde la columna 'peso' sea más de 300
select * from jugadores where peso>300;
-- Mostrar todas las columnas de la tabla jugadores donde el campo 'nombre' sea pau gasol
select * from jugadores where nombre='Pau Gasol';
-- Mostrar toda las columnas de la tabla jugadores de la columna procedencia sea 'Spain', 'Los Ángeles','Houston'
select * from jugadores where procedencia in ('Spain', 'Los Ángeles', 'Houston');
-- Mostrar el máximo de la columna 'altura' de la tabla jugadores
select max(Altura) from jugadores;
-- Mostrar 2 columnas pero de forma descendente la columna 'altura'
select nombre, altura from jugadores order by altura desc;
-- Mostrar todas las columnas de la tabla jugadores donde en la columna 'nombre' lleven la palabra john
select * from jugadores where nombre like '%John%';
-- Mostrar la columna División sin registros repetidos de la tabla equipos
select distinct Division from equipos;
-- Seleccionamos las columnas 'Posición''nombre' de la tabla jugadores donde la columna 'nombre' sea Pau Gasol
select Posicion,nombre from jugadores where nombre='Pau Gasol';
-- Mostrar las columnas 'Posicion''nombre' de la tabla 'jugadores' con NombreDelEquipo	'Grizzlies'
select Posicion,nombre from jugadores where Nombre_equipo="Grizzlies";
-- Mostrar jugadores que juegen en los lakers y en la posicion 'F-C'
select posicion,nombre from jugadores where Nombre_equipo='Lakers' and Posicion='F-C';
-- Mostrar columna 'nombre' de la tabla jugadores donde la columna posición sea 'F-C' y altura mayor de '6-0'
select nombre from jugadores where posicion='F-C' and Altura>'6-0';
-- Contar todas las filas de la tabla partidos en laque los Raptors jugaron de local en la temporada '99/00'
select count(*)from partidos where equipo_local='Raptors' and temporada='99/00';
-- puntos mínimos como visitante
select min(puntos_visitante)from partidos;
-- Mostar equipo local y equipo visitante en la que los puntos visitantes sean '158'
select equipo_local, equipo_visitante from partidos where puntos_visitante='158';
-- contar todas las filas de la tabla partidos donde los lakers en la temporada '99/00' obtuvieron menos puntos de local que de visitante
select count(*)from partidos where equipo_local='lakers' and temporada='99/00' and puntos_local<puntos_visitante;
-- Mostrar columnas equipo local, equipo visitante, puntos local, puntos visitante de la tabla partidos donde equipo_local se 'lakers' temporada'99/00' y los puntos_local sea menor que puntos_v
select equipo_local, equipo_visitante, puntos_local, puntos_visitante from partidos where equipo_local='lakers' and temporada='99/00' and puntos_local<puntos_visitante;
-- la orden anterior ordenada de manera descendente
select equipo_local, equipo_visitante, puntos_local, puntos_visitante from partidos where equipo_local='Lakers' and temporada='99/00' and puntos_local<puntos_visitante or equipo_visitante='Lakers'and temporada='99/00'and puntos_local<puntos_visitante order by equipo_local asc;
-- fecha de consulta 13/12/2018
-- realizar una suma
select 3+5;
-- media de la columna peso de tabla jugadores
SELECT 
    AVG(peso)
FROM
    jugadores;
 -- Mostrar las columnas 'nombre''peso' de la tabla 'jugadores' donde el peso este entre 220 y 250
 SELECT 
    nombre, peso
FROM
    jugadores
WHERE
    peso BETWEEN 220 AND 250;
-- convertir el peso de libras a kilo
select nombre, peso/2.20462 from jugadores where peso between 200 and 250;
-- convertir nombre de columna 'peso/2.20462'a 'peso en kg'
select nombre, peso/2.20462 as 'peso en kg'from jugadores where peso between 200 and 250;
-- jugadores que juengan en el equipo 'TimberWolves'
select count(*) from jugadores where nombre_equipo='Timberwolves';
-- peso medio del equipo 'Knicks'
select avg(peso) from jugadores where nombre_equipo='Knicks';
--
select avg(peso/2.20462) as 'peso en Kg' from jugadores where nombre_equipo='Knicks';
--
select jugadores.nombre from jugadores, equipos where Ciudad="Los Angeles"and jugadores.nombre_equipo=equipos.nombre;
-- jugadores de la conferencia oeste que midan más de 7 feet
select jugadores.Nombre from jugadores, equipos where equipos.Conferencia='West'and jugadores.altura>'7-0' and jugadores.nombre_equipo=equipos.nombre;
-- Ordenar del más al más bajo
select jugadores.nombre from jugadores, equipos where equipos.conferencia='West'and jugadores.Altura>'7-0' and jugadores.Nombre_equipo=equipos.nombre order by altura desc;

-- consulta realizada el 18/12/2018
-- Subconsulta
--
select nombre, altura from jugadores where altura= (select max(altura) from jugadores);
-- agrupar conferencias en este caso 'west' y 'east'
select conferencia, count(*) from equipos group by conferencia;
-- agrupamos por conferencia los equipos que empiecen con la letra 'c'
select conferencia, count(*) from equipos where nombre like'c%' group by conferencia;
--
select procedencia, avg(peso) from jugadores where procedencia='Spain';
--IN 'Pertenencia a conjuntos' por ejemplo en este caso jugadores que sean de francia o españa
select procedencia, avg(peso) from jugadores where procedencia IN('Spain','France') group by Procedencia;
--
SELECT 
    nombre_equipo, AVG(peso)
FROM
    jugadores
GROUP BY nombre_equipo
HAVING AVG(peso) > 230
ORDER BY AVG(peso);
-- juagores total en la NBA
select count(*) from jugadores;
-- contar jugadores que hay en la conferencia oeste
select count(jugadores.nombre) from jugadores, equipos where equipos.Conferencia='west' and jugadores.Nombre_equipo=equipos.Nombre;
-- con una subconsulta la anterior
select count(nombre) from jugadores where nombre_equipo IN(select nombre from equipos where conferencia='west');
-- 19/12
-- nombre y ciudad de los equipos en los que juegan los español
select nombre, ciudad from equipos where exists (select * from jugadores where jugadores.Procedencia='Spain' and jugadores.Nombre_equipo=equipos.nombre); 
-- jugadores que pesan más que el jugador español más pesado
select nombre from jugadores where peso>all(select peso from jugadores where procedencia='Spain');
-- los bases que pesan más que algún pivot
select nombre from jugadores where posicion='G' and peso>any(select peso from jugadores where posicion='c');
--
select equipos.nombre, equipos.ciudad, jugadores.nombre from equipos, jugadores where jugadores.Procedencia='Spain' and jugadores.Nombre_equipo=equipos.nombre;
--
SELECT 
    jugadores.nombre, estadisticas.Puntos_por_partido
FROM
    estadisticas,
    jugadores
WHERE
    jugadores.Procedencia = 'Spain'
        AND jugadores.codigo = estadisticas.jugador
        AND estadisticas.temporada = '01/02';








