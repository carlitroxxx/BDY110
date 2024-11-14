/*INSERT DE DATOS CON SECUENCIA PARA TIPO_SALUD*/
create sequence seq_tiposalud
increment by 1 start with 100;
select seq_tiposalud.currval from dual;
insert into tipo_salud values(seq_tiposalud.nextval,'isapre',7);
insert into tipo_salud values(seq_tiposalud.nextval,'fonasa',7);
insert into tipo_salud values(seq_tiposalud.nextval,'otros',3);
/*INSERT DE DATOS CON SECUENCIA PARA TIPO_CLIENTE*/
create sequence seq_tipocliente
increment by 1 start with 1;
select seq_tipocliente.currval from dual;
insert into tipo_cliente values(seq_tipocliente.nextval,'Transporte');
insert into tipo_cliente values(seq_tipocliente.nextval,'Comercio');
insert into tipo_cliente values(seq_tipocliente.nextval,'Construccion');
/*INSERT EMPLEADO*/
insert into empleado values(12345678,'9','Perez','Gonzalez','Juan','Carlos','Av. Los notros','M',
987654321,22445566,TO_DATE('1985-07-12','YYYY-MM-DD'),TO_DATE('2010-03-15','YYYY-MM-DD'),750000,1,102,25);
insert into empleado values(23456789,'k','Perez','Martinez','Kat','Andrea','Psje. Chipetiao','F',
987423423,22343456,TO_DATE('1996-11-22','YYYY-MM-DD'),TO_DATE('2016-03-11','YYYY-MM-DD'),800000,2,101,15);
insert into empleado values(43456754,'2','Ramirez','Sanchez','Ramon','Javier','Av. Los carewawa','M',
982355741,22875316,TO_DATE('1999-03-10','YYYY-MM-DD'),TO_DATE('2018-01-20','YYYY-MM-DD'),950000,1,103,15);
/*INSERT CAMION*/
insert into camion values('FDPL23','BLANCO','V6', 2015, 150000, 50000, '1',23456789, 1);
insert into camion values('CD5678', 'NEGRO', 'V8', 2018, 180000, 60000, '2', 12345678, 2);
insert into camion values('EF9101', 'ROJO', 'V6', 2020, 200000, 70000, '3', 43456754, 3);
/*INSERT CLIENTE*/