--Consultas de accion
--Son consultas para modificar los registros de la base de datos
--En oracle, las consultas de accion son transaccionales, es decir,
--se almacena de forma temportal por sesion
--para deshacer los cambios o para hacerlos permanentes tenemos dos palbras
--commit: hace los cambios realizados
--roll back: deshace los cambios realizados
--1) iserto 2 registros nuevos
--2) commit permanente 
--3) inserto otro registro nuvo (3)
--4)rollback : solamente quita el punto 3

--Tenemos tres tipos de consulta de accion
--Insert: inserta un nuevo registro en una tabla
--update: Modifica uno o varios registro de una tabla
--delate: Elimina uno o varios registros de una tabla

--INSERT:
--Cada registro a insertar es una instuccion insert, es decir, si queremos insertar 5 registros, son 5 Insert.

--tenemos dos tipos de sintaxis:


--1) insertar todos los datos de la tabla: debemos indicar todas las columnas/ campos de la tabla
-- y en el mismo orden que esten en la tabla original.
-- Insert into Tabla values (valor1, valor2, valor3, valor4);
--Ejemplo:
Select * from dept;

insert into dept values (50, 'ORACLE', 'BERNABEU');
select * from dept;
rollback;
select * from dept;

insert into dept values (50, 'ORACLE', 'BERNABEU');
commit;
insert into dept values (51, 'BORRAR', 'SANTIAGO');
select * from dept;
rollback;
select * from dept;

--2) insertar solamente algunos datos de la tabla: debemos indicar el nombre de las columnas 
--que deseamos insertar y los valores irán en dicho orden, la tabla no tiene nada que ver
--insert into tabla (campo3, campo7) values (valor3, valor 7);
--Ejemplo:
--Insertar un nuevo departamento en almeria, no se lo que voy hacer todavia...
insert into dept (dept_no, loc) values (55, 'ALMERIA');
rollback;
select * from dept;

--Las consultas son super utiles si estamos en consulta de accion
--necesito un departamento de sidra en gijon.
--generar el siguiente numero disponible en la consulta de accion
select max (dept_no) + 1 from dept;

insert into dept values ((select max (dept_no) + 1 from dept), 'SIDRA','GIJON');
select * from dept;
rollback;

select * from dept;

--DELETE:
--Elimina una o varias filas de una tabla: si no existe nada para eliminar, no hace nada.
--Sintaxis:
--delete from tabla

--la sintaxis anterior elimina todos los registros de la tabla 
--Opcional, incluir where
--Elminar el departamento de oracle

delete from dept where dnombre='ORACLE';
select * from dept;
rollback;

--Muy util utilizar subconsultas para delete
--Eliminar todos los empleados de granada
delete from emp where dept_no = (select dept_no from dept where LOC='GRANADA');
select * from dept;
rollback;

--UPDATE:
--Modifica una o varias filas de una tabla. 
--Puede modificar varias columnas a la vez

--Sintaxis:
--update tabla set campo1=valor1, campo 2=valor2.
--Esta consulta modifica todas las filas de la tabla
--es conveniente utilizar un where

--Ejemplo:
--Modificar el salario de la plantilla del turno de noche, todos cobraran 315000

update plantilla set salario =315000
where turno ='N';
rollback;

select * from plantilla;
--Modificar la ciudad y el nombre del departamento 10.
--Se llamara cuentas y nos vamos a toledo.

update dept set Loc= 'TOLEDO', dnombre='CUENTAS'
where dept_no =10;

select * from dept;
rollback;

--Podemos mantener el valor de una columna y asignar "Algo" con operaciones
--Matematicas
--Incrementar en 1 el salario de todos los empleados.LOGMNR$COL_GG_TABF_PUBLIC

update EMP set Salario= Salario + 1;
select * from emp;
rollback;
--Si las subconsultas estan en el set, solamente deben devolver un dato

--Arroyo esta envidioso de sala, poner el mismo salario a arroyo que sala

update emp set salario=(select salario from emp where apellido ='sala') where apellido ='arroyo';

--Los catalanes estan subidos y les bajamos el sueldo a la mitad
--ponder a la mitad el salario de los empleados de barcelona

update emp set salario = salario /2
where dept_no=(select dept_no from dept where loc='BARCELONA');

select * from emp;
rollback;
