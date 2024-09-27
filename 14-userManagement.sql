create user "hello"@"localhost";
create user "world"@"%";
create user "akuntanpapassword"@"%";

drop user "hello"@"localhost";
drop user "world"@"%";
drop user "akuntanpapassword"@"%";

grant select on belajar_mysql.* to "hello"@"localhost";
grant select, insert, update, delete on belajar_mysql.* to "world"@"%";

show grants for "hello"@"localhost";
show grants for "world"@"%";

revoke select on belajar_mysql.* from "hello"@"localhost";
revoke select, insert, update, delete on belajar_mysql.* from "world"@"%";

set password for "hello"@"localhost" = "123456789";
set password for "world"@"%" = "123456789";

select User, Host from mysql.user;

rename table guestbook to guestbooks;
select * from guestbooks;