create table eliminados(
id_eli int (1) not null primary key,
nom_eli varchar(20)
)engine=innodb;


create table isbn(
id_isb int (10) not null auto_increment Primary Key,
nom_isb varchar(17) not null,
eli_isb int (1) not null,
foreign key (eli_isb) references eliminados(id_eli) on delete cascade
)engine=innodb;


create table idiomas(
id_idi int(3) not null auto_increment primary key,
nom_idi varchar(20) not null,
eli_idi int (1) not null,
foreign key (eli_idi) references eliminados(id_eli) on delete cascade
)engine=innodb;

create table estados(
id_est int(2) not null primary key,
nom_est varchar(20) not null,
eli_est int (1) not null,
foreign key (eli_est) references eliminados(id_eli) on delete cascade
)engine=innodb;

create table multas(
id_mul int(2) not null primary key,
dia_mul int(3) not null,
cos_mul int(10) not null,
eli_mul int (1) not null,
foreign key (eli_mul) references eliminados(id_eli) on delete cascade
)engine=innodb;

create table areas(
id_are int(3) not null auto_increment primary key,
nom_are varchar (30) not null,
eli_are int (1) not null,
foreign key (eli_are) references eliminados(id_eli) on delete cascade
)engine=innodb;

create table paises(
id_pai int(3) not null auto_increment primary key,
nom_pai varchar(20) not null,
eli_pai int (1) not null,
foreign key (eli_pai) references eliminados(id_eli) on delete cascade
)engine=innodb;

create table metodos(
id_met int(2) not null auto_increment primary key,
nom_met varchar(20) not null,
eli_met int (1) not null,
foreign key (eli_met) references eliminados(id_eli) on delete cascade
)engine=innodb;


create table categorias(
id_cat int(3) not null  auto_increment primary key,
nom_cat varchar(30) not null,
are_cat int(3) not null,
eli_cat int (1) not null,
foreign key (eli_cat) references eliminados(id_eli) on delete cascade,
foreign key (are_cat) references areas(id_are) on delete cascade
)engine=innodb;

create table autores(
id_aut int(5) not null auto_increment primary key,
nom_aut varchar(30) not null,
app_aut varchar(30) not null,
apm_aut varchar(30),
eli_aut int (1) not null,
foreign key (eli_aut) references eliminados(id_eli) on delete cascade
)engine=innodb;

create table editoriales(
id_edi int(3) not null auto_increment primary key,
nom_edi varchar (30) not null,
pai_edi int(3) not null,
eli_edi int (1),
foreign key (eli_edi) references eliminados(id_eli) on delete cascade,
foreign key (pai_edi) references paises(id_pai) on delete cascade
)engine=innodb;

create table distribuidores(
rut_dis varchar(12) not null  primary key,
nom_dis varchar(30) not null,
an_dis int(4) not null,
dir_dis varchar(60) not null,
tel_dis varchar(15) not null,
eli_dis int (1) not null,
foreign key (eli_dis) references eliminados(id_eli) on delete cascade
)engine=innodb;

create table libros(
ser_lib varchar(10) not null  primary key,
isb_lib int(10) not null,
tit_lib varchar(60) not null,
pag_lib int(4) not null,
pre_lib int(6) not null,
an_lib int(4) not null,
edi_lib int(3) not null,
est_lib int(2) not null,
eli_lib int (1) not null,
foreign key (isb_lib) references isbn(id_isb) on delete cascade,
foreign key (eli_lib) references eliminados(id_eli) on delete cascade,
foreign key (edi_lib) references editoriales(id_edi) on delete cascade,
foreign key (est_lib) references estados(id_est) on delete cascade
)engine=innodb;

create table trabajadores(
id_tra int(10) not null auto_increment primary key,
rut_tra varchar(12) not null,
nom_tra varchar(30) not null,
app_tra varchar(30) not null,
apm_tra varchar(30),
con_tra char(10) not null,
usu_tra varchar (10) not null,
pas_tra varchar (50) not null,
dia_tra varchar (2),
mes_tra varchar (2),
ani_tra varchar (4),
eli_tra int (1) not null,
foreign key (eli_tra) references eliminados(id_eli) on delete cascade
)engine=innodb;

create table clientes(
id_cli int(10) not null auto_increment primary key,
rut_cli varchar(12) not null,
nom_cli varchar(30) not null,
app_cli varchar (30) not null,
apm_cli varchar (30),
nac_cli char(10) not null,
dia_cli varchar(2),
mes_cli varchar(2),
ani_cli varchar(4),
eli_cli int (1) not null,
foreign key (eli_cli) references eliminados(id_eli) on delete cascade
)engine=innodb;


create table telefonoTrabajadores(
id_ttra int(10) not null auto_increment primary key,
num_ttra varchar(15) not null,
tra_ttra int(10) not null,
eli_ttra int (1) not null,
foreign key (tra_ttra) references trabajadores(id_tra) on delete cascade,
foreign key (eli_ttra) references eliminados(id_eli) on delete cascade
)engine=innodb;


create table telefonoClientes(
id_tcli int(10) not null auto_increment primary key,
num_tcli varchar(15) not null,
cli_tcli int(10) not null,
eli_tcli int (1) not null,
foreign key (cli_tcli) references clientes(id_cli) on delete cascade,
foreign key (eli_tcli) references eliminados(id_eli) on delete cascade
)engine=innodb;


create table direccionTrabajadores(
id_dtra int(10) not null auto_increment primary key,
nom_dtra varchar(80) not null,
tra_dtra int(10) not null,
eli_dtra int (1) not null,
foreign key (tra_dtra) references trabajadores(id_tra) on delete cascade,
foreign key (eli_dtra) references eliminados(id_eli) on delete cascade
)engine=innodb;


create table direccionClientes(
id_dcli int(10) not null auto_increment primary key,
nom_dcli varchar(80) not null,
cli_dcli int(10) not null,
eli_dcli int (1) not null,
foreign key (cli_dcli) references clientes(id_cli) on delete cascade,
foreign key (eli_dcli) references eliminados(id_eli) on delete cascade
)engine=innodb;

create table correoTrabajadores(
id_ctra  int(10) not null auto_increment primary key,
nom_ctra  varchar(40) not null,
eli_ctra  int (1) not null,
tra_ctra int(10) not null,
foreign key (tra_ctra) references trabajadores(id_tra) on delete cascade,
foreign key (eli_ctra) references eliminados(id_eli) on delete cascade
)engine=innodb;


create table correoClientes(
id_ccli  int(10) not null auto_increment primary key,
nom_ccli varchar(40) not null,
eli_ccli int (1) not null,
cli_ccli int(10) not null,
foreign key (cli_ccli) references clientes(id_cli) on delete cascade,
foreign key (eli_ccli) references eliminados(id_eli) on delete cascade
)engine=innodb;

create table arriendos(
id_arr int(10) not null auto_increment primary key,
tot_arr int(6) not null,
fec_arr char(10) not null,
dev_arr char(10) not null,
ent_arr char(10) not null,
ret_arr int(4) not null,
cos_arr int(6) not null,
lib_arr varchar(10) not null,
tra_arr int(10) not null,
cli_arr int(10) not null,
mul_arr int(2) not null,
met_arr int(2) not null,
eli_arr int (1) not null,
foreign key (eli_arr) references eliminados(id_eli) on delete cascade,
foreign key (lib_arr) references libros(ser_lib) on delete cascade,
foreign key (tra_arr) references trabajadores(id_tra) on delete cascade,
foreign key (mul_arr) references multas(id_mul) on delete cascade,
foreign key (cli_arr) references clientes(id_cli)  on delete cascade,
foreign key (met_arr) references metodos(id_met)  on delete cascade
)engine=innodb;

create table facturas(
fol_fac int(19) not null primary key,
net_fac int(8) not null,
iva_fac int(8) not null,
tot_fac int(8) not null,
fec_fac char(10) not null,
hor_fac varchar(8) not null,
met_fac int(2) not null,
dis_fac varchar (12) not null,
tra_fac int(10) not null,
eli_fac int (1) not null,
foreign key (eli_fac) references eliminados(id_eli) on delete cascade,
foreign key (met_fac) references metodos(id_met) on delete cascade,
foreign key (tra_fac) references trabajadores(id_tra) on delete cascade,
foreign key (dis_fac) references distribuidores(rut_dis)  on delete cascade
)engine=innodb;

create table boletas(
id_bol int(10) not null auto_increment primary key,
fol_bol int(19) not null,
net_bol int(8) not null,
iva_bol int(8) not null,
tot_bol int(8) not null,
fec_bol char(10) not null,
hor_bol varchar(8) not null,
met_bol int(2) not null,
cli_bol int (10) not null,
lib_bol varchar(10) not null,
tra_bol int(10) not null,
eli_bol int (1) not null,
foreign key (eli_bol) references eliminados(id_eli) on delete cascade,
foreign key (cli_bol) references clientes(id_cli) on delete cascade,
foreign key (lib_bol) references libros(ser_lib) on delete cascade,
foreign key (tra_bol) references trabajadores(id_tra) on delete cascade,
foreign key (met_bol) references metodos(id_met)  on delete cascade
)engine=innodb;

create table compras(
id_com int(10) not null auto_increment primary key,
lib_com varchar(10) not null,
fac_com int(10) not null,
eli_com int (1) not null,
foreign key (eli_com) references eliminados(id_eli) on delete cascade,
foreign key (lib_com) references libros(ser_lib) on delete cascade,
foreign key (fac_com) references facturas(fol_fac) on delete cascade
)engine=innodb;

create table ventas(
id_ven int(10) not null auto_increment primary key,
lib_ven varchar(10) not null,
tra_ven int(10) not null,
cli_ven int(10) not null,
bol_ven int(10) not null,
eli_ven int (1) not null,
foreign key (eli_ven) references eliminados(id_eli) on delete cascade,
foreign key (tra_ven) references trabajadores(id_tra) on delete cascade,
foreign key (cli_ven) references clientes(id_cli) on delete cascade,
foreign key (bol_ven) references boletas(id_bol) on delete cascade,
foreign key (lib_ven) references libros(ser_lib) on delete cascade
)engine=innodb;

create table nub1(
id_nub1 int (10) not null auto_increment primary key,
nub1_lib varchar(10),
nub1_cat int(3),
foreign key (nub1_lib) references libros(ser_lib) on delete cascade,
foreign key (nub1_cat) references categorias(id_cat) on delete cascade
)engine=innodb;

create table nub2(
id_nub2 int(10) not null auto_increment primary key,
nub2_aut int (5),
nub2_lib varchar(10),
foreign key (nub2_aut) references autores(id_aut) on delete cascade,
foreign key (nub2_lib) references libros(ser_lib) on delete cascade
)engine=innodb;

create table nub3(
id_nub3 int(10) not null auto_increment primary key,
nub3_idi int (3),
nub3_lib varchar(10),
foreign key (nub3_idi) references idiomas(id_idi) on delete cascade,
foreign key (nub3_lib) references libros(ser_lib) on delete cascade
)engine=innodb;



insert into eliminados values(1,"Existe");
insert into eliminados values(0,"Eliminado");

insert into idiomas values (1,"Español",1);

insert into paises values (401,"España",1);

insert into editoriales values(1,"Barco de Vapor",401,1);
insert into editoriales values(2,"Altaria",401,1);

insert into areas values(301,"Programacion",1);
insert into areas values(302,"Base de Datos",1);

insert into categorias values(1,"Java",301,1);
insert into categorias values(2,"MySQL",302,1);

insert into idiomas values(102,"Ingles",1);

insert into areas values(null,"Sistemas de Información",1);
insert into areas values(null,"Conectividad y Redes",1);
insert into areas values(null,"Mantenimiento de Hardware",1);

insert into autores values(null,"Ismael","Lopez","Quintero",1);
insert into autores values(null,"Gabriel","García","Márquez",1);

insert into trabajadores values(null,"16.736.453-8","Pablo","Morales","Troncoso",'14/03/2018',"admin","123456",'14','03','2018',1);
insert into trabajadores values(null,"22.222.222-2","María Paz","Álvarez","Nobizelli",'05/10/2017',1,1,'05','10','2017',1);


insert into estados values (1,"Disponible",1);
insert into estados values (2,"Arrendado",1);
insert into estados values (3,"Vendido",1);

insert into clientes values (null,'33.333.333-3','Carlos','González','Ramírez','10/06/2001','10','06','2001',1);

insert into isbn values (null,"DSEW-ERW3-WQ2",1);

insert into libros values ("AJ45HS",1,"Programando en Java",437,30500,2015,1,1,1);

insert into nub1 values (null,"AJ45HS",1);
insert into nub2 values (null,1,"AJ45HS");
insert into nub3 values (null,1,"AJ45HS");
