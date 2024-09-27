desc products;
select * from products;

create table wishlist (
	id int not null auto_increment,
    id_product varchar(10) not null,
    description text,
    primary key (id),
    constraint fk_wishlist_product foreign key (id_product) references products (id)
);

desc wishlist;
drop table wishlist;
show index from wishlist;
show tables;
show create table wishlist;

alter table wishlist drop constraint fk_wishlist_product;
alter table wishlist add constraint fk_wishlist_product foreign key (id_product) references products (id);

insert into wishlist (id_product, description)
	values ("P0016", "Ini Deskripsi");
    
select * from wishlist;

delete from products where id = "P0001";
update products set id = "P0015" where id = "P0001";

alter table wishlist 
	add constraint fk_wishlist_product 
		foreign key (id_product) references products (id) on delete cascade on update cascade;

select * from wishlist join products on (wishlist.id_product = products.id);

select w.id as id_wishlist, p.id as id_product, p.name as name_product, w.description as wishlist_description from wishlist as w
	join products as p on (w.id_product = p.id);

describe customers;
select * from customers;
show create table customers;

alter table wishlist
	add column id_customer int;

alter table wishlist 
	add constraint fk_wishlist_customers foreign key (id_customer) references customers(id);
    
select * from wishlist;
truncate wishlist;

select * from wishlist;
select * from products;
select * from customers;
insert into wishlist (id_product, id_customer, description)
	values	("P0002", 1, "This is description");

update products set id = "P0001" where id = "P0002";

select customers.email as customer_email, products.id as product_id, products.name as product_name, wishlist.description as wishlist_description
	from wishlist
		join products on products.id = wishlist.id_product
        join customers on (wishlist.id_customer = customers.id);
