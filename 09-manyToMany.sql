create table orders (
	id int not null auto_increment,
    total int not null,
    order_date datetime not null default current_timestamp,
    primary key (id)
) engine = innodb;

desc orders;

create table orders_detail (
	id_product varchar(10) not null,
    id_order int not null,
    quantity int unsigned not null,
    price int not null,
    primary key (id_product, id_order)
) engine = innodb;

desc orders_detail;

show index from orders_detail;
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, ENFORCED
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE TABLE_SCHEMA = 'belajar_mysql' AND TABLE_NAME = 'orders_detail';
    
alter table orders_detail
	add constraint fk_orders_detail_products foreign key (id_product) references products (id),
    add constraint fk_orders_detail_orders foreign key (id_order) references orders (id);

show create table orders_detail;
CREATE TABLE `orders_detail` (
   `id_product` varchar(10) NOT NULL,
   `id_order` int NOT NULL,
   `quantity` int unsigned NOT NULL,
   `price` int NOT NULL,
   PRIMARY KEY (`id_product`,`id_order`),
   KEY `fk_orders_detail_orders` (`id_order`),
   CONSTRAINT `fk_orders_detail_orders` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`),
   CONSTRAINT `fk_orders_detail_products` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * from orders;
insert into orders (total) values (50000);

insert into orders_detail (id_product, id_order, price, quantity) 
	values 	("P0001", 1, 50000, 1),
			("P0003", 1, 50000, 1);

insert into orders_detail (id_product, id_order, price, quantity) 
	values 	("P0004", 2, 50000, 1),
			("P0005", 2, 50000, 1);

insert into orders_detail (id_product, id_order, price, quantity) 
	values 	("P0001", 3, 25000, 1),
			("P0004", 3, 25000, 1);
            
select * from orders_detail;
select id_order, id_product, price, quantity from orders_detail;
truncate orders_detail;

alter table orders_detail modify column id_order int not null after id_product;

select * from orders;

select * from orders 
	join orders_detail on (orders_detail.id_order = orders.id)
    join products on (orders_detail.id_product = products.id);
    
select orders.id, products.id, products.name, orders_detail.quantity, orders_detail.price from orders 
	join orders_detail on (orders.id = orders_detail.id_order)
    join products on (products.id = orders_detail.id_product);