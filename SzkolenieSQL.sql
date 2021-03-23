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
select l.*, d.department_id from locations l , departments d where  l.location_id=d.location_id 
order by d.department_id nulls last;

select l.*, d.department_id from locations l left join departments d on l.location_id=d.location_id 
order by d.department_id nulls last;

select * from departments ;

--39
select  round((select avg(salary) srednia from employees),2) sr, e.* from employees e where salary >(select avg(salary) srednia from employees);
--40 
select max(salary) -min(salary) roznica from employees e join departments d on e.department_id=d.department_id where d.department_name='Finance';
--spr
select min(salary) from employees where department_id='100';
--41
select * from employees where salary> any (select salary from employees join departments using (department_id) where department_name='Finance');
select * from employees where salary>  (select min(salary) from employees join departments using (department_id) where department_name='Finance');
--42
select * from employees e where exists (select * from employees where manager_id=e.employee_id);
--43
SELECT * from employees;
SELECT e.last_name, e.manager_id , u.last_name from employees e left join employees u on e.manager_id=u.employee_id;
--44
select e.last_name, d.department_name from employees e join departments d on e.department_id=d.department_id;
--45
select e.last_name, e.salary from employees e where exists (select w.manager_id from employees w where w.manager_id=e.employee_id);
select distinct manager_id from employees;
--46
select e.last_name, round(u.srednia,2),u.liczba from employees e join (select w.department_id, avg(w.salary) srednia, count(*) liczba from employees w group by w.department_id) u 
on e.department_id=u.department_id
;
--47
select * from employees e  join departments d using (department_id) 
where d.department_name='Finance' and e.salary> (select avg(salary) from employees);
--48
select * from regions;
select e.last_name , r.region_name from employees e 
    join departments d on e.department_id=d.department_id 
    join locations l on d.location_id=l.location_id 
    join countries c on l.country_id=c.country_id 
    join regions r on c.region_id=r.region_id
    ;
--49    
create or replace view empdep as 
select d.department_name, e.* from employees e left join departments d on e.department_id=d.department_id;
select * from empdep;
--50
create or replace view myregions as 
select * from regions;
select * from myregions;
insert into myregions values (5, 'Galaxy');
select * from regions;
--51
create sequence MySequence
MINVALUE 1
maxvalue 9999
increment by 1
start with 1;
--54
select MYSEQUENCE.currval from dual;
select MYSEQUENCE.nextval from dual;
drop sequence MYSEQUENCE;
drop table mojatab;
select * from mojatab;
create table mojatab as select * from  myregions where 1=0;
select * from myregions;
select MySequence.nextval from dual;
insert into myregions values (MySequence.nextval, 'Australia');


