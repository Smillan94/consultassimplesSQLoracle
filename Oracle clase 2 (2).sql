select * from EMP;
select apellido, oficio, salario from emp;
select * from emp order by apellido; 
-- No es neceario escribir "ASC" ya que ordena por defecto de manera ascendente
select * from emp order by apellido DESC;
select * from emp order by Dept_no, oficio DESC;
/* 
=igual
>=mayor
<menor
<> distinto
*/ 
--oracle, por defecto, diferecia entre masyúsculas y minúsculas en sus textos (string/varchar)
--Todo lo que no sea un nùmer se escribe entre comillas simples '...'
--Para filtrar se utiliza la palabra WHERE y se escribe solamente una vez en toda la consulta
--Despues del from 
--Mostrar todos los empleados del departamento 10
select * from emp where dept_no=10;
--mostar todos los empleados cuyo oficio sea director
select * from emp where oficio = 'DIRECTOR';
select * from emp where oficio <> 'DIRECTOR';
--Es lo mismo que:
select * from emp where oficio != 'DIRECTOR';
--operadores relacionales, nos permiten realizar mas de una pregunta dentro de una consulta
/*
OR= Muestra los datos de cada filtro
AND= Todos los filtros deben cumplirse
NOT= Negacion de una condicion (Evitarlo siempre)
*/
--Mostrar los empleados del departamento 10 y que tenga ofici director
select * from emp where dept_no=10 and oficio = 'DIRECTOR';
select * from emp where dept_no=10 or oficio = 'DIRECTOR';
select * from emp where dept_no=10 or dept_no =20;
--hay otros tipos operadores
--Between, muestra los datos entre un rango inclusive
--mostrar los empleados cuyo salario este enre 251000 y 390000
select * from emp where salario between 251000 and 390000 order by salario;
--Es lo mismo que:
select * from emp where salario >= 251000 and salario <=390000 order by salario;
--Mostrar los empleados que no sean directores
select * from emp where not oficio ='DIRECTOR';
select * from emp where oficio <> 'DIRECTOR';
--Existe un operador para buscar coincidencias en textos
--nos permite, mediante caracteres especiales hacer filtros en textos
/*
%buscar cualquier caracter y longitud
_un caracter cualquier
? un caracter numerico
*/
--Mostra los empleados cuyo apellido comiensa con S
select * from emp where apellido like 's%';
--Mostra los empleados cuyo apellido comiensa con S y finaliza con a
select * from emp where apellido like 's%a';
--mostrar todos los empleados cuyos apellido sea de 4 letras
select * from emp where apellido like '____';
--Existe otro operador para buscar coincidencias de igualdad en un mismo campo
--Es el operador in (valor1, valor2)
--mostrar los empleados del departamento 10 , 20, 30, 55 y 75
select * from emp where dept_no =  10 or dept_no = 20 or dept_no = 30 or dept_no = 55 or dept_no = 75 ;
--Con el operador in es mas sencillo
select * from emp where dept_no in (10, 20, 30, 55, 75);
--Tambien esta el operador Not in que realiza lo mismo pero recupera los que no coinciden 
select * from emp where not dept_no in (10,20);-- Negacion
select * from emp where dept_no not in (10,20);
--campos calculados 
--un campo calculado es una herramienta de una consulta 
--Sirve para generaar campos que no exista en la tabla y los podemos calcular
--mostrar el apellido, el salario, comison y el salario total (salario + comision) de todos los empleados
select apellido, salario, comision, (salario + comision) as Salario_comision from emp; 
select apellido, salario, comision, (salario + comision) as Salario_comision from emp
Where (salario + comision) >=344500;
--Queremos la consulta original y ordenar por ella
select apellido, salario, comision, (salario + comision) as Salario_comision from emp order by Salario_comision;
--clausula DISTINC se utiliza para el select y lo que realiza es:
--eliminar repetidos de la consulta
--mostrar el oficio de los empleados
select distinct oficio from emp;
select distinct oficio, dept_no from emp; 


--PRACTICA DE CLASES

--Mostrar todos los enfermos nacidos antes del 11/01/1970
select apellido, fecha_nac from enfermo where fecha_nac <= '11/01/1970'; 
--Igual que el anterior, para los nacidos antes del 1/1/1970 ordenados por número de inscripción
select * from enfermo where fecha_nac <='11/01/1970' order by inscripcion;
--Listar todos los datos de la plantilla del hospital del turno de mañana
select * from plantilla where turno = 'M'; 
--Idem del turno de noche
select * from plantilla where turno = 'N';
--Listar los doctores que su salario anual supere 3.000.000€
select doctor_no, salario from doctor where (salario * 12) >= 3000000;
--Visualizar los empleados de la plantilla del turno de mañana que tengan un salario ntre 200.000 y 250.000.
select empleado_no, apellido, turno, salario from plantilla where turno ='M' and salario between 200000 and 250000;
--Visualizar los empleados de la tabla emp que no se dieron de alta entre el 01/01/1980 y el 12/12/1982
select * from emp where (fecha_alt <= '01/01/1980' or fecha_alt >= '12/12/1990') and OFICIO= 'EMPLEADO';
-- Mostrar los nombres de los departamentos situados en Madrid o en Barcelona
select * from dept where loc = 'MADRID' or loc = 'BARCELONA';



--CONSULTAS DE AGRUPACIONES 
--ESTE TIPO DE CONSULTA NOS PERMITEN MOSTRAR ALGUN RESUMEN SOBRE UN GRUPO DETERMINADO DE LOS DATOS
--UTILIZAN FUNCIONES DE AGRUPACION PARA CONSEGUIR REL RESUMEN 
--LAS FUNCIONES DEBEN TENER ALIAS 
--COUNT (*): CUENTA EL NUMERO DE REGISTROS, INCLUYENDO NUELOS
--COUNT (CAMPO): CUENTA EL NUMERO DE REGISTROS SIN NULOS
--SUM (NUMERO) SUMAEL TOTAL DE UNCAMPONUMERO
--AVG (NUMERO): RECUPERA LA MEDIA DE UN CAMPO NUMERICO
-- MAX (CAMPO): DEVUELVE EL MAXIMO VALOR DE UN CAMPO
--MIN(CAMPO): DEVUELVE EL MINIMO VALOR DE UNCAMPO
--MOSTRAR EL NUMERO DE REGISTROS DE LA TABLA DOCTOR

SELECT COUNT(*) AS NUMERO_DE_DOCTOR FROM DOCTOR;
SELECT COUNT(APELLIDO) AS NUMERO_DE_APELLIDOS FROM DOCTOR;
--PODEMOS COMBINAR VARIAS FUNCIONES:
--ELNUMERO DE DOCTORES Y MAXIMO SALARIO
SELECT COUNT(DOCTOR_NO)AS CANTIDAD_DOCTORES, MAX(SALARIO) AS MAXIMO FROM DOCTOR;
--LOS DATOS RESULTANTES DE LAS FUNCIONES PODEMOS AGRUPARLOS POR ALGUN CAMPO DE LA TABLA
--CUANDO QUEREMOS AGRUPAR UTILIZAMOS GROUP BY SE COLOCA DESPUES DEL FROM
--TRUCO: DEBEMOS AGRUPAR POR CADA CAMPO QUE NO SEA UNA FUNCION
-- CUANTAS DOCTORES EXISTEN POR CADA ESPECIALIDAD
SELECT  COUNT(*) AS DOCTORES, ESPECIALIDAD FROM DOCTOR GROUP BY ESPECIALIDAD;

--MOSTRAR NUMERO DE PERSONAS Y MAXIMO SALARIO DE LOS EMPLEADOS POR CADA DEPARTAMENT Y OFICIO

SELECT COUNT(EMP_NO), MAX(SALARIO) AS MAXIMO_SALARIO, DEPT_NO, OFICIO 
FROM EMP 
GROUP BY DEPT_NO, OFICIO ;

--FILTRANDO EN CONSULTAS DE AGRUPACIONES
--TENEMOS DOS FORMAS
--WHERE:ANTES DEL GROUP BY (FILTRA SOBRE LA TABLA)
--HAVING: DESPUE DEL GROUP BY (FILTRA SOBRE EL CONJUNTO O RESULTADO DE LA CONSULTA)

--MOSTRAR CUANTOS EMPLEADOS TENEMOS POR CADA OFICIO CON SALARIO MAYOR A 200000 Y QUE SEAN ANALISTAS Y VENDEDORES 
SELECT COUNT(*) AS EMPLEADO, OFICIO, SALARIO 
FROM EMP 
WHERE SALARIO > 200000 
GROUP BY OFICIO,SALARIO 
HAVING OFICIO IN ('ANALISTA','VENDEDOR');

--LO MISMO PERO CON WHERE
--MOSTRAR CUANTOS EMPLEADOS TENEMOS POR CADA OFICIO CON SALARIO MAYOR A 200000 Y QUE SEAN ANALISTAS Y VENDEDORES 
SELECT COUNT(*) AS EMPLEADO, OFICIO, SALARIO 
FROM EMP 
WHERE SALARIO > 200000 AND OFICIO IN ('ANALISTA','VENDEDOR')
GROUP BY OFICIO,SALARIO;

--CUANDO ES OBLIGATORIO HAVING
--SI QUEREMOS FILTRAR POR UNA FUNCION DE AGRUPACION
--MOSTRAR CUANTOS EMPLEADOS TENEMOS POR CADA OFICIO PERO SOLAMENTE 2 O MAS EMPLEADOS

SELECT COUNT(*) AS EMPLEADOS, OFICIO
FROM EMP
GROUP BY OFICIO 
HAVING COUNT(*) >= 2;
