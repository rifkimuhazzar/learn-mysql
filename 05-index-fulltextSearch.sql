create table sellers (
	id int not null auto_increment,
    name1 varchar(100) not null,
    name2 varchar(100),
    name3 varchar(100),
    email varchar(100) not null,
    primary key (id),
    unique key email_unique (email),
    index name1_index (name1),
    index name2_index (name2),
    index name3_index (name3),
    index name1_name2_name3_index (name1,name2,name3)
);

desc sellers;
drop table sellers;
show index from sellers;
show create table sellers;

alter table sellers
	drop index name1_index;


alter table products
	add fulltext product_fulltext (name, description);

show index from products;
show create table products;

select * from products;
select * from products where name like "%ayam%" or description like "%ayam%";
select * from products where match(name, description) against ("bakso" in natural language mode);
select * from products where match(name, description) against ("+ayam -nasi" in boolean mode);
select * from products where match(name, description) against ("bakso" with query expansion);

select * from sellers;
desc sellers;
show create table sellers;
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, ENFORCED
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE TABLE_SCHEMA = 'belajar_mysql' AND TABLE_NAME = 'sellers';
show index from sellers;
