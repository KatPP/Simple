create table products
(
    id       serial primary key,
    name     varchar(50),
    producer varchar(50),
    count    integer default 0,
    price    integer
);

CREATE OR REPLACE FUNCTION calculate_tax()
    RETURNS TRIGGER AS $$
BEGIN
    NEW.price := NEW.price + (NEW.price * 0.1); -- Добавляем налог в размере 10%
    RETURN NEW;
END;
    $$ LANGUAGE plpgsql;

CREATE TRIGGER after_insert_tax_trigger
AFTER INSERT ON products
FOR EACH STATEMENT
EXECUTE FUNCTION calculate_tax();

CREATE OR REPLACE FUNCTION calculate_tax_row()
RETURNS TRIGGER AS $$
BEGIN
NEW.price := NEW.price + (NEW.price * 0.1); -- Добавляем налог в размере 10%
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_tax_trigger
    BEFORE INSERT ON products
    FOR EACH ROW
EXECUTE FUNCTION calculate_tax_row();