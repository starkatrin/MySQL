USE kinohd;


-- Создадим триггер для проверки возрастного ценза пользователя при выборе фильма к просмотру
 
DROP TRIGGER IF EXISTS age_req_valid;
DELIMITER //

CREATE TRIGGER age_req_valid BEFORE INSERT ON history_views

FOR EACH ROW BEGIN
  IF (SELECT age_requirement FROM movies WHERE movies.id = NEW.movie_id) > 
  	(SELECT (TIMESTAMPDIFF(YEAR, birthday, NOW())) FROM profiles WHERE profiles.user_id = NEW.user_id)
  THEN
    SIGNAL SQLSTATE "45000"
    SET MESSAGE_TEXT = "Error! You did not rich the age requirement!";
  END IF;
END//

DELIMITER ;

INSERT INTO history_views (user_id, movie_id) VALUES (9, 3);



-- Функция уведомления об истечении срока подписки


DROP FUNCTION IF EXISTS validity_sub;
DELIMITER //

CREATE FUNCTION validity_sub(dtime INT)
RETURNS TINYTEXT NO SQL
BEGIN
	CASE 
		WHEN dtime = 1 THEN
		RETURN "Ваша подписка заканчивается. Осталось 30 дней.";
		WHEN dtime = 0 THEN
		RETURN "Для дальнейшего использования аккаунта необходимо продлить подписку.";
		WHEN dtime > 1 THEN 
		RETURN "Приятного просмотра.";
	END CASE;
END //
	
DELIMITER ;

SELECT validity_sub(1);


-- Процедура ежемесячного обновления срока подписки

DROP PROCEDURE IF EXISTS validity_update;
DELIMITER //


CREATE PROCEDURE validity_update(IN us_id INT)
BEGIN
DECLARE dtime TINYINT;
IF MONTH(NOW()) > (SELECT MONTH(updated_at) FROM subscriptions_users WHERE user_id = us_id)
  	AND DAY(NOW()) = (SELECT DAY(created_at) FROM subscriptions_users WHERE user_id = us_id) THEN
  	SET dtime = (SELECT validity FROM subscriptions_users WHERE user_id = us_id) - 1;
  	UPDATE subscriptions_users SET validity = dtime;
	END IF;  

SELECT validity_sub(dtime);
END//

CALL validity_update(1);

SHOW FUNCTION STATUS;
SHOW PROCEDURE STATUS;





