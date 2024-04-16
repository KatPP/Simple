create table products
(
    id       serial primary key,
    name     varchar(50),
    producer varchar(50),
    count    integer default 0,
    price    integer
);

-- Создание процедуры для удаления записей по идентификатору
CREATE OR REPLACE PROCEDURE delete_product_by_id(product_id INT)
AS $$
BEGIN
    DELETE FROM products WHERE id = product_id;
END;
    $$ LANGUAGE plpgsql;

-- Создание функции для удаления записей, если количество товара равно 0
CREATE OR REPLACE FUNCTION delete_product_if_count_zero()
RETURNS VOID AS $$
BEGIN
DELETE FROM products WHERE count = 0;
END;
$$ LANGUAGE plpgsql;

-- Создание функции для удаления записей, если цена товара меньше заданной
CREATE OR REPLACE FUNCTION delete_product_if_price_below(price_threshold INT)
    RETURNS VOID AS $$
BEGIN
    DELETE FROM products WHERE price < price_threshold;
END;
$$ LANGUAGE plpgsql;