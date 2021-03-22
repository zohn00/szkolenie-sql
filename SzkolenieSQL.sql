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


