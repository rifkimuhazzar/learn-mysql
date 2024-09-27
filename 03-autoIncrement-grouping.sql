create table admin (
	id int not null auto_increment,
    first_name varchar (100),
    last_name varchar (100),
    primary key (id)
);

show tables;
show table status;
desc admin;

alter table admin
	modify first_name varchar (100) not null,
    modify last_name varchar (100) not null;
    
insert into admin (first_name, last_name)
	values	("Hello", "World"),
			("Hello", "Express"),
            ("Hello", "MySQL");

select * from admin;
select * from admin order by id desc;

delete from admin where id = 3;

insert into admin (first_name, last_name)
	values	("Hello", "React");

select last_insert_id();

select id, lower(name) as "Name Lower", upper(name) as "Name Upper", length(name) as "Name Length" from products;

select id, created_at, extract(year from created_at) as Year, extract(month from created_at) as Month from products;
select id, created_at, year(created_at) as Year, month(created_at) as Month from products;

select id, category,
	case category
		when "makanan" then "Enak"
        when "Minuman" then "Segar"
        else "Apa itu?"
		end as Category
from products;

select id, price,
	if(price <= 15000, "Murah", if(price <= 20000, "Mahal", "Mahal Banget")) as "Apakah Mahal?"
from products;

select id, name , description, ifnull(description, "Tidak ada description") from products;
select id, name , description, nullif(description, "Mie Ayam Original + Bakso") from products;

select count(id) as "Total Product" from products;
select count(name) from products;
select max(price) as "Harga Termahal", min(price) as "Harga Termurah", avg(price)  as "Harga Rata-Rata" from products;
select sum(quantity) as "Total Stock" from products;

select category, count(id) as "Total Product" from products group by category;
select max(price) as "Harga Termahal", category from products group by category;
select min(price) as "Harga Termurah", category from products group by category;
select avg(price)  as "Harga Rata-Rata" , category from products group by category;
select sum(quantity) as "Total Stock" , category from products group by category;

select category, count(id) as "Total" from products group by category having total > 5;
select category, count(id) as total from products group by category having total > 5;