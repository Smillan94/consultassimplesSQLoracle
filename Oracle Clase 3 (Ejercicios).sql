
--EJERCICIOS DE PRACTICA:

--Encontrar el salario más alto, mas bajo y la diferencia entre ambos de todos los empleados con oficio EMPLEADO
select oficio, MAX(salario), MIN(salario), (max(salario)- min(salario)) as diferencia
FROM emp
GROUP BY oficio
Having oficio ='EMPLEADO';


--Visualizar el número de personas que realizan cada oficio en cada departamento ordenado por departamento
select count(*) as personas, oficio
from emp
group by oficio
order by 2 DESC;

select *
from emp;

--Buscar aquellos departamentos con cuatro o más personas trabajando
select count(*) as personas , oficio 
from emp
group by oficio
having count(*) >=4;

--Visualizar el número de enfermeros, enfermeras e interinos que hay en la plantilla, ordenados por la función.

select count(*) as TRABAJADORES ,funcion
from plantilla
group by funcion
HAVING funcion IN ('ENFERMERO', 'ENFERMERA','INTERINO')
order by funcion;


--Visualizar departamentos, oficios y número de personas, para aquellos departamentos que tengan dos o más personas trabajando en el mismo oficio
select count(*) as num_personas, oficio, DEPT_NO
from emp
group by oficio, DEPT_NO
having count(*) >= 2;

--Calcular el valor medio de las camas que existen para cada nombre de sala. Indicar el nombre de cada sala y el número de cada una de ellas.
select *
from plantilla;

select AVG(num_cama) as promedio, SUM(num_cama)as NumeroCamas, nombre
from sala
group by  nombre;

--Calcular el salario medio de la plantilla de la sala 6, según la función que realizan. Indicar la función y el número de empleados.
select AVG(salario) as salariomedio, funcion, sala_cod, count(*) as NUMempleados
from plantilla
where sala_cod =6
group by funcion,sala_cod;

--Averiguar los últimos empleados que se dieron de alta en la empresa en cada uno de los oficios, ordenados por la fecha

select max(fecha_alt), oficio
from emp
group by oficio;

--Mostrar el número de hombres y el número de mujeres que hay entre los enfermos

Select *
from enfermo;

select count(*), sexo
from enfermo
group by sexo;

--Calcular el número de salas que existen en cada hospital

select *
from sala;

select hospital_cod, count(*) as cantidad_salas
from sala
group by hospital_cod;

--Mostrar el número de enfermeras que existan por cada sala.
select * 
from plantilla;

select count(*) as enfermeras, sala_cod
from plantilla
where funcion = 'ENFERMERA'
group by sala_cod;



