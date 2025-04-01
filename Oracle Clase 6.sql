Select apellido, oficio from emp
union all
select apellido, oficio from emp;

--queremos mostrar los datos de todas las personas de mi bbdd (emp, doctor, plantilla)
--solamente queremos los que cobren menos de 300.000
select * from
(select apellido, oficio, salario as sueldo from EMP
union
select apellido, funcion, salario from PLANTILLA
UNION 
select apellido, especialidad, salario from doctor) consulta
where consulta.sueldo < 300000;

--consulta a nivel de fila
--son consultas creadas para dar formato a la salida de datos
--no modifican los datos de la tabla, los muestran de otra forma 
--segun yo lo necesite
--van con preguntas en la consulta
--sintaxis evaluando un campo:
--Select campo 1, campo 2, case 3 when 'dato1' then 'valor 1' when 'dato2' then 'valor2' else 'valor 3' end as Alias from tabla  EJEMPLO:

Select * from plantilla;
--Mostramos los apellido de la plantilla, pero con su turno que se vea bien
--(mañana,tarde y Noche)

select apellido, funcion, case turno
when 'T' then 'TARDE'
when 'M' then 'MAÑANA'
else 'NOCHE'
end as turno
from plantilla;

--Evaluar por un operador (rango, mayor o menor, distinto)
--Ejemplo
--Salario de la plantilla

select apellido, funcion, salario,
case 
when salario >= 250000 then 'SALARIO CORRECTO'
when salario >= 150000 and Salario < 250000 then 'MEDIA SALARIAL'
else 'BECARIO'
end as RANGO_SALARIAL
from plantilla;

--mostrar la suma salarial de los empleados por su nombre de departamento
--mostrar la suma salarial de los doctores por su hospital
--Me gustaria poder ver todo junto en una misma consulta



select *
from plantilla;

select * 
from doctor;

select sum(d.salario) AS SALARIO_DOCTOR, sum(p.salario) as SALARIO_ENFERMERO, p.funcion, d.especialidad
from plantilla p 
inner join doctor d 
on p.hospital_cod = d.hospital_cod
group by p.funcion, d.especialidad;



select sum(e.salario) as sumasalarial, d.nombre as departamento
from emp e 
inner join join dept d 
on e.dept_no =d .dept_no
group by d.dnombre
union
select sum(d.salario) as sumasalarial, h.nombre
from doctor d
inner join hospital h
on d.hospital_cod = h.HOSPITAL_COD
group by h.nombre;




