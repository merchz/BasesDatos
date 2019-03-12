-- Crea un usuario 'creausuarios' y otórgale permisos para que pueda crear usuarios.
create user 'creausuarios'@'localhost' identified by 'P@ssw0rd';
grant all privileges on *.* to 'creausuarios'@'localhost';
-- Conecta como 'creausuarios' crea un nuevo usuario 'usujardineria'.
mysql -u creausuarios -p;
create user 'usujardineria'@'localhost' identified by 'P@ssw0rd';
-- Conecta como 'root', otórgale permisos al usuario 'usujardineria' para que pueda crear tablas en jardineria.
grant create on jardineria.* to 'usujardineria'@'localhost';

-- Conecta como 'usujardineria' comprueba que dispone de los permisos creando una tabla de árboles en jardineria. 
-- La tabla debe tener código, nombre, altura máxima y edad de vida media.
-- mysql -u usujardineria -p;
CREATE TABLE arboles(
  codigo int NOT NULL,
  nombre varchar(50) default null,
  altura varchar(4) default null,
  edad int(3) DEFAULT NULL,
  PRIMARY KEY (codigo)
)ENGINE=InnoDB;
-- Conecta como 'root', muestra los permisos que tiene el usuario 'usujardineria'.
SHOW GRANTS FOR usujardineria@localhost;
-- Conecta como 'usujardineria' muestra los permisos que posee y comprueba que son los mismos a los de la orden anterior.
show grants for 'usujardineria'@'localhost';
+---------------------------------------------------------------+
| Grants for usujardineria@localhost                            |
+---------------------------------------------------------------+
| GRANT USAGE ON *.* TO `usujardineria`@`localhost`             |
| GRANT CREATE ON `jardineria`.* TO `usujardineria`@`localhost` |
+---------------------------------------------------------------+
2 rows in set (0,00 sec)
-- Conecta como 'root' otorga permiso de creación y borrado, así como de ejecución al usuario 'usujardineria'
-- sobre una base de datos creada previamente.
grant create,delete,execute on arboles.* to 'usujardineria'@'localhost';
-- Conecta como 'root' crea un usuario de nombre 'creartablasnba' que tenga permisos para crear, borrar y modificar tablas de nba.

create user 'creartablasnba'@'localhost' identified by 'P@ssw0rd';
grant create,delete,execute on nba.* to 'creartablasnba'@'localhost';
-- Conecta como 'creartablasnba' crea un tabla sencilla de al menos dos columnas.
CREATE TABLE nbaprueba (
    codigo INT NOT NULL,
    nombre VARCHAR(50) DEFAULT NULL,
    altura VARCHAR(4) DEFAULT NULL,
    edad INT(3) DEFAULT NULL,
    PRIMARY KEY (codigo)
)  ENGINE=INNODB;
-- Conecta como 'root' crea un usuario de nombre 'soloconsulta' que pueda realizar operaciones de consulta sobre todas las tablas de todas las bases de datos.
grant select on *.* to 'soloconsulta'@'localhost';
-- Añade a 'soloconsulta' el permiso de insertar en la tabla jugadores de nba.
grant insert on nba.jugadores to 'soloconsulta'@'localhost';
-- Conecta como 'soloconsulta' añade una fila a la tabla arboles creada anteriormente. Intenta borrar la fila creada. Describe la respuesta obtenida.