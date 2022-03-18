SHOW TABLES;
SELECT * FROM users;
SELECT * FROM profiles;
SELECT * FROM messages;
SELECT * FROM subscriptions;
SELECT * FROM subscriptions_users;
SELECT * FROM friendship;
SELECT * FROM friendship_statuses;
SELECT * FROM movies;
SELECT * FROM contents;

UPDATE users SET updated_at = NOW() WHERE updated_at < created_at;


UPDATE profiles SET created_at = ADDDATE((SELECT created_at FROM users WHERE profiles.user_id = users.id),2);


	
	

SELECT user_id, active, COUNT(*) AS count
FROM
	subscriptions_users
GROUP BY
	user_id,
	active
HAVING 
	count > 1;



SELECT * FROM subscriptions_users;

UPDATE subscriptions_users SET created_at =  DATE_SUB(NOW(), INTERVAL FLOOR(RAND()*12 + 1) MONTH);

UPDATE subscriptions_users SET validity = 12 - (TIMESTAMPDIFF(MONTH, created_at, NOW()));

  
	
	
	UPDATE subscriptions_users SET active = 0 WHERE user_id = 12 AND validity = 5;
	UPDATE subscriptions_users SET active = 1 WHERE user_id IN (4, 13) AND validity IN (0, 4);

SELECT * FROM subscriptions_users WHERE user_id IN (SELECT user_id FROM (SELECT user_id, active, COUNT(*) AS count
FROM
	subscriptions_users
GROUP BY
	user_id,
	active
HAVING 
	count > 1) AS listus) ORDER BY user_id;


SELECT m.id, m.from_user_id, m.to_user_id, m.created_at AS creat, u.created_at AS created_at_from, us.created_at AS created_at_to
	FROM messages m 
LEFT JOIN users u 
ON u.id = from_user_id 
LEFT JOIN users us
ON us.id = to_user_id;

UPDATE messages SET to_user_id = 12 WHERE id = 6; 
UPDATE messages SET to_user_id = 3 WHERE id = 9;


SELECT * FROM users ORDER BY created_at;
SELECT * FROM messages;

UPDATE messages SET created_at =  DATE_ADD(
	(SELECT created_at FROM users WHERE messages.to_user_id = users.id), 
	INTERVAL FLOOR(RAND()*12 + 1) MONTH) 
	WHERE id IN (2, 5, 7, 10, 12, 15, 16);

UPDATE messages SET created_at =  DATE_ADD(
	(SELECT created_at FROM users WHERE messages.from_user_id = users.id), 
	INTERVAL FLOOR(RAND()*12 + 1) MONTH) 
	WHERE id IN (1, 3, 4, 6, 8, 9, 11, 13, 14, 17, 18, 19, 20);


SELECT * FROM friendship;
SELECT * FROM friendship_statuses;

UPDATE friendship SET friendship_status_id = FLOOR (1 + RAND()*3);

UPDATE friendship SET friendship_status_id = 3 WHERE rejected_at IS NOT NULL;
UPDATE friendship SET rejected_by_id = user_id WHERE (FLOOR(0 + RAND() * 2)) AND (rejected_at IS NOT NULL);
UPDATE friendship SET rejected_by_id = friend_id WHERE (rejected_by_id IS NULL) AND (rejected_at IS NOT NULL);


ALTER TABLE friendship ADD COLUMN rejected_by_id INT AFTER rejected_at;
UPDATE friendship SET updated_at = NOW() WHERE updated_at < created_at;

UPDATE friendship SET rejected_at = NULL WHERE friendship_status_id IN (1, 2);
UPDATE friendship SET rejected_by_id = NULL WHERE friendship_status_id IN (1, 2);


SELECT f.user_id, f.friend_id, f.confirmed_at, f.rejected_at, u.created_at AS creat_user, us.created_at AS creat_friend
	FROM friendship f 
LEFT JOIN users u 
ON u.id = f.user_id 
LEFT JOIN users us
ON us.id = f.friend_id;

UPDATE friendship SET confirmed_at =  DATE_ADD(
	(SELECT created_at FROM users WHERE friendship.user_id = users.id), 
	INTERVAL FLOOR(RAND()*12 + 1) MONTH) 
	WHERE user_id = 17 AND friend_id = 15;


UPDATE friendship SET friend_id = FLOOR(RAND() * 20 + 1) WHERE user_id = friend_id;  

UPDATE friendship SET confirmed_at =  DATE_ADD(
	(SELECT created_at FROM users WHERE friendship.friend_id = users.id), 
	INTERVAL FLOOR(RAND()*12 + 1) MONTH) 
	WHERE user_id = 17 AND friend_id = 1;



SELECT * FROM movies;


ALTER TABLE movies MODIFY COLUMN age_requirement ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12','13', '14', '15', '16', '17', '18');
ALTER TABLE movies MODIFY COLUMN age_requirement ENUM('0+', '6+', '12+', '16+', '18+');

CREATE TEMPORARY TABLE age_req (age_requirement VARCHAR (10));
INSERT INTO age_req VALUES ('0+'), ('6+'), ('12+'), ('16+'), ('18+');
SELECT * FROM age_req;

UPDATE movies SET age_requirement = (SELECT age_requirement FROM age_req ORDER BY RAND() LIMIT 1);
DESC movies;

CREATE TEMPORARY TABLE extensions (name VARCHAR (10));
INSERT INTO extensions VALUES ('avi'), ('hdv'), ('avchd'), ('mpeg');
SELECT * FROM extensions;



UPDATE movies SET moviefile = CONCAT(
  'http://www.kinohd.box.ru/films/',
  moviename,
  '.',
  (SELECT name FROM extensions ORDER BY RAND() LIMIT 1)
);

UPDATE movies SET created_at = DATE_SUB(premiere, INTERVAL FLOOR(RAND() * 30 * 24 * 60 * 60) SECOND);


UPDATE contents SET author = CONCAT('{"author":"',
(SELECT CONCAT((SELECT last_name FROM profiles ORDER BY RAND() LIMIT 1), " ",(SELECT first_name FROM profiles ORDER BY RAND() LIMIT 1))),
'"}');


CREATE TEMPORARY TABLE creatdate (id INT, creat TIMESTAMP);
   INSERT INTO creatdate 
   SELECT id,
   	(FROM_UNIXTIME(FLOOR(RAND() * (UNIX_TIMESTAMP(NOW()) - UNIX_TIMESTAMP(created_at)) + UNIX_TIMESTAMP(created_at)))) FROM movies;
   
   SELECT * FROM creatdate;

UPDATE contents SET created_at = (SELECT creat FROM creatdate WHERE contents.id = creatdate.id LIMIT 1);
  
 SELECT c.id, c.created_at AS creat_content, m.created_at AS creat_movie
 	FROM contents c 
 LEFT JOIN movies m 
 	ON c.movie_id = m.id;
 
UPDATE contents SET created_at = DATE_ADD(
	(SELECT created_at FROM movies WHERE movies.id = contents.movie_id), 
	INTERVAL FLOOR(RAND()*12 + 1) MONTH) 
	WHERE id IN (1, 10, 15, 18);



SELECT * FROM comments;

INSERT INTO creatdate 
   SELECT user_id,
   	(FROM_UNIXTIME(FLOOR(RAND() * (UNIX_TIMESTAMP(NOW()) - UNIX_TIMESTAMP(created_at)) + UNIX_TIMESTAMP(created_at)))) FROM profiles;
   
 UPDATE comments SET created_at = (SELECT creat FROM creatdate WHERE comments.user_id = creatdate.id LIMIT 1);


SELECT c.id, c.created_at AS creat_comments, p.created_at AS creat_profile
 	FROM comments c 
 LEFT JOIN profiles p 
 	ON c.user_id = p.user_id;
 
 UPDATE comments SET created_at = DATE_ADD(
	(SELECT created_at FROM profiles WHERE profiles.user_id = comments.user_id), 
	INTERVAL FLOOR(RAND()*12 + 1) MONTH) 
	WHERE id IN (2, 5, 6, 8, 10, 12, 14);



SELECT * FROM history_views; 

UPDATE history_views SET movie_score = NULL;
UPDATE history_views SET movie_score = FLOOR(RAND()*4 + 1) WHERE movie_status = 'NOT INTERESTED';
UPDATE history_views SET movie_score = NULL WHERE movie_status = 'DELAYED';
UPDATE history_views SET movie_score = FLOOR(RAND()*5 + 5) WHERE movie_status = 'VIEWED';

UPDATE history_views SET created_at = (SELECT creat FROM creatdate WHERE history_views.user_id = creatdate.id LIMIT 1);

SELECT hv.user_id, hv.created_at AS creat_hv, m.id, m.created_at AS create_movie, p.created_at AS creat_profile
 	FROM history_views hv 
 LEFT JOIN profiles p 
 	ON hv.user_id = p.user_id
 LEFT JOIN movies m 
 	ON hv.movie_id = m.id;

UPDATE history_views SET created_at = DATE_ADD(
	(SELECT created_at FROM profiles WHERE profiles.user_id = history_views.user_id), 
	INTERVAL FLOOR(RAND()*12 + 1) MONTH) 
	WHERE user_id = 1 AND movie_id = 15;
UPDATE history_views SET created_at = DATE_ADD(
	(SELECT created_at FROM movies WHERE movies.id = history_views.movie_id), 
	INTERVAL FLOOR(RAND()*12 + 1) MONTH) 
	WHERE user_id IN (4, 6, 7) AND movie_id IN (3, 5, 7, 19);


SELECT * FROM reviews;

ALTER TABLE reviews ADD COLUMN movi_id  INT AFTER movie_id;

UPDATE reviews SET movi_id = (SELECT movie_id FROM history_views
	WHERE reviews.user_id = history_views.user_id
	AND movie_status IN ('VIEWED', 'NOT INTERESTED') ORDER BY RAND() LIMIT 1);

DELETE FROM reviews WHERE movi_id IS NULL;
ALTER TABLE reviews DROP COLUMN movie_id;
ALTER TABLE reviews CHANGE movi_id movie_id INT;
ALTER TABLE reviews MODIFY COLUMN movie_id INT UNSIGNED NOT NULL;

DESC reviews;

UPDATE reviews SET user_id = (SELECT user_id FROM history_views ORDER BY RAND() LIMIT 1);

UPDATE reviews SET created_at = DATE_ADD(
	(SELECT created_at FROM movies WHERE movies.id = reviews.movie_id), 
	INTERVAL FLOOR(RAND()*24 + 1) HOUR);

DESC likes;

SELECT * FROM likes;
SELECT * FROM comments;


SELECT l.id, l.user_id, l.target_id, l.target_type, 
	l.created_at AS create_like, 
	cm.created_at AS create_comment, 
	cn.created_at AS create_content, 
	r.created_at AS create_review
	FROM likes l 
LEFT JOIN comments cm 
	ON l.target_id = cm.id AND l.target_type = 'comment'
LEFT JOIN contents cn 
	ON l.target_id = cn.id AND l.target_type = 'content'
LEFT JOIN reviews r 
	ON l.target_id = r.id AND l.target_type = 'review';

  UPDATE likes SET created_at = DATE_ADD(
	(SELECT created_at FROM comments WHERE likes.target_id = comments.id AND likes.target_type = 'comment'), 
	INTERVAL FLOOR(RAND()*30 + 1) DAY);
	
UPDATE likes SET created_at = DATE_ADD(
	(SELECT created_at FROM contents WHERE likes.target_id = contents.id AND likes.target_type = 'content'), 
	INTERVAL FLOOR(RAND()*30 + 1) DAY) WHERE likes.id IN (2, 4, 6, 7, 11, 12, 15, 17, 19);

UPDATE likes SET created_at = DATE_ADD(
	(SELECT created_at FROM reviews WHERE likes.target_id = reviews.id AND likes.target_type = 'review'), 
	INTERVAL FLOOR(RAND()*30 + 1) DAY) WHERE likes.id IN (5, 9, 10, 14, 18);

DELETE FROM likes WHERE created_at IS NULL;



SELECT * FROM mediafiles;
UPDATE mediafiles SET updated_at = NOW() WHERE updated_at < created_at;

CREATE TEMPORARY TABLE file_extensions (name VARCHAR (10));
INSERT INTO file_extensions VALUES ('avi'), ('mp4'), ('mp3'), ('png'), ('jpeg');
SELECT * FROM file_extensions;

UPDATE mediafiles SET filename = CONCAT(
  'http://www.kinohd.box.ru/files/',
  filename,
  '.',
  (SELECT name FROM file_extensions ORDER BY RAND() LIMIT 1)
);
	

UPDATE mediafiles_contents_movies SET created_at = 
	(SELECT created_at FROM contents WHERE mediafiles_contents_movies.object_type = 'content' 
		AND mediafiles_contents_movies.object_id = contents.id)
			WHERE mediafiles_contents_movies.id IN (6, 7, 9, 11, 12, 14, 17, 18);

		
UPDATE mediafiles_contents_movies SET created_at = 
	(SELECT created_at FROM movies WHERE mediafiles_contents_movies.object_type = 'movie' 
		AND mediafiles_contents_movies.object_id = movies.id) 
			WHERE mediafiles_contents_movies.id IN (1, 2, 3, 4, 5, 8, 10, 13, 16, 15, 19, 20);
			

ALTER TABLE profiles MODIFY COLUMN city_id INT UNSIGNED;
ALTER TABLE cities MODIFY COLUMN country_id INT UNSIGNED;
ALTER TABLE movies MODIFY COLUMN country_id INT UNSIGNED;

USE kinohd;
DESC subscriptions_users;
SELECT * FROM  subscriptions_users;
ALTER TABLE subscriptions_users MODIFY COLUMN validity tinyint unsigned;


UPDATE subscriptions_users SET validity = 2 WHERE user_id = 1;
UPDATE subscriptions_users SET created_at = '2021-05-14 15:24:30' WHERE user_id = 1;