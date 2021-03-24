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
--55
create or replace procedure mojaPierwszaPr (mojaLiczba number) is
zmiennaTekstowa constant varchar2(50):='Damian';
zmiennaLiczbowa number (5,2) :=0;
zmiennaTekstowa2 varchar2(50);
begin
null;
end
;
/
--56
declare
type mojRekord is record (imie varchar2(50), nazwisko varchar2(50), numerTel varchar2(9));
zmienna1 mojRekord;
zmienna2 mojRekord;
begin
zmienna1.imie:='Damian';
zmienna1.nazwisko:='Orzech';
zmienna1.numerTel:='791044050';
zmienna2.imie:='Kasia';
zmienna2.nazwisko:='Orzech';
zmienna2.numerTel:='600044050';

dbms_output.put_line(zmienna1.imie);
dbms_output.put_line(zmienna1.nazwisko);
dbms_output.put_line(zmienna1.numerTel);

dbms_output.put_line(zmienna2.imie);
dbms_output.put_line(zmienna2.nazwisko);
dbms_output.put_line(zmienna2.numerTel);
end;
/

--57 i 58
declare
rEmp employees%rowtype;
begin
for i in 1..100 loop
    dbms_output.put_line(i);
end loop;
end;
/
--59
declare
zmienna1 number(5,2);
zmienna2 number(5,2);
begin
zmienna1:=65;
zmienna2:=10;

if zmienna1 <10 then
    DBMS_OUTPUT.PUT_LINE('Zmienna 1: '||zmienna1);
elsif zmienna1>=10 then
    DBMS_OUTPUT.PUT_LINE('Zmienna 1 jest wieksza od 10, natomiast zmienna2 ma wartoœæ: '||zmienna2);
end if;
end;
/
--60
declare
type mojRek is record(imie varchar2(50),nazwisko varchar2(50), nrTel varchar2(9));
zmienna1 mojRek; 
zmienna2 mojRek;
begin
zmienna1.imie:='Damian';
zmienna1.nazwisko:='Orzech';
zmienna1.nrTel:='791044050';
zmienna2:=zmienna1;

dbms_output.put_line(zmienna2.imie);
dbms_output.put_line(zmienna2.nazwisko);
dbms_output.put_line(zmienna2.nrTel);
end;
/
select * from regions;
--61
declare 
type rRegion1 is record (region_id regions.region_id%type,region_name regions.region_name%type);
zmienna1 rRegion1;
zmienna2 regions%rowtype;
begin
zmienna1.region_id:=1;
zmienna1.region_name:='Europe';
zmienna2:=zmienna1;

DBMS_OUTPUT.PUT_LINE(zmienna2.region_id||' '||zmienna2.region_name);
end;
/

--62
begin
for i in 1..500 loop
    if mod(i,2)=0 then
        DBMS_OUTPUT.PUT_LINE(i);
    end if;
end loop;
end;
/

--63
declare
rZmienna employees%rowtype;
begin
select * into rZmienna from employees where employee_id='104';
DBMS_OUTPUT.PUT_LINE('Imie: '||rZmienna.first_name||' , nazwisko: '||rZmienna.last_name);
end;
/
--64
declare
type tabl is table of varchar(30) index by BINARY_INTEGER;
tabMoja tabl;
begin
for i in 1..1000 loop
    tabMoja(i):='Puste';
end loop;

DBMS_OUTPUT.PUT_LINE(tabMoja.count);
end;
/

--65
declare
ileWierszy number;
j number:=1;
begin
select count(*) into ileWierszy from employees;

for i in 1..ileWierszy loop
    DBMS_OUTPUT.PUT_LINE(i||' X');
end loop;

while j<=ileWierszy loop
    DBMS_OUTPUT.PUT_LINE(j||' X WHILE');
    j:=j+1;
end loop;
j:=1;
loop
   DBMS_OUTPUT.PUT_LINE(j||' X loop');
   j:=j+1;
   if j>ileWierszy then
    exit;
    end if;
end loop;

end;
/
select count(*) from employees where 1=0;
desc employees;

select * from employees where employee_id=115 order by salary asc;
declare 
id_prac number :=115;
ilePodw number:=0;
rPrac employees%rowtype;
begin 
select count(*) into ilePodw from employees where manager_id=id_prac;
select * into rPrac from employees where employee_id = id_prac;
if  ilePodw>0 then
DBMS_OUTPUT.PUT_line('Imie: '||rPrac.first_name||' nazwisko: '||rPrac.last_name||' liczba podwladnych: '|| ilePodw);
elsif rPrac.first_name is null then
DBMS_OUTPUT.PUT_line('Nie ma takiego pracownika');
else
DBMS_OUTPUT.PUT_line('pracownik nie ma Imie: '||rPrac.first_name||' nazwisko: '||rPrac.last_name||' liczba podwladnych: '|| ilePodw);
null;
end if;
end;
/

--67
declare 
id_prac number :=20;
ilePodw number:=0;
rPrac employees%rowtype;
begin 
select count(*) into ilePodw from employees where manager_id=id_prac;
select * into rPrac from employees where employee_id = id_prac;
if  ilePodw=1 then
    DBMS_OUTPUT.PUT_line('Imie: '||rPrac.first_name||' nazwisko: '||rPrac.last_name||' liczba podwladnych: '|| ilePodw||' -kierownik');
elsif  ilePodw >2 and  ilePodw<5 then
    DBMS_OUTPUT.PUT_line('Imie: '||rPrac.first_name||' nazwisko: '||rPrac.last_name||' liczba podwladnych: '|| ilePodw||' -manager');
elsif  ilePodw >=5  then
    DBMS_OUTPUT.PUT_line('Imie: '||rPrac.first_name||' nazwisko: '||rPrac.last_name||' liczba podwladnych: '|| ilePodw||' -dyrektor');
elsif rPrac.first_name is null then
DBMS_OUTPUT.PUT_line('Nie ma takiego pracownika');
else
DBMS_OUTPUT.PUT_line('pracownik nie ma Imie: '||rPrac.first_name||' nazwisko: '||rPrac.last_name||' liczba podwladnych: '|| ilePodw||' pracownik');
null;
end if;

exception
when no_data_found then
DBMS_OUTPUT.PUT_LINE('Nie ma takiego pracownika');
end;
/

declare
srednia number;
cursor cMojKursor is select * from employees where salary>(select avg(salary) from employees );
begin
select avg(salary) into srednia from employees;

for rMojKursor in cMojKursor loop
    DBMS_OUTPUT.PUT_LINE(rMojKursor.first_name||' ' ||rMojKursor.last_name||' ' ||rMojKursor.salary||' ' ||round(srednia,2));
end loop;
end;
/

declare
srednia number;
cursor cMojKursor is select * from employees where salary>srednia;
begin
select avg(salary) into srednia from employees;

for rMojKursor in cMojKursor loop
    DBMS_OUTPUT.PUT_LINE(rMojKursor.first_name||' ' ||rMojKursor.last_name||' ' ||rMojKursor.salary||' ' ||round(srednia,2));
end loop;
end;
/

declare
srednia number;
cursor cMojKursor (sr number) is select * from employees where salary>sr;
begin
select avg(salary) into srednia from employees;

for rMojKursor in cMojKursor(srednia) loop
    DBMS_OUTPUT.PUT_LINE(rMojKursor.first_name||' ' ||rMojKursor.last_name||' ' ||rMojKursor.salary||' ' ||round(srednia,2));
end loop;
end;
/

declare
srednia number;
cursor cMojKursor (sr number) is select * from employees where salary>sr;
rCur employees%rowtype;
begin
select avg(salary) into srednia from employees;

open cMojKursor(srednia);
if cMojKursor%found  then
DBMS_OUTPUT.PUT_LINE('jest otwarty');
end if;
loop
    fetch cMojKursor into rCur;
    DBMS_OUTPUT.PUT_LINE(rCur.first_name||' ' ||rCur.last_name||' ' ||rCur.salary||' ' ||round(srednia,2));
    exit when cMojKursor%notfound;
end loop;
close cMojKursor;
end;
/

