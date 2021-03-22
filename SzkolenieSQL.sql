select * from dual;

--3
desc departments;

--8
select * from departments;
--9
select distinct department_name from departments;

--10
select city, nvl(state_province,'Brak') lokalizacja from locations;
--11
SELECT distinct department_id from employees order by department_id desc nulls last;
--12
select * from employees where  manager_id = '123';
--13
select * from employees where (salary*12)>8000;
--14
select * from employees where salary>1100;
--15
select * from employees where (12*salary) between 9000 and 13000;
select * from employees where (12*salary) > 9000 and (12*salary) <13000;
--16
select * from employees where salary > 800 and salary < 1200;
select * from employees order by salary;
--17
select * from employees where first_name like '%a';
--18
select * from employees where last_name like '%a%' and salary>8000;
--19
select * from employees where manager_id in ('100','123');
