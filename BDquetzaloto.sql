CREATE DATABASE [PaquetesQuetzal2]
go
use PaquetesQuetzal2

CREATE TABLE Cliente(
Cod_Cliente int identity not null Primary key,
Nombre_Cliente varchar(50)not null,
Apellido_Cliente varchar (50)not null,
Nit_Cliente int not null,
Telefono_Cliente int not null,
Direccion_Cliente varchar (50)not null,
Username_Cliente varchar(50) not null,
Password_Cliente varchar(25) not null,
)
go

Create table estado(
Cod_Estado int not null,
Descripcion_Estado varchar not null,
primary key(Cod_Estado),
)

CREATE TABLE Factura(
Cod_Factura int not null Primary key,
No_Factura int not null,
Descripcion_Factura varchar(50)not null,
Precio_Impuestos int not null,
Precio_Servicios int not null,
Total int not null,
fecha int not null,
hora int not null,
Cod_Client int not null,
)
alter table Factura add CONSTRAINT FK_Factura_Cod_Client FOREIGN KEY(Cod_Client)REFERENCES Cliente(Cod_Cliente)
go


CREATE TABLE Pago(
Cod_Pago int not null primary key,
Cod_Client int not null,

)
alter table Pago add CONSTRAINT FK_Pago_Cod_Client FOREIGN KEY(Cod_Client)REFERENCES Cliente(Cod_Cliente)
go


CREATE TABLE Tarjeta(
Cod_Tarjeta int identity not null Primary key,
No_Tarjeta int not null,
Banco_Tarjeta  varchar(50)not null,
Tipo varchar(50) not null,
Cod_Client int not null,
)

alter table Tarjeta add CONSTRAINT FK_Tarjeta_Cod_Client FOREIGN KEY (Cod_Client) REFERENCES Cliente(Cod_Cliente)
go
Create Table Sede(
Cod_Sede int not null,
Nombre_Sede varchar(50) not null,
Pais_Sede varchar(50)not null,
Primary key(Cod_Sede),
)

go
CREATE TABLE Sucursal(
Cod_Sucursal int identity not null Primary key,
Pais_Sucursal varchar(50)not null,
Direccion_Sucursal varchar (50)not null,
Telefono_Sucursal varchar(50)not null,
Capacidad_Maxima int not null,
Cod_Sed int not null,
)
alter table Sucursal add CONSTRAINT FK_Sucursal_Cod_Sed FOREIGN KEY(Cod_Sed) REFERENCES Sede(Cod_Sede)
go
Create table Lote(
Cod_Lote int not null,
No_Lote int not null,
Cod_Esta int not null,
Cod_Sucur int not null,
primary key(Cod_Lote),
)
alter table Lote add CONSTRAINT FK_Lote_Cod_Esta FOREIGN KEY (Cod_Esta)REFERENCES Estado(Cod_Estado)
alter table Lote add CONSTRAINT FK_Lote_Cod_Sucur FOREIGN KEY (Cod_Sucur)REFERENCES Sucursal(Cod_Sucursal)



go
CREATE TABLE Paquete(
Cod_Paquete int not null Primary key,
clasificacion_Paquete varchar (50)not null,
Descripcion_Paquete varchar (50)not null,
Peso_Paquete int not null,
Cod_Client int not null,
Cod_Lot int not null,

)
alter Table Paquete add CONSTRAINT FK_Paquete_Cod_Client FOREIGN KEY (Cod_Client) REFERENCES Cliente(Cod_Cliente)
alter table Paquete add CONSTRAINT FK_Paquete_Cod_Lot FOREIGN KEY(Cod_Lot) REFERENCES Lote(cod_Lote)


go




CREATE TABLE Departamento(
Cod_Departamento int not null Primary key,
Nombre_Departamento varchar(50) not null,
Cod_Sucur int not null,
)
alter table Departamento add CONSTRAINT FK_Departamento_Cod_Sucur FOREIGN KEY (Cod_Sucur) REFERENCES Sucursal(Cod_Sucursal)
go

Create table Empleado(
Cod_Empleado int identity not null primary key,
No_identificacion int not null,
Nombre_Empleado varchar(50) not null,
Apellido_Empleado varchar(50) not null, 
Telefono_Empleado int null,
Direccion_Empleado varchar(50)not null,
Salario_Empleado int null,
rol_Empleado varchar(25) not null,
Cod_Depto int  not null,
)
alter table Empleado add CONSTRAINT fk_Empleado_Cod_Depto FOREIGN KEY (cod_Depto) REFERENCES Departamento(Cod_Departamento)
go

