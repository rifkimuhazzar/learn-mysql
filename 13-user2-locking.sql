-- ini untuk mysql dengan koneksi/client berbeda

start transaction;
select * from guestbook;

update guestbook
	set title = "Diubah uleh user 2" where id = 11;
commit;

start transaction;
select * from products;

select * from products where id = "P0001" for update;

update products
	set quantity = quantity - 10 where id = "P0001";
commit;


-- DEADLOCK
start transaction;
select * from products where id = "p0003" for update;
  
select * from products where id = "p0001" for update;
  
  
-- LOCK TABLE READ
select * from products;

update products set quantity = 100 where id = "p0001";
insert into products (id, name, price, quantity, id_category)
	values 	("P0002", "Nasi Padang Ayam Bakar", 18000, 100,"C0001");
    
    
-- LOCK TABLE WRITE
select * from products;
update products set quantity = 100 where id = "p0001";


-- LOCK INSTANCE
alter table products add column sample varchar (100);