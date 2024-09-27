create table categories (
	id varchar(10) not null,
    name varchar(100) not null,
    primary key(id)
) engine = innodb;

desc categories;
show index from categories;
select * from categories;
drop table categories;

desc products;
select * from products;
alter table  products drop category;

alter table  products 
	add id_category varchar(10);
    
alter table  products 
	add constraint fk_products_categories foreign key (id_category) references categories (id);
    
show create table products;
insert into categories(id, name)
	values	("C0001", "Makanan"),
			("C0002", "Minuman"),
			("C0003", "Lain-Lain");

update products
	set id_category = "C0001" where id in ("P0001", "P0003", "P0004", "P0005", "P0006", "P0007", "P0008", "P0009");
update products
	set id_category = "C0002" where id in ("P0010", "P0011", "P0012", "P0014");
update products
	set id_category = "C0003" where id in ("P0013", "P0015");
    
select products.id, products.name, categories.name
	from categories join products on (products.id_category = categories.id);