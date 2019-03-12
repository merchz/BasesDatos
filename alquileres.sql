-- La base de datos está un poco anticuada en las fechas. Para actualizarla se propone:
UPDATE rental SET rental_date  = NOW();
UPDATE rental SET return_date  = NOW();
-- Añadir a las columnas de la fecha de alquiler y devolución 13 años sobre sus valores actuales.
	
