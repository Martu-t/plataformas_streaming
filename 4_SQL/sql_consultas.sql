use pelis;

## 1. Considerando únicamente la plataforma de Netflix, ¿qué actor aparece más veces? 
/** ya que se han guardado algunos shows que no tienen actores ('unknown') 
se filtra teniendo en cuenta ese detalle **/
SELECT actor.full_name as actor, COUNT(show_for_actor.id_actor) as total_peliculas
FROM show_for_actor
JOIN shows ON show_for_actor.id_show = shows.id_show
JOIN actor ON show_for_actor.id_actor = actor.id_actor
WHERE shows.platform = 'Netflix' AND actor.full_name != 'unknown'
GROUP BY show_for_actor.id_actor
ORDER BY COUNT(show_for_actor.id_actor) DESC
LIMIT 1;

## 2. Top 10 de actores participantes considerando ambas plataformas en el año actual. Se aprecia flexibilidad
# El último año que hay registro es 2021. Usaremos ese como "año" actual, si no usariamos YEAR(curdate())
SELECT a.full_name, COUNT(sa.id_actor) as apariciones
FROM actor a
JOIN show_for_actor sa ON a.id_actor = sa.id_actor
JOIN shows s ON sa.id_show = s.id_show
WHERE release_year = 2021 AND a.full_name != 'unknown'
GROUP BY a.full_name
ORDER BY apariciones DESC
LIMIT 10;


/* 3. Crear un Stored Proceadure que tome como parámetro un año y
devuelva una tabla con las 5 películas con mayor duración en minutos */
DROP PROCEDURE IF EXISTS listarPeliculas;
DELIMITER $$
CREATE PROCEDURE listarPeliculas(anio INT)
BEGIN
	SELECT s.title as pelicula, concat(s.duration_num, " ", s.duration_unit) as duracion
	FROM shows s
	WHERE duration_unit = 'min' AND release_year = anio 
	ORDER BY duration_num DESC
	LIMIT 5;
END $$
DELIMITER ;

# Llamamos al procedimiento
CALL listarPeliculas(2015);

