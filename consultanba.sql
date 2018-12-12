-- temporada donde los lakers perdieron más partidos como locales
select equipo_local, equipo_visitante, puntos_local, puntos_visitante from partidos where equipo_local='lakers' and temporada='99/00' and puntos_local<puntos_visitante;
-- Máximo de puntos visitantes de la tabla partidos
select max(puntos_visitante) from partidos;
-- equipo local y visitante de la tabla partidos con punto visitantes 50
select equipo_local,equipo_visitante from partidos where puntos_visitante='50';
-- mostrar la tabla partidos donde el equipo visitante raptors en la temporada 99/00
select *  from partidos where equipo_visitante = 'raptors' and temporada='99/00';
-- -- mostrar la tabla partidos donde el equipo local raptors en la temporada 99/00
select *  from partidos where equipo_local = 'raptors' and temporada='99/00';
mostrar todos los partidos como local del equipo raptors
select * from partidos where equipo_local = 'raptors';