create database ss_db;
use ss_sb;

create table categoria(
  cat_id int not null auto_increment,
  cat_nombre varchar(100) not null,
  cat_desc text,
  condicion boolean default=1,
  primary key(cat_id)
) ENGINE = InnoDB;


create table articulo (
  art_id int not null auto_increment,
  art_cat_id int not null,
  art_codigo varchar(50) not null,
  art_nombre varchar(100) not null,
  art_stock int not null,
  art_desc text,
  art_imagen varchar(50),
  art_estado varchar(20),
  primary key(prod_id)
) ENGINE = InnoDB;

create table ingreso(
  ing_id int not null auto_increment,
  ing_prov_id int not null,
  ing_tipoComprobante varchar(20) not null,
  ing_serieComprobante varchar(7),
  ing_numComprobante varchar(10) not null,
  ing_fechaHora datetime not null,
  ing_impuesto decimal(4,2),
  ing_estado varchar(20),
  primary key (ing_id)
) ENGINE = InnoDB;


create table venta(
  ven_id int not null auto_increment,
  ven_cli_id int not null,
  ven_user_id int not null,
  ven_tipoComprobante varchar(20) not null,
  ven_serieComprobante varchar(7),
  ven_numComprobante varchar(10) not null,
  ven_fechaHora datetime not null,
  ven_impuesto decimal(4,2) not null,
  ven_total decimal(11,2) not null,
  primary key (ven_id) 
) ENGINE = InnoDB;

create table detalle_venta(
  dv_id int not null auto_increment,
  dv_ven_id int not null,
  dv_art_id int not null,
  dv_cantidad int not null,
  dv_precioVenta decimal(11,2) not null,
  dv_descuento decimal(11,2) not null,
  primary key (dv_id)
)ENGINE = InnoDB;

create table detalle_ingreso(
  di_id int not null auto_increment,
  di_ing_id int not null,
  di_art_id int not null,
  di_cantidad int not null,
  di_precioCompra decimal(11,2) not null,
  di_precioVenta decimal(11,2) not null,
  primary key(di_id)
)ENGINE = InnoDB;


create table persona (
  per_id int not null auto_increment,
  per_tp_id int not null,
  per_nombre varchar(50) not null,
  per_tipoDocumento varchar(20) not null,
  per_numDocumento varchar(15) not null,
  per_direccion varchar(256),
  per_telefono varchar (15),
  per_email varchar(256),
  primary key(per_id)
)ENGINE = InnoDB;

create table tipo_persona(
  tp_id int not null auto_increment,
  tp_nombre varchar(100) not null,
  tp_desc text,
  tp_estado boolean,
  primary key(tp_id)
)ENGINE = InnoDB;

create table usuario(
  user_id int not null auto_increment,
  user_per_id int not null not null,
  user_usuario varchar(30) not null,
  user_clave varchar,
  user_estado boolean,
  primary key(user_id)
)ENGINE = InnoDB;