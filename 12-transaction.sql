select * from guestbook;

start transaction;
insert into guestbook (email, title, content)
	values 	("contoh@gmail.com", "Contoh", "Contoh"),
			("contoh2@gmail.com", "Contoh", "Contoh"),
            ("contoh3@gmail.com", "Contoh", "Contoh");
commit;

start transaction;
delete from guestbook;
rollback;

insert into guestbook (email, title, content)
	values 	("ex@gmail.com", "Ex", "Ex"),
			("ex2@gmail.com", "Ex", "Ex");
start transaction;
commit;