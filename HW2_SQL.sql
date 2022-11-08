create table employees(
id serial primary key, 
	employee_name Varchar(50) not null
);

insert into employees (employee_name)
	values ('Grisha1'), ('Grisha2'), ('Grisha3'), ('Grisha4'), ('Grisha5'), ('Grisha6'), ('Grisha7'), ('Grisha8'), ('Grisha9'), ('Grisha10'),
	       ('Grisha11'), ('Grisha12'), ('Grisha13'), ('Grisha14'), ('Grisha15'), ('Grisha16'), ('Grisha17'), ('Grisha18'), ('Grisha19'), ('Grisha20'),
	       ('Grisha21'), ('Grisha22'), ('Grisha23'), ('Grisha24'), ('Grisha25'), ('Grisha26'), ('Grisha27'), ('Grisha28'), ('Grisha29'), ('Grisha30'),
	       ('Grisha31'), ('Grisha32'), ('Grisha33'), ('Grisha34'), ('Grisha35'), ('Grisha36'), ('Grisha37'), ('Grisha38'), ('Grisha39'), ('Grisha40'),
	       ('Grisha41'), ('Grisha42'), ('Grisha43'), ('Grisha44'), ('Grisha45'), ('Grisha46'), ('Grisha47'), ('Grisha48'), ('Grisha49'), ('Grisha50'),
	       ('Grisha51'), ('Grisha52'), ('Grisha53'), ('Grisha54'), ('Grisha55'), ('Grisha56'), ('Grisha57'), ('Grisha58'), ('Grisha59'), ('Grisha60'),
	       ('Grisha61'), ('Grisha62'), ('Grisha63'), ('Grisha64'), ('Grisha65'), ('Grisha66'), ('Grisha67'), ('Grisha68'), ('Grisha69'), ('Grisha70');

select * from employees

create table salary (
id serial primary key,
  monthly_salary int not null
);

insert into salary (monthly_salary)
values (1000), (1100), (1200), (1300), (1400), (1500), (1600), (1700), (1800), (1900), (2000),
	   (2100), (2200), (2300), (2400), (2500); 
	   
select * from salary

create table employee_salary(
	id serial primary key,
	employee_id int unique not null,
	salary_id int not null,
	foreign key (employee_id)	
		references employees(id),
	foreign key (salary_id)
		references salary(id)
);

select * from employee_salary

insert into employee_salary (employee_id, salary_id)
values (3, 7), (1, 4), (5, 9), (40, 13), (23, 4), (11, 2), (52, 10), (15, 13), (26, 4), (16, 1), (33, 7), 
       (60, 7), (69, 4), (68, 9), (67, 13), (66, 4), (65, 2), (64, 10), (63, 13), (62, 4), (61, 1), (34, 7), 
       (8, 7), (2, 4), (6, 9), (41, 13), (24, 4), (12, 2), (53, 10), (18, 13), (27, 4), (17, 1), (35, 7), 
       (9, 7), (4, 4), (7, 9), (42, 13), (25, 4), (13, 2), (54, 10);

 create table roles(
	id serial primary key,
	role_name int unique not null
 );

alter table roles
	alter column role_name type varchar(30) 

select * from roles

insert into roles (role_name)
values ('Junior Python developer'), ('Middle Python developer'), ('Senior Python developer'),
       ('Junior Java developer'), ('Middle Java developer'), ('Senior Java developer'),
       ('Junior JavaScript developer'), ('Middle JavaScript developer'), ('Senior JavaScript developer'),
       ('Junior Manual QA engineer'), ('Middle Manual QA engineer'), ('Senior Manual QA engineer'),
       ('Project Manager'), ('Designer'), ('HR'), ('CEO'), ('Sales manager'), ('Junior Automation QA engineer'),
       ('Middle Automation QA engineer'), ('Senior Automation QA engineer');

create table roles_employee(
	id Serial primary key,
	employee_id int unique not null,
	role_id int not null,
	foreign key (employee_id)	
		references employees(id),
	foreign key (role_id)
		references roles(id)
);

select * from roles_employee

insert into roles_employee (employee_id, role_id)
values (3, 7), (1, 4), (5, 9), (40, 13), (23, 4), (11, 2), (52, 10), (15, 13), (26, 4), (16, 1), (33, 7), 
       (60, 7), (69, 4), (68, 9), (67, 13), (66, 4), (65, 2), (64, 10), (63, 13), (62, 4), (61, 1), (34, 7), 
       (8, 7), (2, 4), (6, 9), (41, 13), (24, 4), (12, 2), (53, 10), (18, 13), (27, 4), (17, 1), (35, 7), 
       (9, 7), (4, 4), (7, 9), (42, 13), (25, 4), (13, 2), (54, 10);

--drop table 