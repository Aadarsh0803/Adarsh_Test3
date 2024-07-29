create database Test
use Test
create table subjects
(
subjectId int,
subtitle varchar(20),
);
select * from subjects

create table Book
(
bookId int,
title varchar(20),
price int,
volume int,
author varchar(20),
publishDate DateTime,
subjectId int,
);
select * from Book

--Q1. Inserting 5 subjects in subject table
insert into subjects( subjectId, subtitle)
values
(1,'English'),(2,'Maths'),(3,'Science'),
(4,'History'),(5,'Space');

--q2. 
insert into Book (bookId,title,price,volume,author,publishDate,subjectId)
values
(1,'aa',100,1,'a','1990-07-12',1),
(2,'bb',200,2,'b','2000-08-12',2),
(3,'cc',300,3,'c','2010-07-12',3),
(4,'dd',400,1,'d','1970-03-12',4),
(5,'ee',500,3,'e','1950-05-12',5),
(6,'ff',600,1,'f','1900-02-12',2),
(7,'gg',700,4,'g','1995-01-12',1),
(8,'hh',800,6,'h','1998-12-4',4),
(9,'ii',900,1,'i','1940-06-12',2),
(10,'jj',150,3,'j','1955-08-12',4),
(11,'kk',250,2,'k','1977-06-12',5),
(12,'ll',350,1,'l','1976-09-12',1),
(13,'mm',450,5,'m','1932-11-12',2),
(14,'nn',550,1,'n','1965-4-12',5),
(15,'oo',150,2,'o','1954-6-12',4);

--q3
select b.title,s.subtitle  from book b inner join subjects s on b.subjectId=s.subjectId

--q4
select title,publishDate from book where publishDate in('1976-09-12','2010-07-12');

--q5
select author, count(bookId) as book_count from  book group by author;

--q6
select s.subtitle, count(b.bookId) as book_count from book b inner join subjects s on b.subjectId = s.subjectId
group by s.subtitle;


--q7
select count(bookId) as bookcount from book where YEAR(publishDate)=2000;

--q8
update book set price = 550 , volume = 3 where bookId=1
select * from book

--q9
update book set price = price *1.1 where subjectId = (select subjectId from subjects where subtitle = 'english')
select * from book

--q10
delete from book where bookId=1;

--q11
select * from book b inner join subjects s on b.subjectId = s.subjectId where b.price > 500 AND s.subtitle = 'Maths';
--q12
select * from book b join subjects s on b.subjectId=s.subjectId order by s.subtitle

--q13
select title,price from book where price = (select min(price) from book);

--q14
select title,price from book where price = (select min(price) from book);
--q15
select count(*) from book b join subjects s on s.subjectId = b.subjectId where s.subtitle = 'Maths';

--q16
select b.title, s.subtitle from book b inner join subjects s on b.subjectId = s.subjectId
where s.subtitle in ('English', 'Maths', 'Science');
