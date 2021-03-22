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
--29
select to_char(sysdate,'HH24:MM:SS') from dual;
--29
select to_char(sysdate+(to_date('2100-12-31','YYYY-MM-DD')-sysdate)/2,'YYYY-MM-DD') from dual;
--30
select MOD(11,2) from dual;
--32a
select department_id, max(salary) pensja from employees where department_id in ('50','80','60') group by department_id order by pensja desc;
--32b
select department_id, max(salary) pensja from employees  group by department_id  having department_id in ('50','80','60') order by pensja desc;
--33
select department_id, min(salary) from employees where lower(last_name) not like '%e%' group by department_id ;
--34
select manager_id, u.department_id, avg(salary) from employees u, (select department_id, count(*) liczba from employees group by department_id) e
    where u.department_id=e.department_id    and e.liczba>1
    group by u.department_id, u.manager_id order by u.department_id;
--36
select manager_id, u.department_id, avg(salary) from employees u
    group by cube(u.department_id, u.manager_id) order by u.department_id;
select * from employees where department_id is null order by salary desc;
--37
select * from locations;
select * from departments;
select * from countries;
select * from regions;
select region_name, country_name from regions natural join countries order by region_name ;
--38
select * from departments where department_id='250';

select l.*, d.department_id from locations l , departments d where  l.location_id=d.location_id 
order by d.department_id nulls last;

select l.*, d.department_id from locations l left join departments d on l.location_id=d.location_id 
order by d.department_id nulls last;

select * from departments where location_id='1700';
