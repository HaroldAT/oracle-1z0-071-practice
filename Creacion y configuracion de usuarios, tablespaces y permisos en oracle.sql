-- *Creaci�n y Configuraci�n de Usuarios, Tablespaces y Permisos en Oracle* --

--CREATE USER CLINICA_VETERINARIA: Crea un nuevo usuario en la base de datos con el nombre CLINICA_VETERINARIA para identificarlo de manera �nica.\
--IDENTIFIED BY clinica_veterinaria: Asigna la contrase�a clinica_veterinaria al usuario para autenticarse al acceder a la base de datos.
--DEFAULT TABLESPACE USERS: Define USERS como el espacio de almacenamiento predeterminado para los objetos creados por este usuario.
--TEMPORARY TABLESPACE TEMP: Especifica TEMP como el espacio de almacenamiento temporal para operaciones que requieren memoria temporal.
--ACCOUNT UNLOCK: Deja la cuenta del usuario desbloqueada, permitiendo su acceso inmediato a la base de datos.

CREATE USER CLINICA_VETERINARIA IDENTIFIED BY clinica_veterinaria DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP ACCOUNT UNLOCK;

-- CON ESTA CONSULTA PODEMOS VER LOS DIFERENTE TABLE SPACES QUE ORACLE CREA CUANDO SE INSTALA
SELECT *
FROM DBA_TABLESPACES;

-- Muestra todos los archivos de la base de datos, como su ubicaci�n, tama�o y tablespace asociado.
SELECT * 
FROM DBA_DATA_FILES;

-- Este comando GRANT en Oracle asigna dos roles predefinidos al usuario CLINICA_VETERINARIA:
 
-- CONNECT: Permite al usuario conectarse a la base de datos y realizar operaciones b�sicas, como consultas.
-- RESOURCE: Otorga permisos para crear y gestionar objetos en la base de datos, como tablas, �ndices y procedimientos.
GRANT CONNECT, RESOURCE TO CLINICA_VETERINARIA;

-- GRANT PERMITE AGREGAR PRIVILEGIOS Y REVOKE PERMITE REVOCAR ESTOS PRIVILEGIOS. ESTOS PERTENECEN AL LENGUAJE DCL: DATA CONTROL LANGUAGE
-- CREATE TABLE: Permite crear tablas en el esquema del usuario.
-- CREATE ANY INDEX: Permite crear �ndices en cualquier esquema de la base de datos.
-- CREATE SYNONYM: Permite crear sin�nimos privados (v�lidos solo para el usuario).
-- CREATE PUBLIC SYNONYM: Permite crear sin�nimos p�blicos (visibles para todos los usuarios).
-- CREATE VIEW: Permite crear vistas en el esquema del usuario.
-- CREATE SEQUENCE: Permite crear secuencias (objetos para generar valores num�ricos �nicos).

GRANT CREATE TABLE, CREATE ANY INDEX, CREATE SYNONYM, CREATE PUBLIC SYNONYM, 
CREATE VIEW, CREATE SEQUENCE TO CLINICA_VETERINARIA; 

-- Otorga al usuario CLINICA_VETERINARIA acceso ilimitado a todos los tablespaces sin restricciones de espacio.
GRANT UNLIMITED TABLESPACE TO CLINICA_VETERINARIA;