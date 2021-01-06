drop table if exists mentors cascade;
drop table if exists students cascade;
drop table if exists topics cascade;
drop table if exists classes cascade;
drop table if exists attendance cascade;

create table mentors (
	id serial primary key,
	name varchar(30) not null,
	years_living_in_glasgow int default 0 not null,
	address varchar(50) not null,
	fav_programming_language varchar(10)
);

insert into mentors(name, address) values('Vincent', 'xyz');
insert into mentors(name, address,fav_programming_language) values('carlos', 'abc', 'JavaScript');
insert into mentors(name, address,fav_programming_language,years_living_in_glasgow) values('Alexandra', 'xyz', 'Java', 5);
insert into mentors(name, address,fav_programming_language,years_living_in_glasgow) values('hennerite', 'somewhere', 'python', 20);
insert into mentors(name, address,fav_programming_language) values('lender', 'some where', 'kotlin');

select * from mentors;

create table students (
	id serial primary key,
	name varchar(30),
	address varchar(50),
	graduation_date date
);

insert into students (name, address) values('Ramin', 'Iran');
insert into students (name, address, graduation_date) values('Ali Ashraf', 'Pakistan', Now());
insert into students (name, address, graduation_date) values('Aleksey', 'Russia', Now());
insert into students (name, address, graduation_date) values('Anudeep', 'India', Now());
insert into students (name, address) values('thony', 'Vanuzuela');
insert into students (name, address, graduation_date) values('Diana', 'Ukrain', Now());
insert into students (name, address) values('Bipasha aka Bips', 'Bangladesh');
insert into students (name, address) values('Jaime', 'Latin American');
insert into students (name, address, graduation_date) values('Noor', 'syria', Now());
insert into students (name, address, graduation_date) values('Heneritte', 'Holand', Now());

select * from students;

create table topics (
	id serial primary key,
	name varchar(30) not null
);
 
insert into topics (name) values ('JavaScript'), ('Node'), ('Databases');

select * from topics;

create table classes (
	id serial PRIMARY KEY,
	mentor serial REFERENCES mentors(id),
	topic serial REFERENCES topics(id),
	date date not null,
	location VARCHAR(30) not null 
);

insert into classes (mentor, topic, date, location) values (1,3, now(), 'online');
insert into classes (mentor, topic, date, location) values (2,1, now(), 'online');
insert into classes (mentor, topic, date, location) values (3,2, now(), 'online');

select * from classes;

CREATE TABLE attendance (
	id serial PRIMARY KEY,
	student serial REFERENCES students(id),
	class serial REFERENCES classes(id)
);

insert into attendance (student, class) values (1,1);
insert into attendance (student, class) values (4,2);
insert into attendance (student, class) values (9,3);

select * from attendance where class = 3;

SELECT * from mentors where years_living_in_glasgow > 5;
SELECT * from mentors where fav_programming_language = 'JavaScript';
SELECT * FROM students where graduation_date is not null;
SELECT * FROM classes where date < '01/06/2020'

SELECT * from students where id = 2;

