

--CREATE: Crea un objeto en Oracle
--ALTER Modifica un objeto en Oracle
--DROP: Elimina un objeto en Oracle

CREATE TABLE prueba (
     identificador integer,
     texto10 VARCHAR2(10),
     textochar char(5)
);
describe prueba;

insert into prueba values(1,'abcdefghi', 'aeio');
select * from prueba;

--La prueba contiene un registro 
--Vamos agregar una nueva columna de tipo texto llamada Nueva


alter table prueba 
add (Nueva varchar2(3));

--Agregamos otra columna de tipo texto llamada SINNULOS

alter table prueba
add (SINNULOS varchar2(7) not null);

rollback;
delete from prueba;

--Vamos a eliminar la columna SINNULOS

alter table prueba
drop column sinnulos;
select * from prueba;

--Vamos a modificar la columna Nueva con el tipo de dato:

alter table prueba
Modify (Nueva float);

--Vamos a Cambiarle el nombre a la tabla

rename prueba to prueva;

rename prueva to prueba;

--Vamos a eliminar todos los registros sin eliminar la tabla:

truncate table prueba;
select * from prueba;

--Vamos añadir comentarios a una tabla

comment on table prueba is 'Hoy es miercoles 02/04/2025';

select * from user_tab_comments where table_name='PRUEBA';
select * from ALL_tab_comments where table_name='PRUEBA';

--vamor a ver todas las tablas que pertencen al usuario en el orden de creación.

select * from user_tables;
select * from all_tables;

--Mostrar todos los objetos que he creado:

select distinct object_type from user_objects;

--Mostrar los objetos que son propiedad del usuario

select * from cat;


--DEFAULT: incluye un valor por fecto en una columna si no le hemos aasignado un dato al registro
--Restricciones (Impiden insertar o modificar registros):
--Primary Key
--UNIQUE
--FOREIGN KEY
--CHECK

select * from prueba;
drop table prueba;

CREATE TABLE prueba (
     identificador integer,
     texto10 VARCHAR2(10),
     textochar char(5)
);

insert into prueba values (1, 'abcdfghijk','aeiou');

--Añadimos una nueva columna llamada TEST

alter table prueba
add (test int);

--DEFAULT:
--Añadimos otra columna, pero que contendra valores por defecto:

alter table prueba
add(defecto int default -1);

insert into prueba (identificador,texto10,textochar )
values (2,'AA','AA');

select * from prueba;

insert into prueba (identificador,texto10,textochar,defecto )
values (3,'AA','AA', 22);

insert into prueba (identificador,texto10,textochar,defecto )
values (4,'BB','AA', null);

--PRIMARY KEY
--Incluimos una restriccion PK en el campo Dept_no de departamentos para que no puede admitir nulos.

alter table dept
add constraint PK_dept
primary key (dept_no);

select * from USER_CONSTRAINTS;


--No se podria insertar un departamento con el mismo identificador ejemplo:
insert into dept values (10, 'REPE', 'REPE'); 

--Se elimina la PK:
alter table dept
drop constraint PK_DEPT;

--Comprobamos insertar ahora si el departamento 10, el cual si permite el registro
insert into dept values (10, 'REPE', 'REPE'); 
select * from dept;
--Si se quiere asignar la PK con el valor repetido, no permite assignarle la PK

alter table dept
add constraint PK_dept
primary key (dept_no);

rollback;
select * from dept;

delete from dept where dept_no = 10;
select * from dept;


--vamos a trabajar sobre la tabla de empleados
alter table EMP
add constraint PK_emp
primary key (emp_no);

--creamos una restriccion para comprobar que el salario siempre sea positivo
--CH_TABLA_CAMPO

alter table emp
add constraint ch_emp_salario
check (salario >=0);

--Comprobamos con un update para intentar cambiar el salario de un empleado a valor negativo el cual no permitira realizar el cambio

update emp set salario= -1
where emp_no =7782;

--Eliminamos la restriccion creada de CH

alter table emp
drop CONSTRAINT CH_EMP_SALARIO;

--Comprobamos modificar y ahora si permite cambiar el valor a un valor negativo
update emp set salario= -1
where emp_no =7782;

--Ahora vamos a trabajar sobre la tabla enfermo:

select * from enfermo;
alter table enfermo
add CONSTRAINT PK_Inscripcion --Se recomienda colocar el nombre de la tabla, esdecir PK_ENFERMO
Primary key (INSCRIPCION);

--vamos agregar una restriccion UNIQUE a una columna de la tabla enfermo, en este caso a la columna NSS 
alter table enfermo
add constraint U_ENFERMO_NSS
Unique (nss);

select * from enfermo;
-- intentamos realizar un registro repetido para la columna INSCRIPCION , logicamente no dejara realizar el registro:
insert into enfermo values (74835 , 'nuevo' ,'Colombia', '02/04/2025', 'M', 123);
-- intentamos realizar un registro repetido para la columna NSS , logicamente no dejara realizar el registro:

insert into enfermo values (74836 , 'nuevo' ,'Colombia', '02/04/2025', 'M', 154811767);

--insertar nulos a la PK (NO SE PUEDE):
--insertar nulos a la columna con valores nulos (SI SE PUEDE, si la columna lo admite y se permite mas de una vez, ya que null no es un valor)








