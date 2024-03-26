-- Создание таблиц
create table devices
(
    id    serial primary key,
    name  varchar(255),
    price float
);

create table people
(
    id   serial primary key,
    name varchar(255)
);

create table devices_people
(
    id        serial primary key,
    device_id int references devices (id),
    people_id int references people (id)
);

-- Заполнение таблиц данными
insert into devices (name, price) values ('Phone', 50000), ('Laptop', 120000), ('PC', 40000);
insert into people (name) values ('Anna'), ('Maksim'), ('Olga');
insert into devices_people (device_id, people_id) values (1, 1), (2, 2), (3, 3), (1, 2), (2, 3);

-- Вывод средней цены устройств
select avg(price) as average_price from devices;

-- Вывод средней цены устройств для каждого человека
select p.name, avg(d.price) as average_price
from devices_people dp
         join devices d on dp.device_id = d.id
         join people p on dp.people_id = p.id
group by p.name;

-- Вывод средней цены устройств для каждого человека, с условием средней цены больше 5000
select p.name, avg(d.price) as average_price
from devices_people dp
         join devices d on dp.device_id = d.id
         join people p on dp.people_id = p.id
group by p.name
having avg(d.price) > 5000;