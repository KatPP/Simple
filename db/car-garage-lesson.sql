CREATE TABLE car_bodies (
                            id INT PRIMARY KEY,
                            name VARCHAR(50)
);

CREATE TABLE car_engines (
                             id INT PRIMARY KEY,
                             name VARCHAR(50)
);

CREATE TABLE car_transmissions (
                                   id INT PRIMARY KEY,
                                   name VARCHAR(50)
);

CREATE TABLE cars_garage (
                      id INT PRIMARY KEY,
                      name VARCHAR(50),
                      body_id INT,
                      engine_id INT,
                      transmission_id INT,
                      FOREIGN KEY (body_id) REFERENCES car_bodies(id),
                      FOREIGN KEY (engine_id) REFERENCES car_engines(id),
                      FOREIGN KEY (transmission_id) REFERENCES car_transmissions(id)
);

INSERT INTO car_bodies (id, name) VALUES (1, 'Седан');
INSERT INTO car_bodies (id, name) VALUES (2, 'Хэтчбек');
INSERT INTO car_bodies (id, name) VALUES (3, 'Внедорожник');
INSERT INTO car_bodies (id, name) VALUES (4, 'Универсал');

INSERT INTO car_engines (id, name) VALUES (1, 'Бензиновый');
INSERT INTO car_engines (id, name) VALUES (2, 'Дизельный');
INSERT INTO car_engines (id, name) VALUES (3, 'Электрический');
INSERT INTO car_engines (id, name) VALUES (4, 'Водородный');

INSERT INTO car_transmissions (id, name) VALUES (1, 'Механическая');
INSERT INTO car_transmissions (id, name) VALUES (2, 'Автоматическая');
INSERT INTO car_transmissions (id, name) VALUES (3, 'Вариатор');
INSERT INTO car_transmissions (id, name) VALUES (4, 'Червячная');
INSERT INTO car_transmissions (id, name) VALUES (5, 'Гибрид');


INSERT INTO cars_garage (id, name, body_id, engine_id, transmission_id) VALUES (1, 'Москвич', 1, 1, 1);
INSERT INTO cars_garage (id, name, body_id, engine_id, transmission_id) VALUES (2, 'Волга', 2, 2, 2);
INSERT INTO cars_garage (id, name, body_id, engine_id, transmission_id) VALUES (3, 'Жигули', 3, 3, 3);
INSERT INTO cars_garage (id, name, body_id, engine_id, transmission_id) VALUES (4, 'Камаз', NULL, NULL, 4);

-- Вывести список всех машин и все привязанные к ним детали, учитывая возможность отсутствия некоторых деталей
SELECT c.id, c.name AS car_name, cb.name AS body_name, ce.name AS engine_name, ct.name AS transmission_name
FROM cars_garage c
         LEFT JOIN car_bodies cb ON c.body_id = cb.id
         LEFT JOIN car_engines ce ON c.engine_id = ce.id
         LEFT JOIN car_transmissions ct ON c.transmission_id = ct.id;

--  Вывести кузова, которые не используются ни в одной машине
SELECT cb.name AS unused_body
FROM car_bodies cb
         LEFT JOIN cars_garage c ON cb.id = c.body_id
WHERE c.body_id IS NULL;

-- Вывести двигатели, которые не используются ни в одной машине
SELECT ce.name AS unused_engine
FROM car_engines ce
         LEFT JOIN cars_garage c ON ce.id = c.engine_id
WHERE c.engine_id IS NULL;

-- Вывести коробки передач, которые не используются ни в одной машине
SELECT ct.name AS unused_transmission
FROM car_transmissions ct
         LEFT JOIN cars_garage c ON ct.id = c.transmission_id
WHERE c.transmission_id IS NULL;