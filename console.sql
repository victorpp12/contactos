CREATE TABLE usuarios (
  ID_U NUMBER(20)
    CONSTRAINT usuarios_PK PRIMARY KEY,
  USUARIO VARCHAR2(30)
    CONSTRAINT usuarios_UK1 UNIQUE
    CONSTRAINT usuarios_NN1 NOT NULL,
  E_MAIL VARCHAR2(60)
    CONSTRAINT usuarios_UK2 UNIQUE
    CONSTRAINT usuarios_NN2 NOT NULL,
  NOMBRE VARCHAR2(30)
    CONSTRAINT usuarios_NN3 NOT NULL,
  APELLIDO1 VARCHAR2(30)
    CONSTRAINT usuarios_NN4 NOT NULL,
  APELLIDO2 VARCHAR2(30),
  PASSW VARCHAR2(100)
    CONSTRAINT usuarios_NN5 NOT NULL
);

CREATE TABLE contactos (
ID_U NUMBER(20),
contacto NUMBER(20),
CONSTRAINT contacto_PK PRIMARY KEY (id_u,contacto),
CONSTRAINT contacto_FK1 FOREIGN KEY (ID_U) REFERENCES usuarios ON DELETE CASCADE,
CONSTRAINT contacto_FK2 FOREIGN KEY (CONTACTO) REFERENCES usuarios(ID_U) ON DELETE CASCADE
);
CREATE TABLE post
(
  pid number(20) CONSTRAINT post_pk PRIMARY KEY,
  texto  VARCHAR2(1000) CONSTRAINT POST_NN1 NOT NULL,
  publicacion DATE CONSTRAINT post_ck1 CHECK(PUBLICACION>TO_DATE('02/02/2017','dd/mm/yyyy'))
    CONSTRAINT post_nn3 NOT NULL,
  duracion   INTERVAL DAY TO SECOND
    CONSTRAINT POST_NN4 NOT NULL,
  id_u  NUMBER(20)CONSTRAINT POST_NN2 NOT NULL
                  CONSTRAINT POST_FK1 REFERENCES USUARIOS ON DELETE CASCADE,
  pid_rel NUMBER(20)CONSTRAINT POST_FK2 REFERENCES POST
);
CREATE TABLE ser_visible
(
  id_u  NUMBER(20),
  contacto NUMBER(20),
  pid      NUMBER(20),
  CONSTRAINT ser_visible_pk PRIMARY KEY (id_u, contacto, pid),
  CONSTRAINT ser_visible_fk1 FOREIGN KEY (id_u, contacto) REFERENCES contactos (id_u, contacto),
  CONSTRAINT ser_visible_fk2 FOREIGN KEY (pid) REFERENCES post ON DELETE CASCADE
);
INSERT INTO usuarios(id_u,nombre,apellido1,apellido2,usuario,e_mail)
values (1,'Ramón','García','Ortizal','ramongar','ramon@hotmail.com');
INSERT INTO usuarios(id_u,nombre,apellido1,usuario,e_mail)
values (2,'Lourdes','Atienza','lurdita','lurdita@bbc.co.uk');
INSERT INTO usuarios(id_u,nombre,apellido1,apellido2,usuario,e_mail)
values (3,'Marisol','Jiménez','del Oso','marioso','marioso19@yahoo.com');
INSERT INTO usuarios(id_u,nombre,apellido1,apellido2,usuario,e_mail)
values (4,'Francisco','Serrano','Calvo','sercal','sercal1980@gmail.com');
COMMIT;
UPDATE usuarios SET PASSW=12345;
UPDATE usuarios SET E_MAIL=superlourdes@gmail.com where E_MAIL=lurdita@bbc.co.uk;
delete from usuarios
where nombre=ramon;

