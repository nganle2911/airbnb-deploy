DROP DATABASE IF EXISTS db_airbnb;
CREATE DATABASE db_airbnb;
USE db_airbnb;

CREATE TABLE users(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	email VARCHAR(250),
	pass_word VARCHAR(100),
	full_name VARCHAR(250),
	birth_day VARCHAR(250),
	gender BOOLEAN,
	user_role VARCHAR(150),
	phone VARCHAR(250),
	avatar VARCHAR(250)
);

CREATE TABLE location(
	location_id INT PRIMARY KEY AUTO_INCREMENT,
	location_name VARCHAR(250),
	province VARCHAR(250),
	nation VARCHAR(150),
	location_image VARCHAR(150)
);

INSERT INTO location (location_name, province, nation, location_image)
VALUES 	('Paris', 'Ile-de-France', 'France'),
		('Phan Thiet', 'Binh Thuan', 'Vietnam'),
		('Nha Trang', 'Khanh Hoa', 'Vietnam'),
		('Nakano City', 'Tokyo', 'Japan'),
		('Long Xuyen', 'An Giang', 'Vietnam'),
		('Nice', 'Provence-Alpes-Cote Azur', 'France'),
		('Peshastin', 'Washington', 'United States'),
		('County Wicklow', 'Ireland', 'Ireland'),
		('Colares', 'Lisboa', 'Portugal'),
		('Brando', 'Corse', 'France');

CREATE TABLE rooms(
	room_id INT PRIMARY KEY AUTO_INCREMENT,
	room_name VARCHAR(250),
	client_number INT,
	bed_room INT,
	bed INT,
	bath_room INT,
	description VARCHAR(500),
	price INT,
	washing_machine BOOLEAN,
	iron BOOLEAN,
	tivi BOOLEAN,
	air_conditioner BOOLEAN,
	wifi BOOLEAN,
	kitchen BOOLEAN,
	parking BOOLEAN,
	pool BOOLEAN,
	location_id INT,
	FOREIGN KEY (location_id) REFERENCES location(location_id),
	image VARCHAR(250)
);

INSERT INTO rooms (room_name, client_number, bed_room, bed, bath_room, description, price, washing_machine, iron, tivi, air_conditioner, wifi, kitchen, parking, pool, location_id)
VALUES	('Casa Acqua Erbalunga', 2, 1, 1, 1, 'The dream for a stay for two!', 215, true, false, true, false, true, true, true, false, 10), 
		('Coconut Garden Villa', 4, 1, 2, 1, 'Just 100 meters from the sea, Coconut Garden offers comfortable and intimate 70sqm duplex bungalows.', 21, true, true, true, true, true, true, true, true, 2), 
		('Le Nest Hotel', 2, 1, 1, 1, 'The Superior Room is in a monochrome blue and green.', 173, false, false, true, false, true, true, true, false, 1); 

CREATE TABLE reservations(
	reservation_id INT PRIMARY KEY AUTO_INCREMENT,
	room_id INT,
	FOREIGN KEY (room_id) REFERENCES rooms(room_id),
	start_date DATETIME,
	end_date DATETIME,
	guest_amount INT,
	user_id INT,
	FOREIGN KEY (user_id) REFERENCES users(user_id)
);	

CREATE TABLE reviews(
	review_id INT PRIMARY KEY AUTO_INCREMENT,
	room_id INT,
	FOREIGN KEY (room_id) REFERENCES rooms(room_id),
	user_id INT,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	review_date DATETIME,
	content VARCHAR(500),
	rating INT
);