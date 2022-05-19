USE TareaJSON_RaDaVa
GO

-- ELIMINAR

IF OBJECT_ID('Cliente') IS NOT NULL
	DROP TABLE Cliente;

IF OBJECT_ID('Producto') IS NOT NULL
	DROP TABLE Producto;

IF OBJECT_ID('Inventario') IS NOT NULL
	DROP TABLE Inventario;

IF OBJECT_ID('Ventas') IS NOT NULL
	DROP TABLE Ventas;

IF OBJECT_ID('TipoEmpleado') IS NOT NULL
	DROP TABLE TipoEmpleado;

IF OBJECT_ID('Empleados') IS NOT NULL
	DROP TABLE Empleados;

-------------------------------------------------------------

-- TABLAS

CREATE TABLE TipoEmpleado(
	tipoEmId INT PRIMARY KEY IDENTITY(1,1),
	descripcion VARCHAR(40)
);

CREATE TABLE Empleados(
	empleadoId INT PRIMARY KEY IDENTITY(1,1),
	tipoEmId INT, 
	nombre VARCHAR(20),
	apellidos VARCHAR(60),
	correo VARCHAR(40),
	FOREIGN KEY (tipoEmId) REFERENCES TipoEmpleado(tipoEmId)
);

CREATE TABLE Cliente(
	clienteId INT PRIMARY KEY IDENTITY(1,1),
	nombre VARCHAR(20),
	apellidos VARCHAR(60),
	correo VARCHAR(40)
)

CREATE TABLE TipoProducto(
	tipoProId INT PRIMARY KEY IDENTITY(1,1),
	descripcion VARCHAR(40)
);

CREATE TABLE Producto(
	productoId INT PRIMARY KEY IDENTITY(1,1),
	tipoProId INT,
	fabricanteId INT,
	nombre VARCHAR(20),
	caract NVARCHAR(MAX),
	FOREIGN KEY (tipoProId) REFERENCES TipoProducto(tipoProId)
);

CREATE TABLE Ventas(
	ventaId INT PRIMARY KEY IDENTITY(1,1),
	clienteId INT,
	productos NVARCHAR(MAX),
	monto MONEY,
	fecha DATE,
	empleadoId INT,
	FOREIGN KEY (empleadoId) REFERENCES Empleados(empleadoId),
	FOREIGN KEY (clienteId) REFERENCES Cliente(clienteId)
);

CREATE TABLE Inventario(
	invId INT PRIMARY KEY IDENTITY(1,1),
	productoId INT,
	cantidad INT, 
	FOREIGN KEY (productoId) REFERENCES Producto(productoId)
);