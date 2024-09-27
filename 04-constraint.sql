create table customers (
	id int auto_increment not null,
    email varchar(100) not null,
    first_name varchar(100) not null,
    last_name varchar(100),
    unique key email_unique (email),
    primary key (id)
);

show tables;
desc customers;
drop table customers;
show create table customers;
show index from customers;

alter table customers drop constraint test;
update customers set last_name = "World 3" where id = 26;

alter table customers drop constraint email_unique;

alter table customers add constraint unique email_unique (email);

insert into customers (email, first_name, last_name)
	values ("hello@gmail.com", "Hello", "World");
    
select * from customers;

insert into customers (email, first_name, last_name)
	values 	("hello1@gmail.com", "Hello", "World"),
			("hello1@gmail.com", "Hello", "World");

delete from customers where email = "hello1@gmail.com";

insert into customers (email, first_name, last_name)
	values ("world@gmail.com", "Hello", "World");
    
insert into customers (email, first_name, last_name)
	values ("world2@gmail.com", "Hello", "World");

select * from products;
insert into products (id, name, category, price, quantity)
	values	("P0016", "Permen", "Lain-lain", 500, 200);
    
alter table products add constraint price_check check (price >= 1000);
update products set price = 1000 where id = "P0016";
desc products;
show table status;
show index from products;
show create table products;

insert into products (id, name, category, price, quantity)
	values	("P0017", "Keripik", "Lain-lain", 2000, 240);
    
update products set price = 1500 where id = "P0017";
show create table products;

show create table customers;

create table test (
	id int not null auto_increment,
    name varchar(100) not null,
    primary key (id),
    constraint name_unique unique (name)
);
desc test;
show index from test;
drop table test;

show tables;

select * from products;
desc products;
show create table products;
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, ENFORCED
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE TABLE_SCHEMA = 'belajar_mysql' AND TABLE_NAME = 'products';
show index from products;

show tables;
