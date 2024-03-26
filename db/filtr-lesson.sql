CREATE TABLE product (
                         id INT PRIMARY KEY,
                         name VARCHAR(50),
                         type_id INT,
                         expired_date DATE,
                         price DECIMAL(10, 2)
);

CREATE TABLE type (
                      id INT PRIMARY KEY,
                      name VARCHAR(50)
);

INSERT INTO type (id, name) VALUES
                                (1, 'СЫР'),
                                (2, 'МОЛОКО'),
                                (3, 'МОРОЖЕНОЕ');

INSERT INTO product (id, name, type_id, expired_date, price) VALUES
                                                                 (1, 'Сыр Чеддер', 1, '2024-05-01', 5.99),
                                                                 (2, 'Моцарелла', 1, '2023-06-15', 4.50),
                                                                 (3, 'Молоко 2.5%', 2, '2023-04-30', 2.20),
                                                                 (4, 'Мороженое ванильное', 3, '2023-07-20', 3.99),
                                                                 (5, 'Сливочное мороженое', 3, '2023-08-10', 4.75),
                                                                 (6, 'Сыр Гауда', 1, '2022-12-31', 6.80),
                                                                 (7, 'Молоко 3.2%', 2, '2023-05-15', 2.50),
                                                                 (8, 'Мороженое шоколадное', 3, '2023-09-05', 4.25),
                                                                 (9, 'Сыр Рокфор', 1, '2023-03-10', 7.30),
                                                                 (10, 'Молоко 1.5%', 2, '2023-06-30', 1.80);

-- Запросы

-- 1. Получение всех продуктов с типом "СЫР":
SELECT * FROM product WHERE type_id = (SELECT id FROM type WHERE name = 'СЫР');

-- 2. Получение всех продуктов, у которых в имени есть слово "мороженое":
SELECT * FROM product WHERE name LIKE '%мороженое%';

-- 3. Вывод всех продуктов, срок годности которых уже истек:
SELECT * FROM product WHERE expired_date < CURRENT_DATE;

-- 4. Вывод самого дорогого продукта:
SELECT * FROM product WHERE price = (SELECT MAX(price) FROM product);

-- 5. Вывод количества продуктов для каждого типа:
SELECT t.name AS имя_типа, COUNT(p.id) AS количество
FROM type t
LEFT JOIN product p ON t.id = p.type_id
GROUP BY t.name;

-- 6. Получение всех продуктов с типом "СЫР" и "МОЛОКО":
SELECT * FROM product WHERE type_id IN (SELECT id FROM type WHERE name IN ('СЫР', 'МОЛОКО'));

-- 7. Вывод типа продуктов, у которых осталось менее 10 штук:
SELECT t.name
FROM type t
JOIN product p ON t.id = p.type_id
GROUP BY t.name
HAVING COUNT(p.id) < 10;

-- 8. Вывод всех продуктов и их типов:
SELECT p.name AS продукт, t.name AS тип
FROM product p
JOIN type t ON p.type_id = t.id;
