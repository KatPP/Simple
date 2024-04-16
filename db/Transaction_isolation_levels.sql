-- Создание произвольной таблицы
CREATE TABLE example_table (
                               id serial PRIMARY KEY,
                               name varchar(50),
                               value integer
);

-- Заполнение таблицы произвольными данными
INSERT INTO example_table (name, value) VALUES ('A', 100), ('B', 200), ('C', 300);

-- Эксперимент с разными уровнями изоляции транзакций
-- Уровень изоляции: READ COMMITTED
BEGIN;
-- Транзакция 1
SELECT * FROM example_table WHERE id = 1;
-- В новом окне выполнить транзакцию 2
-- Транзакция 2
UPDATE example_table SET value = 150 WHERE id = 1;
COMMIT;

-- Уровень изоляции: REPEATABLE READ
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Транзакция 1
SELECT * FROM example_table WHERE id = 2;
-- В новом окне выполнить транзакцию 2
-- Транзакция 2
UPDATE example_table SET value = 250 WHERE id = 2;
COMMIT;

-- Уровень изоляции: SERIALIZABLE
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Транзакция 1
SELECT * FROM example_table WHERE id = 3;
-- В новом окне выполнить транзакцию 2
-- Транзакция 2
SELECT * FROM example_table WHERE id = 3 FOR UPDATE;
COMMIT;