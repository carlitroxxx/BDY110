insert into marca (id_marca, nombre_marca) values (1,'Scania');
insert into marca (id_marca, nombre_marca) values (2,'Man');
insert into marca (id_marca, nombre_marca) values (3,'Mercedes Benz');


insert into tipo_camion values ('1', 'CAMION CARGA');
insert into tipo_camion values ('2', 'CAMION REFRIGERADO');
insert into tipo_camion values ('3', 'CAMION PLATAFORMA');


insert into comuna values(1,'PUERTO MONTT');
insert into comuna values(2,'OSORNO');
insert into comuna values(3,'TEMUCO');

select * from marca;
select * from COMUNA;
select * from tipo_camion;


delete from comuna where id_comuna =3;

select * from estado_civil;

create sequence seq_civil
    increment by 5
        start with 10;
        
/*drop sequence seq_civil*/
select seq_civil.nextval from dual;
select seq_civil.currval from dual;
insert into estado_civil values(seq_civil.nextval,'Soltero');
/*
Crear secuencia para tipo de salud
*/
