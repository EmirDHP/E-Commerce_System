CREATE DATABASE DBCARRITO
GO
USE DBCARRITO
GO

CREATE TABLE CATEGORIA(
IdCategoria INT PRIMARY KEY IDENTITY,
Descripcion VARCHAR(100),
Activo BIT DEFAULT 1,
FechaRegistro DATETIME DEFAULT GETDATE()
)
GO

CREATE TABLE MARCA(
IdMarca INT PRIMARY KEY IDENTITY,
Descripcion VARCHAR(100),
Activo BIT DEFAULT 1,
FechaRegistro DATETIME DEFAULT GETDATE()
)
GO

CREATE TABLE PRODUCTO(
IdProducto INT PRIMARY KEY IDENTITY,
Nombre VARCHAR(500),
Descripcion VARCHAR(500),
IdMarca INT REFERENCES Marca(IdMarca),
IdCategoria INT REFERENCES Categoria(IdCategoria),
Precio DECIMAL(10,2) DEFAULT 0,
Stock INT,
RutaImagen VARCHAR(100),
NombreImagen VARCHAR(100),
Activo BIT DEFAULT 1,
FechaRegistro DATETIME DEFAULT GETDATE()
)
GO

CREATE TABLE CLIENTE(
IdCliente INT PRIMARY KEY IDENTITY,
Nombres VARCHAR(100),
Apellidos VARCHAR(100),
Correo VARCHAR(100),
Clave VARCHAR(150),
Reestablecer BIT DEFAULT 0,
FechaRegistro DATETIME DEFAULT GETDATE()
)
GO

CREATE TABLE CARRITO(
IdCarrito INT PRIMARY KEY IDENTITY,
IdCliente INT REFERENCES CLIENTE(IdCliente),
IdProducto INT REFERENCES PRODUCTO(IdProducto),
Cantidad INT
)
GO

CREATE TABLE VENTA(
IdVenta INT PRIMARY KEY IDENTITY,
IdCliente INT REFERENCES CLIENTE(IdCliente),
ToltalProducto INT,
MontoTotal DECIMAL(10,2),
Contacto VARCHAR(50),
IdDistrito VARCHAR(10),
Telefono VARCHAR(50),
Direccion VARCHAR(500),
IdTransaccion VARCHAR(50),
FechaVenta DATETIME DEFAULT GETDATE()
)
GO

CREATE TABLE DETALLE_VENTA(
IdDetalleVenta INT PRIMARY KEY IDENTITY,
IdVenta INT REFERENCES Venta(IdVenta),
IdProducto INT REFERENCES PRODUCTO(IdProducto),
Cantidad INT,
Total DECIMAL(10,2)
)
GO

CREATE TABLE USUARIO(
IdUsuario INT PRIMARY KEY IDENTITY,
Nombres VARCHAR(100),
Apellidos VARCHAR(100),
Correo VARCHAR(100),
Clave VARCHAR(100),
Reestablecer BIT DEFAULT 1,
Activo BIT DEFAULT 1,
FechaRegistro DATETIME DEFAULT GETDATE()
)
GO

CREATE TABLE DEPARTAMENTE(
IdDepartamento VARCHAR(2) NOT NULL,
Descripcion VARCHAR(45) NOT NULL
)
GO

CREATE TABLE PROVINCIA(
IdProvincia VARCHAR(4) NOT NULL,
Descripcion VARCHAR(45) NOT NULL,
IdDepartamento VARCHAR(2) NOT NULL
)
GO

CREATE TABLE DISTRITO(
IdDistrito VARCHAR(6) NOT NULL,
Descripcion VARCHAR(45) NOT NULL,
IdProvincia VARCHAR(4) NOT NULL,
IdDepartamento VARCHAR(2) NOT NULL
)