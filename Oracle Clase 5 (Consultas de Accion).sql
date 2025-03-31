select e.apellido, e.oficio,e.salario, e.dept_no, d.dept_no
from emp e
inner join dept d
on e.dept_no = d.dept_no
where e.salario > 300000;

select h.nombre as nombre_hospital, s.nombre as nombre_sala
from hospital h
inner join sala s
on h.hospital_cod = s.hospital_cod;

select d.loc, count (e.apellido) as TRABAJADORES
from dept d
left join emp e
on d.dept_no = e.dept_no
Group by d.loc;

select count(e.apellido)as personas ,e.oficio, d.dnombre as departamento
from emp e 
right join dept d 
on d.dept_no = e.dept_no
group by e.oficio, d.dnombre;

select *
from sala;

select h.nombre as HOSPITAL, s.nombre as SALA, count(s.nombre) as NUMEROSALAS
from  sala s
inner join hospital h
on h.hospital_cod =s.hospital_cod
group by h.nombre, s.nombre;

select *
from emp;

select count(e.fecha_alt)as altas, d.dnombre
from emp e
inner join dept d
on e.dept_no = d.dept_no
where  e.fecha_alt between '01/01/1997' and '31/12/1998'
group by d.dnombre;

select *
from dept;

select count(*) as personas, d.loc as CIUDAD
from emp e
inner join dept d
on e.dept_no = d.dept_no
GROUP BY d.loc
having count(*) >= 4;

select *
from hospital;

select avg(e.salario) as MEDIASALARIAL, d.loc
from emp e
inner join dept d
on e.dept_no = d.dept_no
Group by d.loc
having d.loc in ('MADRID','SEVILLA');

select *
from hospital;

select d.apellido as Apellido, h.nombre as NOMBRE, h.direccion, h.telefono
from doctor d
inner join hospital h
on h.hospital_cod = d.hospital_cod;

select *
from hospital;

select max(d.salario) as MAXSALARIO, h.nombre
from doctor d
inner join hospital h
on h.hospital_cod = d.hospital_cod
group by h.nombre;

select *
from sala;

-- ---------
select p.apellido, p.funcion, p.turno, h.nombre as NOMBREHOSPITAL, s.nombre AS NOMBRESALA
from plantilla p
inner join hospital h
on p.hospital_cod = h.hospital_cod
inner join sala s
on h.HOSPITAL_COD = s.HOSPITAL_COD and s.HOSPITAL_COD = p.HOSPITAL_COD;


select *
from emp;

select max(e.salario) as maxsalario, min(e.salario) as minsalario, count(e.oficio) as Directores, d.loc
from emp e
inner join dept d
on e.dept_no = d.dept_no
having e.oficio = 'DIRECTOR'
group by e.oficio, d.loc;


select *
from hospital;

select s.nombre, h.nombre
from sala s
cross join hospital h;