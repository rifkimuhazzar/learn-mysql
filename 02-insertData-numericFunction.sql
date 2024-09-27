create table products (
	id varchar(10) not null,
    name varchar(100) not null,
    description text,
	price int unsigned not null,
    quantity int unsigned not null default 0,
    Created_At timestamp default current_timestamp
);

alter table products modify Created_At timestamp not null default current_timestamp;
delete from products where name = 'test';

show tables;
desc products;
truncate products;

insert into products(name, id, price, quantity)
values("Mie Ayam Original", "P0001", 15000, 100);

select * from products;

insert into products(id, name, description, price, quantity)
values("P0002", "Mie Ayam Bakso", "Mie Ayam Original + Bakso", 20000, 100);

insert into products(id, name, description, price, quantity, created_at)
values("P0002", "test", "test", 20000, 100, null);

insert into products (id, name, price, quantity)
values 	("P0003", "Mie Ayam Ceker", 20000, 100),
		("P0004", "Mie Ayam Special", 25000, 100),
		("P0005", "Mie Ayam Yamin", 15000, 100);
        
insert into products (id, name, price, quantity)
values 	("P0006", "Nasi + Ayam Goreng", 18000, 150),
		("P0007", "Nasi + Ayam Bakar", 21000, 80),
		("P0008", "Bakso Original", 15000, 100),
		("P0009", "Bakso Medium", 25000, 80),
		("P0010", "Bakso Super", 30000, 50);
        
select * from products;
select name from products;
select name, quantity, price from products;

alter table products add primary key (id);

delete from products where id = 'p0001';
truncate products;
show create table products;

select * from products where quantity = 100;
select * from products where price = 15000;
select * from products where id = "p0005";
select * from products where name = "Mie Ayam Bakso";

desc products;
alter table products add category enum ("Makanan", "Minuman", "Lain-lain") after name;
select * from products;
select * from products where id = "p0001";

Update products
	set category = "makanan"
    where id = "p0001";
    
Update products
	set category = "Makanan",
		description = "Mie Ayam Original + Ceker"
    where id = "P0003";
    
Update products
	set price = price + 5000
    where id = "P0005";

Update products
	set category = "Makanan";
    
delete from products where id = "P0010";
delete from products;

select 	id as Kode, 
		name as Nama, 
		description as Deskripsi, 
        price as Harga, 
        quantity as 'Jumlah Tersedia', 
        created_at as 'Dibuat Pada' 
from products;
        
select 	id as Kode, 
		name as Nama, 
		description as Deskripsi, 
        p.price as Harga, 
        p.quantity as 'Jumlah Tersedia', 
        p.created_at as 'Dibuat Pada' 
from products as p;

insert into products (id, name, category, quantity, price)
	values	("P0010", "Es Jeruk", "Minuman", 150, 10000),
			("P0011", "Es Campur", "Minuman", 100, 15000),
            ("P0012", "Es Teah", "Minuman", 200, 5000),
            ("P0013", "Kerupuk", "Lain-lain", 250, 2000),
            ("P0014", "Es Cream", "Lain-lain", 150, 10000),
            ("P0015", "Mie Ayam Jamur", "Makanan", 80, 20000);
            
select * from products where quantity > 100;
select name from products where quantity > 100;
select * from products where quantity >= 100;

select * from products where category != "Makanan";
select * from products where category <> "Makanan";

select *  from products where quantity >= 100 and price >= 20000;
select *  from products where category= "makanan" and price < 20000;

select * from products where quantity > 100 or price > 20000;

select * from products where category = "Makanan" or quantity > 100 and price >= 20000;
select * from products where (category = "Makanan" or quantity > 100) and price >= 20000;

select * from products where name like "%Mie%";
select * from products where name like "%spe%";
select * from products where name not like "%Ayam%";

select * from products where description is null;
select * from products where description is not null;

select * from products where price >= 15000 and price <= 20000;
select * from products where price between 15000 and 20000;
select * from products where price not between 15000 and 20000;

select * from products where category = "Makanan" or category = "Minuman";
select * from products where category in ("Makanan", "Minuman");
select * from products where category not in ("Makanan", "Minuman");
select * from products where price in (10000, 15000);
select * from products where price not in (10000, 15000);

select * from products;
select * from products order by category;
select id, category, name from products order by category;
select id, category, price from products order by category asc, price desc;

select * from products limit 5;
select * from products order by id limit 5;

select * from products limit 0, 5;
select * from products order by id limit 5, 5;
select * from products limit 10, 5;

select distinct category from products;

select 20, 20, 20 * 20 as hasil;

select id, name, price, price  div 1000 as 'Price in K' from products;
select id, cos(price), sin(price), tan(price) from products;
select pi();
select id, name, price, price div 1000 from products where price div 1000 > 15;