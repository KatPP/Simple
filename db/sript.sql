create table car(
                    id serial primary key,
                    name varchar(255),
                    age  int,
                    email varchar(100)
);

insert into car (id, name, age, email) VALUES (1, 'BMW', 30, 'bmw@example.com');

insert into car (id, name, age, email) VALUES (2, 'OPEL', 20, 'opel@example.com');

insert into car (id, name, age, email) VALUES (3, 'WW', 150, 'ww@example.com');

select * from car;

update car set age = 10 where id = 1;

select * from car;

delete from car where id = 3;

select * from car;