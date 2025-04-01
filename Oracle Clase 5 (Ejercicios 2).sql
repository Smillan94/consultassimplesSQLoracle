--Dar de alta con fecha actual al empleado José Escriche Barrera como programador perteneciente al departamento de producción. Tendrá un salario base de 70000
--pts/mes y no cobrar á comisión
select * from emp;

insert into emp values ((select max(emp_no)+1 from emp), 'José Escriche', 'Programador' , (select max (dir)+1 from emp), '31/03/2025', 70000, 0 , 40);

--Se quiere dar de alta un departamento de informática situado en Fuenlabrada (Madrid)
insert into dept values ((select max(dept_no)+1 from dept), 'INFORMATICA', 'MADRID');
select * from dept;

--El departamento de ventas por motivos peseteros, se traslada a Teruel, realizar dicha modificación
update dept set Loc ='TERUEL'
where dnombre ='VENTAS';
select * from dept;

--En el departamento anterior(ventas),se dan de alta dos empleados: 
--Julián Romeral y Luis Alonso. Su salario base es el menor que cobre un empleado, y cobrarán una comisión del 15% de dicho salario

--30
select * from emp;

insert into emp values ((select max(emp_no)+1 from emp),'Julian Romeral','Empleado', 
(select max (dir)+1 from emp),'31/03/2025',(select min(salario) from emp),(select min(salario *0.15) from emp),30);

insert into emp values ((select max(emp_no)+1 from emp),'Luis Alonso','Empleado', 
(select max (dir)+1 from emp),'31/03/2025',(select min(salario) from emp),(select min(salario *0.15) from emp),30);

select * from emp;
Commit;

--Modificar la comisión de los empleados de la empresa, de forma que todos tengan un incremento del 10% del salario.

update emp set salario = salario + (salario *0.1);
select * from emp;
rollback;

--Incrementar un 5% el salario de los interinos de la plantilla que trabajen en el turno de noche.

select * from plantilla;

update plantilla set salario = salario +(salario*0.5)
where funcion='INTERINO' and turno='N';
rollback;

--Incrementar en 5000 Pts. el salario de los empleados del departamento de ventas y del presidente, 
--tomando en cuenta los que se dieron de alta antes que el presidente de la empresa
select * from emp;
select * from dept;
--Ventas=30

update emp set salario = salario + (5000)
where oficio = (select fecha_alt < fecha_alt('PRESIDENTE')) and dept_no = 30;

update emp set salario = salario /2
where dept_no=(select dept_no from dept where loc='BARCELONA');

update dept set Loc= 'TOLEDO', dnombre='CUENTAS'
where dept_no =10;

--El empleado Sanchez ha pasado por la derecha a un compañero. Debe cobrar de comisión 12.000 ptas más que el empleado Arroyo y su sueldo se
--ha incrementado un 10% respecto a su compañero

select * from emp; 


UPDATE emp SET salario = (SELECT salario * 1.1 FROM emp WHERE apellido = 'arroyo'),
comision = (SELECT comision + 12000 FROM emp WHERE apellido = 'arroyo')
WHERE apellido = 'sanchez';

--Se tienen que desplazar cien camas del Hospital SAN CARLOS para un Hospital de Venezuela. Actualizar el número de camas del Hospital SAN CARLOS

Update hospital set num_cama=(select num_cama - 100 from hospital where nombre = 'san carlos')
WHERE nombre = 'san carlos';

select * from hospital;
--Subir el salario y la comisión en 100000 pesetas y veinticinco mil pesetas respectivamente a los empleados que se dier on de alta en este año

select * from emp;


UPDATE emp
SET salario = salario + 100000,
comision = comision + 25000
WHERE fecha_alt > '01/01/2025';

select * from emp;

--Ha llegado un nuevo doctor a la Paz. Su apellido es House y su especialidad
--es Diagnostico. Introducir el siguiente número de doctor disponible.

select * from doctor;
select * from hospital;

insert into doctor values( 22,(select max(doctor_no)+1 from doctor),'House','Diagnostico',100000) ;
select * from doctor;


--Borrar todos los empleados dados de alta entre las fechas 01/01/80 y 31/12/82
select * from emp;
delete from emp where fecha_alt > '01/01/80' and fecha_alt < '31/12/82';



