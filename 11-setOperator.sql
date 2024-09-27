create table guestbook (
	id int not null auto_increment,
    email varchar(100),
    title varchar(100),
    content text,
    primary key (id)
) engine = innodb;

desc guestbook;
select * from customers;

insert into guestbook (email, title, content) 
	values	("guest@gmail.com", "Hello", "Hello"),
			("guest2@gmail.com", "Hello", "Hello"),
			("guest3@gmail.com", "Hello", "Hello"),
            ("hello@gmail.com", "Hello", "Hello"),
            ("hello@gmail.com", "Hello", "Hello"),
            ("hello@gmail.com", "Hello", "Hello");

select * from guestbook;

select distinct email from customers;
select distinct email from guestbook;

select distinct email from customers
union
select distinct email from guestbook;

select distinct email from customers
union all
select distinct email from guestbook;

select e.email, count(e.email) as email_counts
	from 	(select email from customers
			union all
            select email from guestbook) as e
            group by e.email;

select email from customers
	where email in (select distinct email from guestbook);

select distinct customers.email from customers
	inner join guestbook on (customers.email = guestbook.email);

select distinct customers.email, guestbook.email from customers
	left join guestbook on (customers.email = guestbook.email)
	where guestbook.email is null;