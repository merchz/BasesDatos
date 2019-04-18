-- 1. Crea una función que reciba una fecha 'YYYY-MM-DD' y devuelva el día de la semana (nombre) que es.
DELIMITER $$
create function devuelvediasemana (fecha date)
returns VARCHAR(10)
deterministic
BEGIN
DECLARE numdia int;
DECLARE nbdia varchar(10);
set numdia=weekday(fecha);

case numdia

when 0 then set nbdia='lunes';
when 1 then set nbdia='Martes';
when 2 then set nbdia='Miércoles';
when 3 then set nbdia='jueves';
when 4 then set nbdia='viernes';
when 5 then set nbdia='sabado';
when 6 then set nbdia='Domingo';

end case;
return nbdia;
end $$
 
select devuelvediasemana ('1982-12-01');

-- 2. Crea una función que devuelva el menor de tres números pasados como parámetros.
delimiter $$
create function menordetres(n1 int, n2 int, n3 int)
returns int
deterministic		
begin 
declare menor int;
if n1<n2 then 
	if n1 < n3 then 
		set menor = n1;
	elseif n2<n3 then
		set menor =n2;
	else
		set menor= n3; 
	end if;
    return menor;
    end $$
select menordetres ('1','9','6');


    
