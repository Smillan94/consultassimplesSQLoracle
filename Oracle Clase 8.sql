--Vamos a crear una secuencia para la tabla departamentos:
create SEQUENCE SEQ_DEPT
increment by 10
start with 40;

--Una secuencia no se puede modificar, solo eliminar y crear de nuevo
--todavia no hemos utilizado la secuencia
--vamos a utilizarla:

select seq_dept.nextval as siguiente from dual;

--No podemos acceder a currval hasta que no hemos ejecutado nextval

select seq_dept.currval as actual from dual;

--Si lo queremos para insertar debemos llamarla de forma explicita:

insert into dept values (seq_dept.nextval, 'Nuevo', 'Nuevo');
select * from dept;

--Para eliminar la secuencia:

drop sequence seq_dept;

--Una secuencia no esta asociada a una tabla, 
--simplemente es un contador, se podria utilizar en cualquier tabla

--Practica
--Crear las siguientes caracteristicas dentro de nuestra base de datos hospital
--1) PK en hospital
--2)PK en Doctor
--3) Relacionar doctores con hospital
--4) Las personas de la plantilla solamente pueden trabajar en 
--turnos de mañana, tarde o noche (T,N,M)

select * from hospital;
select * from doctor;
select * from plantilla;

--PK en hospital
alter table hospital
add constraint PK_HOSPITAL
primary key (HOSPITAL_COD);

--PK en Doctor
alter table doctor
add constraint PK_DOCTOR
primary key (DOCTOR_NO);

--Relacionar doctores con hospital
alter table DOCTOR
add constraint FK_DOCTOR_HOSPITAL
foreign key (HOSPITAL_COD)
references HOSPITAL (HOSPITAL_COD);

--Las personas de la plantilla solamente pueden trabajar en 
--turnos de mañana, tarde o noche (T,N,M)

ALTER TABLE plantilla
ADD CONSTRAINT ch_plantilla_turno
CHECK (turno IN ('T', 'M', 'N'));


