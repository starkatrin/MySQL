SHOW TABLES;

SELECT * FROM users;

SELECT * FROM subscriptions;

SELECT * FROM friendship_statuses;

SELECT * FROM cities;

SELECT * FROM mediafiles;

SELECT * FROM mediafiles_contents_movies;

SELECT * FROM countries;

SELECT * FROM persons;

SELECT * FROM content_types;

SELECT * FROM cities;
SELECT * FROM profiles;
SELECT * FROM messages;
SELECT * FROM subscriptions_users;
SELECT * FROM friendship;
SELECT * FROM movies;
SELECT * FROM contents;
SELECT * FROM reviews;
SELECT * FROM comments;
SELECT * FROM history_views;
SELECT * FROM likes;
SELECT * FROM movies_persons;



	
ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT profiles_city_id_fk 
    FOREIGN KEY (city_id) REFERENCES cities(id)
      ON DELETE SET NULL;
   
   	
 ALTER TABLE messages
  ADD CONSTRAINT messages_from_user_id_fk 
    FOREIGN KEY (from_user_id) REFERENCES users(id)
    	ON DELETE CASCADE,
  ADD CONSTRAINT messages_to_user_id_fk 
    FOREIGN KEY (to_user_id) REFERENCES users(id)
   		ON DELETE CASCADE;
   	
   	
 ALTER TABLE cities 
  ADD CONSTRAINT cities_country_id_fk 
    FOREIGN KEY (country_id) REFERENCES countries(id)
      ON DELETE SET NULL;

     
ALTER TABLE subscriptions_users
  ADD CONSTRAINT subscriptions_users_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
   		ON DELETE CASCADE,
  ADD CONSTRAINT subscriptions_users_subscription_id_fk 
    FOREIGN KEY (subscription_id) REFERENCES subscriptions(id)
   		ON DELETE CASCADE;
   	
   	
ALTER TABLE friendship 
  ADD CONSTRAINT friendship_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
    	ON DELETE CASCADE,
  ADD CONSTRAINT friendship_friend_id_fk 
    FOREIGN KEY (friend_id) REFERENCES users(id)
    	ON DELETE CASCADE,
  ADD CONSTRAINT friendship_friendship_status_id_fk  
    FOREIGN KEY (friendship_status_id) REFERENCES friendship_statuses(id)
    	ON DELETE RESTRICT;
    
    
ALTER TABLE movies 
	ADD CONSTRAINT movies_genre_id_fk
		FOREIGN KEY (genre_id) REFERENCES genres(id)
			ON DELETE RESTRICT,
	ADD CONSTRAINT movies_country_id_fk 
    	FOREIGN KEY (country_id) REFERENCES countries(id)
      		ON DELETE SET NULL;
      	
      	
 ALTER TABLE contents 
	ADD CONSTRAINT contents_content_type_id_fk
		FOREIGN KEY (content_type_id) REFERENCES content_types(id)
			ON DELETE RESTRICT,
	ADD CONSTRAINT contents_movie_id_fk 
    	FOREIGN KEY (movie_id) REFERENCES movies(id)
      		ON DELETE RESTRICT,
   ADD CONSTRAINT contents_mediafile_id_fk 
    	FOREIGN KEY (mediafile_id) REFERENCES mediafiles(id)
      		ON DELETE RESTRICT;
      	
      	
 
ALTER TABLE reviews 
	ADD CONSTRAINT reviews_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE,
	ADD CONSTRAINT reviews_movie_id_fk 
    	FOREIGN KEY (movie_id) REFERENCES movies(id)
      		ON DELETE RESTRICT;
      	
      	
 ALTER TABLE comments 
  ADD CONSTRAINT comments_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;
     
     
 ALTER TABLE history_views 
  ADD CONSTRAINT history_views_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT history_views_movie_id_fk 
    FOREIGN KEY (movie_id) REFERENCES movies(id)
      ON DELETE RESTRICT;
     
     
 ALTER TABLE likes 
  ADD CONSTRAINT likes_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;
     
     
ALTER TABLE movies_persons 
  ADD CONSTRAINT movies_persons_user_id_fk 
    FOREIGN KEY (movie_id) REFERENCES movies(id)
      ON DELETE RESTRICT,
  ADD CONSTRAINT movies_persons_person_id_fk
  	FOREIGN KEY (person_id) REFERENCES persons(id)
      ON DELETE RESTRICT;
     
     
     
ALTER TABLE mediafiles_contents_movies 
  ADD CONSTRAINT mediafiles_contents_movies_mediafile_id_fk 
    FOREIGN KEY (mediafile_id) REFERENCES mediafiles(id)
      ON DELETE RESTRICT;
