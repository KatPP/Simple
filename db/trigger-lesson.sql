-- Триггер 1 (Уровень оператора)
CREATE OR REPLACE FUNCTION calculate_tax_statement()
    RETURNS TRIGGER AS $$
BEGIN
    UPDATE products
    SET price = price * 1.1; -- Добавление 10% налога
    RETURN NEW;
END;
    $$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_statement_tax
AFTER INSERT ON products
FOR EACH STATEMENT
EXECUTE FUNCTION calculate_tax_statement();

-- Триггер 2 (Уровень строки)
CREATE OR REPLACE FUNCTION calculate_tax_row()
RETURNS TRIGGER AS $$
BEGIN
NEW.price = NEW.price * 1.1; -- Добавление 10% налога
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_row_tax
    BEFORE INSERT ON products
    FOR EACH ROW
EXECUTE FUNCTION calculate_tax_row();

-- Создание таблицы history_of_price
CREATE TABLE history_of_price
(
    id    serial PRIMARY KEY,
    name  varchar(50),
    price integer,
    date  timestamp
);

-- Триггер для вставки в таблицу history_of_price
CREATE OR REPLACE FUNCTION insert_history_of_price()
    RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO history_of_price (name, price, date)
    VALUES (NEW.name, NEW.price, CURRENT_TIMESTAMP);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_insert_history
AFTER INSERT ON products
FOR EACH ROW
EXECUTE FUNCTION insert_history_of_price();