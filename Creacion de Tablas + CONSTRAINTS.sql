-- CONSTRAINT: Es una restricción que asegura la integridad, coherencia y validez de los datos almacenados.

-- PRIMARY KEY: Identifica de manera única cada registro en una tabla.
-- FOREIGN KEY: Establece una relación entre tablas, garantizando referencialidad.
-- UNIQUE: Asegura que los valores de una columna sean únicos.
-- NOT NULL: Impide que una columna tenga valores nulos.
-- CHECK: Restringe los valores permitidos en una columna según una condición.
-- DEFAULT: Asigna un valor predeterminado a una columna si no se especifica uno.

CREATE TABLE CLIENTES 
(
 cliente_ID NUMBER (10) 
 CONSTRAINT clientes_id_PK PRIMARY KEY
 , nombre VARCHAR2 (20)
 CONSTRAINT clientes_nombre_NN NOT NULL
 , apellido VARCHAR2 (20)
 CONSTRAINT clientes_apellido_NN NOT NULL
 , direccion VARCHAR2 (255)
 CONSTRAINT clientes_direccion_NN NOT NULL
 , telefono NUMBER (12)
 , correo VARCHAR2 (35)
);

CREATE TABLE MASCOTAS
(
 mascota_ID NUMBER (10)
 CONSTRAINT mascotas_id_PK PRIMARY KEY
 , cliente_ID NUMBER (10)
 CONSTRAINT mascotas_cliente_id REFERENCES clientes(cliente_id)
 , nombre VARCHAR2 (20)
 CONSTRAINT mascotas_nombre_NN NOT NULL
 , especie VARCHAR2 (20)
 , raza VARCHAR2 (20)
 , edad NUMBER (3)
);

CREATE TABLE VETERINARIOS
(
veterinario_id NUMBER (10)
CONSTRAINT veterinarios_id_PK PRIMARY KEY
, nombre VARCHAR2(20)
CONSTRAINT veterinarios_nombre_NN NOT NULL
, apellido VARCHAR(20)
CONSTRAINT veterinarios_apellido_NN NOT NULL
,especialidad VARCHAR(20)
CONSTRAINT veterinarios_especialidad_NN NOT NULL
);

CREATE TABLE CITAS 
(
cita_id NUMBER (10)
CONSTRAINT citas_id_PK PRIMARY KEY
,cliente_id NUMBER(10)
CONSTRAINT citas_cliente_id REFERENCES clientes(cliente_ID)
,mascota_id NUMBER(10)
CONSTRAINT citas_mascotas_id REFERENCES mascotas(mascota_id)
, veterinario_id NUMBER (10)
CONSTRAINT citas_veterinarios_id REFERENCES veterinarios(veterinario_id)
,  fecha_hora TIMESTAMP
CONSTRAINT fecha_hora_NN NOT NULL
, razon_visita VARCHAR2 (255)
CONSTRAINT razon_visita_NN NOT NULL
);

CREATE TABLE INVENTARIO
(
producto_id NUMBER(10) GENERATED ALWAYS AS IDENTITY 
CONSTRAINT inventario_producto_id_PK PRIMARY KEY
, nombre_producto VARCHAR(50)
CONSTRAINT nombre_producto_NN NOT NULL
CONSTRAINT nombre_producto_UQ UNIQUE
,cantidad NUMBER(6)
CONSTRAINT cantidad_NN NOT NULL
, fecha_vencimiento DATE DEFAULT '01-JAN-20'
);

-- S=Sano E=Enfermo, P=Parásitos, I=Infección, D=Desnutrición, T=Traumatismo, A=Alergia C= Enfermedad Crónica

CREATE TABLE HISTORIAL_CLINICO
(
historial_id NUMBER(10) GENERATED ALWAYS AS IDENTITY
CONSTRAINT historial_id_PK PRIMARY KEY
, mascota_id NUMBER(10)
CONSTRAINT historial_clinico_mascota_id REFERENCES mascotas(mascota_id)
, fecha DATE
CONSTRAINT fecha_NN NOT NULL
, diagnostico CHAR
CONSTRAINT diagnostico_CK CHECK (diagnostico IN ('S','E','P','I','D','T','A','C'))
, procedimiento VARCHAR(255)
CONSTRAINT procedimientos_NN NOT NULL
, medicamento VARCHAR(255)
CONSTRAINT medicamento_NN NOT NULL
);