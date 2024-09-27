create table wallet (
	id int not null auto_increment,
    id_customer int not null,
    balance int not null default 0,
    primary key (id),
    unique key id_customer_unique (id_customer),
    foreign key fk_wallet_customer (id_customer) references customers (id)
) engine = innodb;

desc customers;

show create table wallet;
show index from wallet;
drop table wallet;
desc wallet;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, ENFORCED
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE TABLE_SCHEMA = 'belajar_mysql' AND TABLE_NAME = 'wallet';

select * from customers;
update customers set email = "node@gmail.com", first_name = "Node", last_name = "Express"
	where id = 26;
update customers set email = "vite@gmail.com", first_name = "Vite", last_name = "Vitest"
	where id = 28;


insert into wallet (id_customer) 
	values (1), (26), (28);
 
select * from wallet;
select customers.email, wallet.balance from wallet
		join customers on wallet.id_customer = customers.id;

show tables;