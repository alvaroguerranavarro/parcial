--Parte I:
--Crear un tablespace llamado "mid_term", este solamente tendrá un datafile de 40Mb.
CREATE TABLESPACE mid_term
DATAFILE 'MID_TERMN.dbf' SIZE 40M
ONLINE;
--Crear un usuario con espacio ilimitado en el tablespace "mid_term", el nombre de usuario será la inicial de su nombre 
--y el primer apellido completo (Ejemplo: amartinez).
CREATE USER aguerra
IDENTIFIED BY aguerra
DEFAULT TABLESPACE mid_term
QUOTA UNLIMITED ON mid_term;

GRANT CONNECT TO aguerra;
GRANT CREATE SESSION TO aguerra;

--Crear 2 roles:
--El primer role se llamará "MINI_DBA" y este tendrá los privilegios de Crear Secuencias y crear tablas.
CREATE ROLE MINI_DBA  IDENTIFIED BY MINIDBA ;
GRANT CREATE SEQUENCE TO MINI_DBA;
GRANT CREATE TABLE TO MINI_DBA;
--El segundo role se llamará "STUDENT" y este tendrá el privilegio de crear sesión y
CREATE ROLE STUDENT IDENTIFIED BY STUDENT;
GRANT CREATE SESSION TO STUDENT;
--adicional tendrá anidado el role de "MINI_DBA".Asociar el role al usuario creado. 
GRANT MINI_DBA TO STUDENT;
--Parte II (Loguearse con el usuario y crear lo siguiente):
--Secuencias:
--Crear 2 secuencias:
--DELITOS_SEQ: Deberá comenzar en 100 y tener un valor máximo de 200 con incrementos de 1.
--CAPTURAS_SEQ:  Deberá comenzar en 1000 y tener un valor máximo de 2000 con incrementos de 1.
--Parte II (Loguearse con el usuario y crear lo siguiente):
--Secuencias:
--Crear 2 secuencias:
--DELITOS_SEQ: Deberá comenzar en 100 y tener un valor máximo de 200 con incrementos de 1.
CREATE SEQUENCE DELITOS_SEQ  
START WITH 100
MAXVALUE 200 
INCREMENT BY 1 
NOCYCLE;
--CAPTURAS_SEQ:  Deberá comenzar en 1000 y tener un valor máximo de 2000 con incrementos de 1.
CREATE SEQUENCE CAPTURAS_SEQ  
START WITH 1000
MAXVALUE 2000 
INCREMENT BY 1
NOCYCLE;

--Tablas:
--Las tablas deberán tener su propio ID integer autoincremental y deberán crearse todas las claves foráneas a que hubiere lugar. 
--Los campos numéricos son de tipo INTEGER y los de texto VARCHAR2(255)
--DELITOS: ID, NOMBRE
--CAPTURAS: ID, FECHA, DEPARTAMENTO, MUNICIPIO, DIA, BARRIO, ZONA, 
--CLASE_SITIO, EDAD, SEXO, ESTADO CIVIL, CLASE_EMPLEADO, PROFESION, ESCOLARIDAD, DELITO_ID (Clave foránea)
CREATE TABLE DELITOS(
ID INTEGER PRIMARY KEY,
NOMBRE VARCHAR2(255)
);

CREATE TABLE CAPTURAS(
ID INTEGER PRIMARY KEY, 
FECHA DATE, 
DEPARTAMENTO VARCHAR2(255), 
MUNICIPIO VARCHAR2(255), 
DIA VARCHAR2(255), 
BARRIO VARCHAR2(255), 
ZONA VARCHAR2(255), 
CLASE_SITIO VARCHAR2(255), 
EDAD INTEGER, 
SEXO VARCHAR2(255), 
ESTADO_CIVIL VARCHAR2(255), 
CLASE_EMPLEADO VARCHAR2(255), 
PROFESION INTEGER, 
ESCOLARIDAD INTEGER, 
DELITO_ID INTEGER 
);

ALTER TABLE CAPTURAS ADD CONSTRAINT DELITO_FK FOREIGN KEY(DELITO_ID) REFERENCES DELITOS(ID);
