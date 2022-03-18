CREATE DATABASE kinohd;

USE kinohd;


-- Таблица пользователей
CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  email VARCHAR(100) NOT NULL UNIQUE COMMENT "Почта",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Пользователи";  


-- Таблица профилей
CREATE TABLE profiles (
  user_id INT UNSIGNED NOT NULL PRIMARY KEY COMMENT "Ссылка на пользователя",
  first_name VARCHAR(100) NOT NULL COMMENT "Имя пользователя",
  last_name VARCHAR(100) NOT NULL COMMENT "Фамилия пользователя",
  gender ENUM("m", "f") NOT NULL COMMENT "Пол",
  birthday DATE COMMENT "Дата рождения",
  city_id VARCHAR(130) COMMENT "Город проживания",
  my_devices VARCHAR(255) NOT NULL COMMENT "Подкюченные устройства",
  my_accounts VARCHAR(255) COMMENT "Привязанные аккаунты соц.сетей",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Профили"; 


-- Таблица городов
CREATE TABLE cities (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(130) COMMENT "Название города",
  country_id INT COMMENT "Ссылка на страну",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Города"; 


-- Таблица стран
CREATE TABLE countries (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  name VARCHAR(130) COMMENT "Название страны",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Страны";

-- Таблица сообщений
CREATE TABLE messages (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  from_user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на отправителя сообщения",
  to_user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на получателя сообщения",
  body TEXT NOT NULL COMMENT "Текст сообщения",
  is_delivered BOOLEAN COMMENT "Признак доставки",
  created_at DATETIME DEFAULT NOW() COMMENT "Время создания строки"
) COMMENT "Сообщения";

-- Таблица дружбы
CREATE TABLE friendship (
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на инициатора дружеских отношений",
  friend_id INT UNSIGNED NOT NULL COMMENT "Ссылка на получателя приглашения дружить",
  friendship_status_id INT UNSIGNED NOT NULL COMMENT "Ссылка на статус (текущее состояние) отношений",
  confirmed_at DATETIME COMMENT "Время подтверждения приглашения",
  rejected_at DATETIME COMMENT "Время удаления из друзей",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",  
  PRIMARY KEY (user_id, friend_id) COMMENT "Составной первичный ключ"
) COMMENT "Таблица дружбы";

-- Таблица статусов дружеских отношений
CREATE TABLE friendship_statuses (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "Название статуса",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
) COMMENT "Статусы дружбы";


-- Таблица подписок
CREATE TABLE subscriptions (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор сроки",
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "Название подписки",
  conditions  VARCHAR(255) NOT NULL UNIQUE COMMENT "Условия подписки",
  price SMALLINT UNSIGNED NOT NULL COMMENT "Стоимость подписки",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
) COMMENT "Группы";


-- Таблица связи пользователь - подписка
CREATE TABLE subscriptions_users (
  subscription_id INT UNSIGNED NOT NULL COMMENT "Ссылка на подписку",
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
  active BOOLEAN COMMENT "Активность подписки",
  validity TINYINT UNSIGNED NOT NULL COMMENT "Время действия подписки в месяцах",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  PRIMARY KEY (subscription_id, user_id) COMMENT "Составной первичный ключ"
) COMMENT "Участники групп, связь между пользователями и группами";


-- Таблица истории активности пользователя в кинотеатре (просмотры, оценки, отложенные фильмы)
CREATE TABLE history_views (
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
  movie_id INT UNSIGNED NOT NULL COMMENT "Ссылка на видео",
  movie_status ENUM('VIEWED', 'DELAYED', 'NOT INTERESTED') COMMENT "Пометка видео пользователем",
  movie_score ENUM('NULL', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10') COMMENT "Оценка пользователя",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
  PRIMARY KEY (movie_id, user_id) COMMENT "Составной первичный ключ"
) COMMENT "История просмотров";

-- Таблица пользовательских рецензий на видео
CREATE TABLE reviews (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
  movie_id INT UNSIGNED NOT NULL COMMENT "Ссылка на видео",
  body TEXT NOT NULL COMMENT "Содержание рецензии",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Рецензии на фильмы";

-- Таблица комментариев 
CREATE TABLE comments (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
  body TEXT NOT NULL COMMENT "Текст комментария",
  target_id INT UNSIGNED NOT NULL COMMENT "Ссылка на комментируемый объект",
  target_type ENUM('review', 'content', 'comment') NOT NULL COMMENT "Тип объекта",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки"
) COMMENT "Комментарии пользователей к рецензиям и контенту";


-- Таблица лайков и дизлайков
CREATE TABLE likes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
  like_value TINYINT NOT NULL COMMENT "Значение лайк/дизлайк",
  target_id INT UNSIGNED NOT NULL COMMENT "Ссылка на цель лайка/дизлайка",
  target_type ENUM('review', 'content', 'comment') NOT NULL COMMENT "Тип цели",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки"
) COMMENT "Лайки/дизлайки пользователей к рецензиям, комментариям и контенту";


-- Таблица медиаконтента сайта
CREATE TABLE contents (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  content_type_id INT UNSIGNED NOT NULL COMMENT "Ссылка на тип медиаконтента",
  decription  VARCHAR(255) NOT NULL COMMENT "Описание медиаконтента",
  body TEXT NOT NULL COMMENT "Содержание (текст) медиаконтента",
  movie_id INT UNSIGNED NOT NULL COMMENT "Ссылка на видео, которому посвящен контент",
  mediafile_id INT UNSIGNED NOT NULL COMMENT "Ссылка на медиафайл",
  author JSON COMMENT "Автор медиа",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Медиаконтент сайта";


-- Таблица типов медиаконтента сайта
CREATE TABLE content_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  name VARCHAR(255) NOT NULL UNIQUE COMMENT "Название типа",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Типы медиаконтента";


-- Таблица медиафайлов
CREATE TABLE mediafiles (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  mediafile_type ENUM('trailer', 'teaser', 'video', 'photo', 'audio') COMMENT "Тип медиафайла",
  filename VARCHAR(255) NOT NULL COMMENT "Путь к медиафайлу",
  size INT NOT NULL COMMENT "Размер файла",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Медиафайлы";


-- Таблица связи медиафайлов с медиаконтентом и видео
CREATE TABLE mediafiles_contents_movies (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  mediafile_id INT UNSIGNED NOT NULL COMMENT "Ссылка на медиафайл",
  object_id INT UNSIGNED NOT NULL COMMENT "Ссылка на связанный объект",
  object_type ENUM('content', 'movie') NOT NULL COMMENT "Тип объекта",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Связь между медиафайлами с контентом и видео";


-- Таблица фильмов/сериалов
CREATE TABLE movies (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  moviename VARCHAR(255) NOT NULL COMMENT "Название видео",
  moviedesc TEXT COMMENT "О чем видео",
  plot TEXT COMMENT "Краткое описание сюжета",
  genre_id INT UNSIGNED NOT NULL COMMENT "Ссылка на жанр",
  premiere DATE COMMENT "Дата премьеры",
  age_requirement TINYINT COMMENT "Возрастной ценз",
  country_id INT UNSIGNED NOT NULL COMMENT "Страна производства",
  movie_status ENUM('PAID', 'FREE') NOT NULL COMMENT "Статус видео платный/бесплатный",
  moviefile VARCHAR(255) NOT NULL COMMENT "Путь к видеофайлу",
  moviesize INT NOT NULL COMMENT "Размер видеофайла",
  movie_type ENUM('film', 'serial') NOT NULL COMMENT "Тип объекта",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Видео";


-- Таблица жанров
CREATE TABLE genres (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  name ENUM('Comedy', 'Action', 'Melodrama', 'Crime', 'Thriller', 'Horror', 'Adventure', 'Drama', 'Fantastic') NOT NULL COMMENT "Название жанра",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки"
) COMMENT "Жанры";

-- Таблица персон
CREATE TABLE persons (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  first_name VARCHAR(100) NOT NULL COMMENT "Имя персоны",
  last_name VARCHAR(100) NOT NULL COMMENT "Фамилия персоны",
  gender ENUM("m", "f") NOT NULL COMMENT "Пол",
  birthday DATE COMMENT "Дата рождения",
  country_id INT UNSIGNED NOT NULL COMMENT "Страна проживания",
  profession ENUM('actor', 'producer', 'director') COMMENT "Профессия в киноиндустрии",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Персоны";


-- Таблица связи видео и персон
CREATE TABLE movies_persons (
  movie_id INT UNSIGNED NOT NULL COMMENT "Ссылка на номер группы",
  person_id INT UNSIGNED NOT NULL COMMENT "Ссылка на персону",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
  PRIMARY KEY (movie_id,person_id) COMMENT "Составной первичный ключ"
) COMMENT "Персоны в видео";

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
DESC movies;
SELECT * FROM contents;
SELECT * FROM reviews;
SELECT * FROM comments;
SELECT * FROM history_views;
SELECT * FROM likes;
SELECT * FROM movies_persons;



	
ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;
  ALTER TABLE profiles
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

