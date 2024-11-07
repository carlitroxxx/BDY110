CREATE TABLE arriendo_camion (
    id_arriendo        NUMBER(7) NOT NULL,
    nro_patente        VARCHAR2(6) NOT NULL,
    numrun_cli         NUMBER(10) NOT NULL,
    fecha_ini_arriendo DATE,
    dias_solicitados   NUMBER(6),
    fecha_devolucion   DATE);

ALTER TABLE arriendo_camion ADD CONSTRAINT pk_arriendo_camion PRIMARY KEY ( id_arriendo );

CREATE TABLE camion (
    nro_patente        VARCHAR2(6),
    color              VARCHAR2(15) NOT NULL,
    motor              VARCHAR2(5) NOT NULL,
    anio               NUMBER(4),
    valor_arriendo_dia NUMBER(7) NOT NULL,
    valor_garantia_dia NUMBER(6),
    id_tipo_camion     VARCHAR2(1) NOT NULL,
    numrun_emp         NUMBER(10),
    id_marca           NUMBER(2) NOT NULL
);

CREATE TABLE cliente (
    numrun_cli      NUMBER(10) NOT NULL,
    dvrun_cli       VARCHAR2(1) NOT NULL,
    appaterno_cli   VARCHAR2(30) NOT NULL,
    apmaterno_cli   VARCHAR2(30) NOT NULL,
    pnombre_cli     VARCHAR2(30) NOT NULL,
    snombre_cli     VARCHAR2(30),
    direccion       VARCHAR2(60) NOT NULL,
    celular_cli     NUMBER(15),
    fono_fijo_cli   NUMBER(15),
    renta           NUMBER(7) NOT NULL,
    fecha_nac_cli   DATE,
    id_comuna       NUMBER(3),
    id_tipo_cli     VARCHAR2(1) NOT NULL,
    id_estado_civil NUMBER(2) NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT pk_cliente PRIMARY KEY ( numrun_cli );

CREATE TABLE comuna (
    id_comuna     NUMBER(3) NOT NULL,
    nombre_comuna VARCHAR2(30) NOT NULL
);

ALTER TABLE comuna ADD CONSTRAINT pk_comuna PRIMARY KEY ( id_comuna );

ALTER TABLE comuna ADD CONSTRAINT un_comuna_nomcomuna UNIQUE ( nombre_comuna );

CREATE TABLE empleado (
    numrun_emp      NUMBER(10),
    dvrun_emp       VARCHAR2(1) NOT NULL,
    appaterno_emp   VARCHAR2(30) NOT NULL,
    apmaterno_emp   VARCHAR2(30) NOT NULL,
    pnombre_emp     VARCHAR2(25),
    snombre_emp     VARCHAR2(25) NOT NULL,
    direccion_emp   VARCHAR2(60) NOT NULL,
    sexo            CHAR(1) NOT NULL,
    celular_emp     NUMBER(15),
    fono_fijo_emp   NUMBER(15),
    fecha_nac       DATE NOT NULL,
    fecha_contrato  DATE NOT NULL,
    sueldo_base     NUMBER(7) NOT NULL,
    id_comuna       NUMBER(3),
    id_tipo_sal     VARCHAR2(3) NOT NULL,
    id_estado_civil NUMBER(2) NOT NULL
);

CREATE TABLE estado_civil (
    id_estado_civil     NUMBER(2) NOT NULL,
    nombre_estado_civil VARCHAR2(25) NOT NULL
);

ALTER TABLE estado_civil ADD CONSTRAINT estado_civil_pk PRIMARY KEY ( id_estado_civil );

CREATE TABLE marca (
    id_marca     NUMBER(2) NOT NULL,
    nombre_marca VARCHAR2(20) NOT NULL
);

ALTER TABLE marca ADD CONSTRAINT pk_marca PRIMARY KEY ( id_marca );

CREATE TABLE tipo_camion (
    id_tipo_camion     VARCHAR2(1) NOT NULL,
    nombre_tipo_camion VARCHAR2(40) NOT NULL
);

ALTER TABLE tipo_camion ADD CONSTRAINT pk_tipo_camion PRIMARY KEY ( id_tipo_camion );

CREATE TABLE tipo_cliente (
    id_tipo_cli     VARCHAR2(1) NOT NULL,
    nombre_tipo_cli VARCHAR2(15) NOT NULL
);

ALTER TABLE tipo_cliente ADD CONSTRAINT pk_tipo_cliente PRIMARY KEY ( id_tipo_cli );

CREATE TABLE tipo_salud (
    id_tipo_sal VARCHAR2(3) NOT NULL,
    descripcion VARCHAR2(100) NOT NULL,
    pct_sueldo  NUMBER(3, 1) NOT NULL
);

ALTER TABLE tipo_salud ADD CONSTRAINT pk_tipo_salud PRIMARY KEY ( id_tipo_sal );

ALTER TABLE arriendo_camion
    ADD CONSTRAINT fk_arriendocamion_cliente FOREIGN KEY ( numrun_cli )
        REFERENCES cliente ( numrun_cli );

ALTER TABLE camion
    ADD CONSTRAINT fk_camion_tipo_camion_fk FOREIGN KEY ( id_tipo_camion )
        REFERENCES tipo_camion ( id_tipo_camion );

ALTER TABLE cliente
    ADD CONSTRAINT fk_cliente_tipocliente FOREIGN KEY ( id_tipo_cli )
        REFERENCES tipo_cliente ( id_tipo_cli );

ALTER TABLE empleado
    ADD CONSTRAINT fk_empleado_estado_civil FOREIGN KEY ( id_estado_civil )
        REFERENCES estado_civil ( id_estado_civil );

ALTER TABLE empleado
    ADD CONSTRAINT fk_empleado_tipo_salud FOREIGN KEY ( id_tipo_sal )
        REFERENCES tipo_salud ( id_tipo_sal );
        
/* AGREGAR FORANEAS */        
      
alter table camion
    add constraint fk_camion_marca foreign key (id_marca)
        references marca(id_marca);
alter table cliente
    add constraint fk_cliente_comuna foreign key (id_comuna)
        references comuna(id_comuna);
alter table empleado
    add constraint fk_empleado_comuna foreign key (id_comuna)
        references comuna(id_comuna);
alter table cliente 
    add constraint fk_cliente_estado_civil foreign key (id_estado_civil)
        references estado_civil(id_estado_civil);


