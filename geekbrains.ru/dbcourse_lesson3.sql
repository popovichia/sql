-- DB geodata
-- 1) Сделать запрос, в котором мы выберем все данные о городе – регион, страна.
select 
	ct.title as 'City',
	rg.title as 'Region',
	cn.title as 'Country'
from geodata.`_cities` as ct
	join geodata.`_regions` as rg
		on ct.region_id = rg.id 
	join geodata.`_countries` as cn
		on rg.country_id = cn.id
order by cn.title, rg.title, ct.title;


-- 2) Выбрать все города из Московской области.
select 
	ct.title as 'City'
from geodata.`_cities` ct
	join geodata.`_regions` rg
		on ct.region_id = rg.id
where rg.title = 'Московская область'
order by ct.title;


-- DB employees
-- 1) Выбрать среднюю зарплату по отделам.
select
	depemp.dept_no as 'Department',
	AVG(sal.salary) as 'Avarage salary'
-- 	SUM(sal.salary) as 'Salaries summ',
-- 	COUNT(*) as 'Rows count',
-- 	(SUM(sal.salary)/COUNT(*)) as 'SUM div COUNT'
from employees.salaries as sal
	join employees.employees as emp
		using(emp_no)
	join employees.dept_emp as depemp
		using(emp_no)
where sal.to_date = '9999-01-01'
group by depemp.dept_no;


-- 2) Выбрать максимальную зарплату у сотрудника.
select
	emp.last_name as 'Employee last name',
	emp.first_name as 'Employee first name',
	MAX(sal.salary) as 'Max salary'
from employees.salaries sal
	join employees.employees emp
		on sal.emp_no = emp.emp_no 
group by emp.emp_no
order by MAX(sal.salary) desc;


-- 3) Удалить одного сотрудника, у которого максимальная зарплата.
-- select * from employees.employees where emp_no = 43624;
-- select * from employees.salaries where emp_no = 43624;
-- 43624,"1953-11-14",Tokuyasu,Pesch,M,"1985-03-26"
-- select emp.*, sal.salary
delete emp
from employees.salaries as sal
	join employees.employees as emp
		using(emp_no)
where sal.salary = 
(select
	MAX(sal.salary) as 'max_salary'
from employees.salaries as sal
where sal.to_date = '9999-01-01');

-- 4) Посчитать количество сотрудников во всех отделах.
select
	depemp.dept_no as 'Department',
	COUNT(*) as 'Employees count'
from employees.employees emp
	join employees.dept_emp depemp
		on emp.emp_no = depemp.emp_no
 where depemp.to_date = '9999-01-01'
group by depemp.dept_no;


-- 5) Найти количество сотрудников в отделах и посмотреть, сколько всего денег получает отдел.
select
	depemp.dept_no as 'Department',
	COUNT(*) as 'Employees count',
	SUM(sal.salary) as 'Salaries summ'
from employees.salaries as sal
	join employees.employees as emp
		using(emp_no) 
	join employees.dept_emp as depemp
		using(emp_no)
where
	sal.to_date = '9999-01-01' and depemp.to_date = '9999-01-01'
group by depemp.dept_no;

