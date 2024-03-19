create table fauna
(
    id             serial primary key,
    name           text,
    avg_age        int,
    discovery_date date
);

insert into fauna (name, avg_age, discovery_date) values ('Goldfish', 3000, '2020-01-01');
insert into fauna (name, avg_age, discovery_date) values ('Bluefish', 11000, '1999-05-10');
insert into fauna (name, avg_age, discovery_date) values ('Bear', 7000, null);
insert into fauna (name, avg_age, discovery_date) values ('Rabbit', 35000, '1940-11-20');

select * from fauna where name like '%fish%';

select * from fauna where avg_age between 10000 and 21000;

select * from fauna where discovery_date is null;

select * from fauna where discovery_date < '1950-01-01';