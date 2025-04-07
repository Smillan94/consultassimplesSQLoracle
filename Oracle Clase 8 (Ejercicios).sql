CREATE TABLE COLEGIOS
  (COD_COLEGIO NUMBER(10)
  ,NOMBRE VARCHAR2(20) NOT NULL
  ,LOCALIDAD VARCHAR2(15)
  ,PROVINCIA VARCHAR2(15)
  ,ANO_CONSTRUCCION DATE
  ,COSTE_CONSTRUCCION NUMBER(10)
  ,CODIGO_REGION NUMBER(10)
  ,UNICO NUMBER(10)
  ,PRIMARY KEY (COD_COLEGIO)
  ,UNIQUE (UNICO) 
);

CREATE TABLE PROFESORES
  (COD_PROFE VARCHAR2(10) NOT NULL
  ,NOMBRE VARCHAR2(15) NOT NULL
  ,APELLIDO1 VARCHAR2(15)
  ,APELLIDO2 VARCHAR2(15)
  ,DNI CHAR(9)
  ,EDAD NUMBER(10)
  ,LOCALIDAD VARCHAR2(30)
  ,PROVINCIA VARCHAR2(30)
  ,SALARIO NUMBER(30)
  ,COD_COLEGIO NUMBER(10)
  ,PRIMARY KEY (COD_PROFE)
  ,UNIQUE (DNI) 
);

CREATE TABLE REGIONES
  (COD_REGION NUMBER(10)
  ,REGIONES VARCHAR2(20) NOT NULL
  ,PRIMARY KEY (COD_REGION)
);

CREATE TABLE ALUMNOS
  (DNI VARCHAR2(30) NOT NULL
  ,NOMBRE VARCHAR2(30) NOT NULL
  ,APELLIDOS VARCHAR2(30)
  ,FECHA_INGRESO DATE
  ,FECHA_NAC DATE
  ,LOCALIDAD VARCHAR2(15)
  ,PROVINCIA VARCHAR2(30)
  ,COD_COLEGIO NUMBER(10) 
);

alter table PROFESORES
add constraint FK_PROFESORES_COLEGIO
foreign key (COD_COLEGIO)
references COLEGIOS (COD_COLEGIO);

alter table ALUMNOS
add constraint FK_ALUMNOS_COLEGIO
foreign key (COD_COLEGIO)
references COLEGIOS (COD_COLEGIO);

--Crear una nueva relación entre el campo Cod_Region de la tabla REGIONES y
--Cod_Region de la tabla colegios.

alter table COLEGIOS
add constraint FK_COLEGIOS_REGIONES
foreign key (CODIGO_REGION)
references REGIONES (COD_REGION);

--Añadir el campo Sexo, Fecha de nacimiento y Estado Civil a la tabla Profesores.

alter table PROFESORES
add(SEXO varchar2(10)
, FECHA_NACIMIENTO DATE
, ESTADO_CIVIL VARCHAR(10)
);

--Eliminar el campo Edad de la tabla Profesores

alter table PROFESORES
drop COLUMN EDAD;

--Añadir el campo Sexo, Dirección y Estado Civil a la tabla Alumnos

alter table ALUMNOS
add (SEXO VARCHAR2(10)
, DIRECCION INTEGER
, ESTADO_CIVIL VARCHAR2(10)
);

--Borrar la relación existente entre la tabla profesores y Colegios
alter table PROFESORES
drop constraint FK_PROFESORES_COLEGIO;

--Crear de nuevo la relación borrada en el ejercicio anterior que tenga eliminación
--en cascada

alter table PROFESORES 
add constraint FK_PROFESORES_COLEGIO
foreign key (COD_COLEGIO)
references COLEGIOS (COD_COLEGIO)
on delete CASCADE;

--Agregar un valor por defecto con la fecha actual al campo Fecha_Ingreso de la
--tabla alumnos

ALTER TABLE ALUMNOS
MODIFY (Fecha_Ingreso DATE DEFAULT SYSDATE);

--Queremos rellenar los datos de las tablas creadas, para
--ello vamos a introducir a
--tres alumnos en los colegios. Los datos son los siguientes:

insert into alumnos (Nombre, localidad, provincia)
values ('Ana Ortiz Ortega', 'Madrid', 'Madrid');

insert into alumnos (Nombre, localidad, provincia)
values ('Javier Chuko Palomo', 'Arenales del Sol', 'Alicante');

insert into alumnos (Nombre, localidad, provincia)
values ('Miguel Torres Tormo ', 'Llobregat', 'Barcelona');


