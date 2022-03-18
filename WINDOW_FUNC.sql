SELECT DISTINCT genres.id, genres.name AS genre,
(SELECT COUNT(*) FROM movies) AS total_movies,
COUNT(history_views.user_id) OVER(PARTITION BY movies.genre_id ) AS views_in_genre,
COUNT(history_views.user_id) OVER(PARTITION BY movies.genre_id ) / (SELECT COUNT(*) FROM movies)*100 AS "%%",
FIRST_VALUE(CONCAT(profiles.last_name, " ", profiles.first_name)) 
	OVER (PARTITION BY movies.genre_id ORDER BY profiles.birthday DESC) AS youngest_user,
FIRST_VALUE(CONCAT(profiles.last_name, " ", profiles.first_name))
	OVER (PARTITION BY movies.genre_id ORDER BY profiles.birthday ASC) AS oldest_user
		FROM movies
		LEFT JOIN genres
        	ON genres.id = movies.genre_id
         JOIN history_views
        	ON movies.id = history_views.movie_id  AND (history_views.movie_status = 'VIEWED' OR history_views.movie_status = 'NOT INTERESTED')
         JOIN profiles 
        	ON history_views.user_id = profiles.user_id;
     	