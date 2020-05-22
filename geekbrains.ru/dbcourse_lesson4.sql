-- DB employees
-- 1) Создать VIEW на основе запросов, которые вы сделали в ДЗ к уроку 3.
create or replace view employees.view_test
as
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


-- 2) Создать функцию, которая найдет менеджера по имени и фамилии.
delimiter //
drop function if exists employees.getManagerIdByFullName //
create function employees.getManagerIdByFullName(p_first_name char(14), p_last_name char(16))
returns int
reads sql data
begin
return 
	(select
		e.emp_no
	from employees.dept_manager as dm
		join employees.employees as e
			using(emp_no) 
	where e.first_name = p_first_name and e.last_name = p_last_name);
end //
delimiter ;
------------------------------------------------------------------------------------
select employees.getManagerIdByFullName('Ebru','Alpin');

-- 3) Создать триггер, который при добавлении нового сотрудника
-- будет выплачивать ему вступительный бонус, занося запись об этом в таблицу salary.
use employees;
delimiter //
create trigger employees.addFirstSallary after insert on employees
for each row
begin
	insert into salaries (emp_no, salary, from_date, to_date)
	values(new.emp_no, 30000, current_date(), current_date());
end //
delimiter ;