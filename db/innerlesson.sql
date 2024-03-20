-- Создание таблицы "Пользователи"
CREATE TABLE Users (
                       user_id INT PRIMARY KEY,
                       name VARCHAR(50),
                       age INT
);

-- Создание таблицы "Заказы"
CREATE TABLE Orders (
                        order_id INT PRIMARY KEY,
                        user_id INT,
                        product VARCHAR(50),
                        quantity INT,
                        FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Добавление данных в таблицу "Пользователи"
INSERT INTO Users (user_id, name, age) VALUES
                                           (1, 'John', 25),
                                           (2, 'Alice', 35),
                                           (3, 'Bob', 40);

-- Добавление данных в таблицу "Заказы"
INSERT INTO Orders (order_id, user_id, product, quantity) VALUES
                                                              (101, 1, 'Milk', 2),
                                                              (102, 2, 'Bread', 3),
                                                              (103, 3, 'Eggs', 1),
                                                              (104, 1, 'Juice', 1);

-- Запрос 1: Выбрать имена пользователей и их заказы
SELECT u.name, o.product
FROM Users u
         INNER JOIN Orders o ON u.user_id = o.user_id;

-- Запрос 2: Выбрать имена пользователей, их возраст и наименования продуктов
SELECT u.name, u.age, o.product
FROM Users u
         INNER JOIN Orders o ON u.user_id = o.user_id;

-- Запрос 3: Выбрать общее количество заказов и наименования продуктов, сделанных пользователями старше 30 лет
SELECT COUNT(o.order_id) AS total_orders, o.product
FROM Users u
         INNER JOIN Orders o ON u.user_id = o.user_id
WHERE u.age > 30
GROUP BY o.product;