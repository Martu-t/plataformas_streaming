use peliculas;

## 1. Considerando únicamente la plataforma de Disney, ¿qué actor aparece más veces? 
/** ya que se han guardado algunos shows que no tienen actores ('unknown') 
se filtra teniendo en cuenta ese detalle **/
SELECT actor.full_name as actor, COUNT(show_for_actor.id_actor) as total_peliculas
FROM show_for_actor
JOIN shows ON show_for_actor.id_show = shows.id_show
JOIN actor ON show_for_actor.id_actor = actor.id_actor
JOIN platform ON shows.id_platform = platform.id_platform
WHERE platform.platform = 'Disney' AND actor.full_name != 'unknown'
GROUP BY show_for_actor.id_actor
ORDER BY COUNT(show_for_actor.id_actor) DESC
LIMIT 1;

## 2. Cantidad de películas en estos Países: USA, Francia y Argentina
SELECT 
sum(case when country='United States' then 1 else 0 end) as Shows_in_United_States,
sum(case when country='France' then 1 else 0 end) as Shows_in_France,
sum(case when country='Argentina' then 1 else 0 end) as Shows_in_Argentina
FROM country c
JOIN show_for_country sc ON c.id_country = sc.id_country
JOIN shows s ON sc.id_show = s.id_show;

/* 3. Crear un Stored Proceadure que tome como parámetro minutos (numero entero) y
devuelva una tabla con 10 películas que duren ese tiemo o menos */
DROP PROCEDURE IF EXISTS listarPeliculasMin;
DELIMITER $$
CREATE PROCEDURE listarPeliculasMin(minutos INT)
BEGIN
	SELECT s.title as pelicula, concat(s.duration_num, " ", s.duration_unit) as duracion
	FROM shows s
	WHERE duration_unit = 'min' AND duration_num <= minutos 
	ORDER BY duration_num DESC
	LIMIT 10;
END $$
DELIMITER ;
CALL listarPeliculasMin(88);

## 4. Top 10 de géneros considerando ambas plataformas en el 2020.
SELECT g.genre as genero, COUNT(sg.id_genre) as total_de_shows
FROM genre g
JOIN show_for_genre sg ON g.id_genre = sg.id_genre
JOIN shows s ON sg.id_show = s.id_show
WHERE release_year = 2020 AND g.genre != 'unknown'
GROUP BY g.genre
ORDER BY total_de_shows DESC
LIMIT 10;