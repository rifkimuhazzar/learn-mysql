select * from products;
select * from categories;

insert into categories (id, name) values ("C0004", "Laptop"), ("C0005", "Smartphone");

insert into products (id, name, price, quantity)
	values	("X0001", "X Satu", 25000, 100),
			("X0002", "X Dua", 15000, 200),
			("X0003", "X Tiga", 10000, 300);

select * from categories
	join products on (products.id_category = categories.id);
select * from categories
	inner join products on (products.id_category = categories.id);
    
select * from categories
	left join products on (products.id_category = categories.id);
select * from products
	left join categories on (products.id_category = categories.id);
    
select * from categories
	right join products on (products.id_category = categories.id);
select * from products
	right join categories on (products.id_category = categories.id);
    
select * from categories
	cross join products;
select * from products
	cross join categories;
    
select * from categories
	join products;
select * from products
	join categories;
    
select * from categories, products;
    
create table numbers (
	id int not null,
    primary key (id)
);

insert into numbers (id) values (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

select * from numbers;

select numbers1.id as 'numbers1.id', numbers2.id as 'numbers2.id', numbers1.id * numbers2.id as results 
	from numbers as numbers1 
		cross join numbers as numbers2 order by numbers1.id, numbers2.id;

-- SUBQUERIES
select avg(price) from products;
select * from products where price > 15117.6471;
select * from products where price > (select avg(price) from products);

select max(price) from products;
select * from products;
update products set price = 50000 where id = "X0003";

select max(cp.price) from (select price from categories
	join products on (products.id_category = categories.id)) as cp;
    
select name from products
union
select name from categories;