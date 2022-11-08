--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employee_name, monthly_salary 
from employees, employee_salary, salary
	where employee_id = employees.id and salary_id = salary.id ;

select employee_name, monthly_salary 
from employee_salary join salary
	on salary_id = salary.id
	join employees
	on employee_id = employees.id;
	
-- 2. Вывести всех работников у которых ЗП меньше 2000.
select employee_name, monthly_salary 
from employees, salary, employee_salary
	where salary_id = salary.id and employee_id = employees.id and monthly_salary < 2000;

select employee_name, monthly_salary 
from employee_salary join salary
	on salary_id = salary.id
	join employees
	on employee_id = employees.id
		where monthly_salary < 2000;
-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select * from salary;
select monthly_salary, employee_id
from employee_salary right join salary 
	on salary_id = salary.id
	where employee_id is null;
-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select monthly_salary, employee_id
from employee_salary right join salary 
	on salary_id = salary.id
	where monthly_salary < 2000 and employee_id is null;
-- 5. Найти всех работников кому не начислена ЗП.
select employee_name, salary_id
from employee_salary right join employees
	on employees.id = employee_id
	where salary_id is null  ;
-- 6. Вывести всех работников с названиями их должности.
select employee_name, role_name
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id;
-- 7. Вывести имена и должность только Java разработчиков.
select employee_name, role_name
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id
	where role_name like '% Java %';   --like (означает КАК)
-- 8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id
	where role_name like '% Python %';
-- 9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id
	where role_name like '% QA engineer';
-- 10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id
	where role_name like '% Manual QA engineer';
-- 11. Вывести имена и должность автоматизаторов QA
select employee_name, role_name
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id
	where role_name like '% Auto% QA engineer';
-- 12. Вывести имена и зарплаты Junior специалистов
select employee_name, role_name
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id
	where role_name like 'Junior%';
-- 13. Вывести имена и зарплаты Middle специалистов
select employee_name, role_name
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id
	where role_name like 'Middle%';
-- 14. Вывести имена и зарплаты Senior специалистов
select employee_name, role_name
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id
	where role_name like 'Senior%';
-- 15. Вывести зарплаты Java разработчиков
select employee_name, role_name, monthly_salary 
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id
	join employee_salary 
	on employee_salary.employee_id = employees.id
	join salary 
	on salary.id = salary_id
	where role_name like '%Java%';
-- 16. Вывести зарплаты Python разработчиков
select employee_name, role_name, monthly_salary 
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id
	join employee_salary 
	on employee_salary.employee_id = employees.id
	join salary 
	on salary.id = salary_id
	where role_name like '%Python%';
-- 17. Вывести имена и зарплаты Junior Python разработчиков
select employee_name, role_name, monthly_salary 
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id
	join employee_salary 
	on employee_salary.employee_id = employees.id
	join salary 
	on salary.id = salary_id
	where role_name like 'Junior Python%';
-- 18. Вывести имена и зарплаты Middle JS разработчиков
select employee_name, role_name, monthly_salary 
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id
	join employee_salary 
	on employee_salary.employee_id = employees.id
	join salary 
	on salary.id = salary_id
	where role_name like 'Middle JavaScript%';
-- 19. Вывести имена и зарплаты Senior Java разработчиков
select employee_name, role_name, monthly_salary 
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id
	join employee_salary 
	on employee_salary.employee_id = employees.id
	join salary 
	on salary.id = salary_id
	where role_name like 'Senior Java%';
-- 20. Вывести зарплаты Junior QA инженеров
select employee_name, role_name, monthly_salary 
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id
	join employee_salary 
	on employee_salary.employee_id = employees.id
	join salary 
	on salary.id = salary_id
	where role_name like 'Junior Manual QA%';
-- 21. Вывести среднюю зарплату всех Junior специалистов
select avg(monthly_salary) 
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id
	join employee_salary 
	on employee_salary.employee_id = employees.id
	join salary 
	on salary.id = salary_id
	where role_name like 'Junior%';
-- 22. Вывести сумму зарплат JS разработчиков
select sum(monthly_salary) 
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id
	join employee_salary 
	on employee_salary.employee_id = employees.id
	join salary 
	on salary.id = salary_id
	where role_name like '%JavaScript%';
-- 23. Вывести минимальную ЗП QA инженеров
select min(monthly_salary) 
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id
	join employee_salary 
	on employee_salary.employee_id = employees.id
	join salary 
	on salary.id = salary_id
	where role_name like '%QA engineer%';
-- 24. Вывести максимальную ЗП QA инженеров
select max(monthly_salary) 
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id
	join employee_salary 
	on employee_salary.employee_id = employees.id
	join salary 
	on salary.id = salary_id
	where role_name like '%QA engineer%';
-- 25. Вывести количество QA инженеров
select count(*)
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id
	where role_name like '%QA engineer%';
-- 26. Вывести количество Middle специалистов.
select count(*)
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id
	where role_name like '%Middle%';
-- 27. Вывести количество разработчиков
select count(*)
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id
	where role_name like '%developer%';
-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(monthly_salary) 
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id
	join employee_salary 
	on employee_salary.employee_id = employees.id
	join salary 
	on salary.id = salary_id
	where role_name like '%developer%';
-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, role_name, monthly_salary
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id
	join employee_salary 
	on employee_salary.employee_id = employees.id
	join salary 
	on salary.id = salary_id
	order by (monthly_salary);
-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employee_name, role_name, monthly_salary
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id
	join employee_salary 
	on employee_salary.employee_id = employees.id
	join salary 
	on salary.id = salary_id
	where monthly_salary > 1700 and monthly_salary < 2300
	order by (monthly_salary);
-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employee_name, role_name, monthly_salary
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id
	join employee_salary 
	on employee_salary.employee_id = employees.id
	join salary 
	on salary.id = salary_id
	where monthly_salary < 2300
	order by (monthly_salary);
-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name, role_name, monthly_salary
from roles_employee join employees
	on employee_id = employees.id 
	join roles 
	on role_id = roles.id
	join employee_salary 
	on employee_salary.employee_id = employees.id
	join salary 
	on salary.id = salary_id
	where monthly_salary in (1100, 1500, 2000)
	order by (monthly_salary);