start transaction;
select * from guestbook;

update guestbook
	set title = "Diubah oleh user 1" where id = 11;
commit;

start transaction;
select * from products;

select * from products where id = "P0001" for update;

update products
	set quantity = quantity - 70 where id = "P0001";
commit;


-- DEADLOCK
start transaction;
select * from products where id = "P0001" for update;
 
select * from products where id = "p0003" for update;


-- LOCK TABLE READ
lock tables products read;

update products set quantity = 100 where id = "p0001";
insert into products (id, name, price, quantity)
	values 	("P0002", "Nasi Padang Ayam Bakar", 18000, 100);
    
unlock tables;


-- LOCK TABLE WRITE
lock tables products write;

update products set quantity = 200 where id = "p0001";

select * from products;


-- LOCK INSTANCE
lock instance for backup;
unlock instance;