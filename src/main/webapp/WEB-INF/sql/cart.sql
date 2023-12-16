use shop;

create table cart(
	no    int not null auto_increment primary key,
    cno   int not null,
    qty   int not null,
    size  int null default 0,
    pname varchar(70) not null,
    id    varchar(50) not null
);

select * from cart;