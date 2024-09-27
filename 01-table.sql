show engines;
show databases;
show tables;
drop table barang;
show table status from belajar_mysql where name = "barang" ;

create table barang (
	id int,
    nama varchar(100),
    harga int,
    jumlah int
);

desc barang;
show create table barang;

alter table barang
add column deskripsi text;

alter table barang
add column salah text;

alter table barang
drop column salah;

alter table barang
	modify nama varchar(255) after deskripsi;
    
alter table barang
	modify nama varchar(255) first;
    
alter table barang
	modify id int not null,
    modify nama varchar(255) not null;
    
alter table barang
	modify jumlah int not null default 0,
    modify harga int not null default 0;

alter table barang add Waktu_Dibuat timestamp not null default current_timestamp;

insert into barang (id, nama) values (1, "Apel");
select * from barang;
truncate barang;
show tables;
drop table barang;