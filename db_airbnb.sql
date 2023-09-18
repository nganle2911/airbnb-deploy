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
VALUES	('Casa Acqua Erbalunga', 2, 1, 1, 1, 'The dream for a stay for two! 800m from the village of Erbalunga, a quiet place, a magnificent sea and mountain view, just what it takes to spend pleasant moments. A mini private pool, heated to 30 degrees from November to May, a covered terrace sheltered from heat. An exotic atmosphere for a perfect relaxation! 90m2 designed for laziness! 
The loft and villa are never rented at the same time.', 215, true, false, true, false, true, true, true, false, 10), 
		('Coconut Garden Villa', 4, 1, 2, 1, 'Just 100 meters from the sea, Coconut Garden offers comfortable and intimate 70sqm duplex bungalows. The pool and the tropical garden make Coconut Garden a little haven of peace. On the ground floor, facing the garden and pool, a spacious and pleasant room awaits you. Guests can enjoy AC and a flat-screen TV with cable channels.', 21, true, true, true, true, true, true, true, true, 2), 
		('Le Nest Hotel', 2, 1, 1, 1, 'The Superior Room is in a monochrome blue and green. There are a couple of versions, but each is carefully decorated with selected elegant accessories and stylish colours to capture the essence of the surrounding area. Quality bedding, soft and harmonious colours, a marble bathroom that opens like a wardrobe, independent toilets, a television nestled in the fireplace, Baumann 1950 chairs, vintage mirror, are the assets of this superior room.', 173, false, false, true, false, true, true, true, false, 1); 

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