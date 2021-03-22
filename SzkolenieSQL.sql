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
--20
select lower(first_name), upper(last_name)from employees;
--21 -INITCAP
select initcap(lower(first_name)) from employees;
--22
select last_name, replace(last_name,'Ma','AM') from employees;
--23
select last_name,substr(last_name, 3,3) from employees;
--24
select first_name, to_char(salary, '999999999.99') from employees;
--25
select last_name, length(last_name) dlugosc from employees;
--26
select first_name, ROUND(salary,2)from employees;
--27
select to_char(LAST_DAY(to_date('2098-02-01','YYYY-MM-DD')),'DD') ile_dni_luty from dual;
--28
select round(add_months(sysdate,148),'YEAR') from dual;

