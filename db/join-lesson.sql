-- Создание таблицы departments и заполнение ее начальными данными
CREATE TABLE departments (
                             id INT PRIMARY KEY,
                             name VARCHAR(50)
);

INSERT INTO departments (id, name) VALUES
                                       (1, 'Отдел разработки'),
                                       (2, 'Отдел маркетинга'),
                                       (3, 'Отдел продаж');

-- Создание таблицы employees и заполнение ее начальными данными
CREATE TABLE employees (
                           id INT PRIMARY KEY,
                           name VARCHAR(50),
                           department_id INT,
                           FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO employees (id, name, department_id) VALUES
                                                    (1, 'Иван', 1),
                                                    (2, 'Мария', 2),
                                                    (3, 'Петр', 1),
                                                    (4, 'Анна', 3);

-- Запросы с различными типами соединений
SELECT * FROM departments
                  LEFT JOIN employees ON departments.id = employees.department_id;

SELECT * FROM departments
                  RIGHT JOIN employees ON departments.id = employees.department_id;

SELECT * FROM departments
                  FULL JOIN employees ON departments.id = employees.department_id;

-- Департаменты без работников
SELECT departments.name
FROM departments
         LEFT JOIN employees ON departments.id = employees.department_id
WHERE employees.id IS NULL;

-- Запросы с left и right join, дающие одинаковый результат
SELECT departments.name, employees.name
FROM departments
         LEFT JOIN employees ON departments.id = employees.department_id;

SELECT departments.name, employees.name
FROM employees
         RIGHT JOIN departments ON departments.id = employees.department_id;

-- Создание таблицы teens и заполнение ее
CREATE TABLE teens (
                       name VARCHAR(50),
                       gender VARCHAR(10)
);

INSERT INTO teens (name, gender) VALUES
                                     ('Вася', 'М'),
                                     ('Петя', 'М'),
                                     ('Маша', 'Ж'),
                                     ('Даша', 'Ж');

-- Поиск всех возможных разнополых пар без дублирования
SELECT t1.name, t2.name
FROM teens t1
         CROSS JOIN teens t2
WHERE t1.gender < t2.gender;