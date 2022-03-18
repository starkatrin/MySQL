  	  	
-- Три самых рейтинговых фильма из категории "Платные"

  	SELECT DISTINCT m.id, m.moviename, m.movie_status, ROUND(AVG(hv.movie_score)) AS total_score
  		FROM 
  			movies m
  		LEFT JOIN 
  			 history_views hv
  		ON m.id = hv.movie_id 
  		GROUP BY m.id
  			HAVING m.movie_status = "PAID"
  				ORDER BY total_score DESC LIMIT 3;
  			
 
  -- Все медиафайлы последнего вышедшего фильма
  			
  	SELECT m.moviename AS movie, m.premiere AS date_premiere, mf.id, mf.filename AS files
  	FROM
  		movies m
  	LEFT JOIN
  		mediafiles_contents_movies mcm  
  	ON m.id = mcm.object_id AND mcm.object_type = "movie" 
  	LEFT JOIN  mediafiles mf 
  	ON mcm.mediafile_id = mf.id 
  		ORDER BY date_premiere DESC LIMIT 1;
  			
   	
  	SELECT moviename, premiere FROM movies ORDER BY premiere DESC;	
  
  
  -- Активности смаого старшего пользователя:
  
   SELECT 
    CONCAT (first_name, " ", last_name) AS person,
	(SELECT COUNT(*) FROM likes WHERE likes.user_id = profiles.user_id) AS total_likes,
	(SELECT COUNT(*) FROM history_views WHERE history_views.user_id = profiles.user_id) AS total_scores,
	(SELECT COUNT(*) FROM messages 
		WHERE messages.to_user_id = profiles.user_id OR 
			messages.from_user_id = profiles.user_id) AS total_messages,
	(SELECT COUNT(*) FROM friendship 
		WHERE friendship_status_id IN (1, 2) AND 
			friendship.user_id = profiles.user_id OR 
				friendship.friend_id = profiles.user_id) AS friends
FROM profiles WHERE user_id = (SELECT user_id FROM profiles ORDER BY birthday LIMIT 1);


  
 -- Средний возраст пользователей, количество пользователей которые посмотрели фильм с самой ранней датой премьеры:

SELECT AVG(TIMESTAMPDIFF(YEAR, birthday, NOW())) AS average_age FROM profiles
	WHERE user_id IN 
		(SELECT user_id FROM history_views 
			WHERE movie_id = (SELECT id FROM movies ORDER BY premiere LIMIT 1));
  	
		
		
-- Представления:
		-- Фамилии и имена пользователей с соответствующей подпиской и ценой за нее:

		
CREATE OR REPLACE VIEW name_sub AS 
	SELECT p.last_name AS last_name,
		   p.first_name AS first_name,
		   s.name AS subscription, 
		   s.price AS price
		FROM profiles p 
		JOIN subscriptions_users su  
		ON p.user_id = su.user_id 
		JOIN subscriptions s 
		ON su.subscription_id = s.id;
	
SELECT * FROM name_sub;


		--  Лайки и дизлайки к контенту:

CREATE OR REPLACE VIEW likes_targets AS
	SELECT ct.name AS content_type,
	       c.decription AS description,
	       c.body AS body,
	       l.like_value AS score
	    FROM content_types ct 
	    JOIN contents c 
	    ON ct.id = c.content_type_id
	    JOIN likes l 
	    ON l.target_id = c.id AND target_type = 'content';
	   
	   
SELECT * FROM likes_targets;



	
  	
  	
  	
  	
  	