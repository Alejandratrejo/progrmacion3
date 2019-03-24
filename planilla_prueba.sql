create database planilla_prueba;
use planilla_prueba;



drop table if exists concepto;
CREATE TABLE IF NOT EXISTS `concepto` (
  `codigo_concepto` int(11) NOT NULL,
  `nombre_concepto` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `efecto_concepto` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`codigo_concepto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `concepto` (`codigo_concepto`, `nombre_concepto`, `efecto_concepto`) VALUES
(111, 'IGSS', 'resta');


CREATE TABLE IF NOT EXISTS `departamento` (
  `codigo_departamento` int(11) NOT NULL,
  `nombre_departamento` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`codigo_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `departamento` (`codigo_departamento`, `nombre_departamento`) VALUES
(901, 'Ingenieria');


CREATE TABLE IF NOT EXISTS `empleado` (
  `dpi` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nombre_empleado` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `sueldo_empleado` float DEFAULT NULL,
  `codigo_puesto1` int(11) NOT NULL,
  `codigo_departamento1` int(11) NOT NULL,
  PRIMARY KEY (`dpi`),
  KEY `fk_codigo_puesto` (`codigo_puesto1`),
  KEY `fk_codigo_departamento` (`codigo_departamento1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



INSERT INTO `empleado` (`dpi`, `nombre_empleado`, `sueldo_empleado`, `codigo_puesto1`, `codigo_departamento1`) VALUES
('93389237', 'chepe', 100.1, 1, 901);

drop table if exists nomina_encabezado;
CREATE TABLE IF NOT EXISTS nomina_encabezado (
  `codigo_nomina` int NOT NULL,
  `fecha_inicio_nomina` datetime DEFAULT NULL,
  `fecha_fin_nomina` datetime DEFAULT NULL,
  `total_nomina` double DEFAULT NULL,
  codigo_banco1 int not null,
  PRIMARY KEY (`codigo_nomina`),
  constraint fk_codigo_banco1 foreign key(codigo_banco1) references bancos(codigo_banco)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

select * from nomina_encabezado;
delete from nomina_encabezado ; 

INSERT INTO nomina_encabezado VALUES
(101, '2010-01-01 00:00:00', '2015-12-12 00:00:00', 700.00,21);


CREATE TABLE IF NOT EXISTS `puesto` (
  `codigo_puesto` int(11) NOT NULL,
  `nombre_puesto` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`codigo_puesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `puesto` (`codigo_puesto`, `nombre_puesto`) VALUES
(1, 'Jefe');



 drop table if exists registrar_usuario;
 create table registrar_usuario(
 codigo_usuario int not null,
 nombre_usuario varchar(30),
 contraseña_usuario varchar(30),
 estado_usuario char,
 dpi1 varchar(20),
 primary key(codigo_usuario),
 constraint fk_dpi1 foreign key(dpi1) references empleado(dpi)
 )engine=innodb default charset=utf8 collate=utf8_unicode_ci;


insert into planilla_prueba.registrar_usuario values(101,"valeri0","valerio123","t",93389237);


drop table if exists nomina_detalle;
create table if not exists nomina_detalle(
codigo_nomina1 int(11) not null,
dpi2 varchar(20) not null,
codigo_concepto1 int not null,
valor_nomina_detalle float(20),
primary key(codigo_nomina1,dpi2,codigo_concepto1),
constraint fk_codigo_nomina1 foreign key(codigo_nomina1) references nomina_encabezado(codigo_nomina),
constraint fk_dpi2 foreign key (dpi2) references empleado(dpi),
constraint fk_codigo_concepto1 foreign key (codigo_concepto1) references concepto(codigo_concepto)
)engine=innodb default charset=utf8 collate=utf8_unicode_ci;

insert into planilla_prueba.nomina_detalle values(101,"93389237",111,7000.35);

select * from nomina_Detalle;

drop table if exists bancos;
create table if not exists bancos(
codigo_banco int not null,
nombre_banco varchar(30),
cuenta_banco int,
primary key (codigo_banco)
)engine=innodb default charset=utf8 collate=utf8_unicode_ci;

insert into bancos values(21,"banrural",100023);





ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_codigo_puesto` FOREIGN KEY (`codigo_puesto1`) REFERENCES `puesto` (`codigo_puesto`),
  ADD CONSTRAINT `fk_codigo_departamento` FOREIGN KEY (`codigo_departamento1`) REFERENCES `departamento` (`codigo_departamento`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
