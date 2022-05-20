
----------------------------------- Empleados -----------------------------------

INSERT INTO TipoEmpleado(descripcion) VALUES
	('gerente'),
	('cajero'),
	('administrador'),
	('ayudante');

-- SELECT * FROM TipoEmpleado

INSERT INTO Empleados(tipoEmId, nombre, apellidos, correo) VALUES
	(1, 'Valeria', 'Coto',  'vale@gmail.com'),
	(1, 'Daniel', 'Cascante', 'dani@gmail.com'),
	(1, 'Raul', 'Gutierrez', 'raul@gmail.com'),
	(2, 'Valeria', 'Chinchilla', 'valeC@gmail.com'),
	(2, 'Rose', 'Herrera', 'rose@gmail.com'),
	(2, 'Dayana', 'Contreras', 'daya@gmail.com'),
	(3, 'Tatiana', 'Contreras', 'tati@gmail.com'),
	(3, 'Luis', 'Diaz', 'luis@gmail.com'),
	(3, 'Jose', 'Perez', 'jose@gmail.com'),
	(4, 'Alex', 'Jirales', 'alex@gmail.com'),
	(4, 'Alexandra', 'Sandi', 'alexa@gmail.com'),
	(4, 'Juan', 'Robles', 'juan@gmail.com');

-- SELECT * FROM Empleados

----------------------------------- Clientes -----------------------------------

INSERT INTO Cliente(nombre, apellidos, correo) VALUES
	('Allan', 'Arias', 'allanA@gmail.com'),
	('Roberto', 'Carazo', 'roberCar@gmail.com'),
	('Paula', 'Madrigal', 'pauMad@gmail.com'),
	('Ana', 'Esquivel', 'anaE@gmail.com'),
	('Belén', 'Alvarado', 'belenAlv@gmail.com'),
	('Santiago', 'Acosta', 'santiacos@gmail.com'),
	('Sebastian', 'Montero', 'sebasmont@gmail.com'),
	('Gabriel', 'Varela', 'gabrvare@gmail.com');

-- SELECT * FROM Cliente

----------------------------------- Tipo Productos -----------------------------------

INSERT INTO TipoProducto(descripcion) VALUES
	('Silla'),
	('Mesa'),
	('Escritorio'),
	('Cómoda'),
	('Cama'),
	('Sofá');

-- SELECT * FROM TipoProducto

----------------------------------- Productos -----------------------------------

----------------------- JSONS -----------------------

-- Sillas

DECLARE @json1 NVARCHAR(MAX) = N'{
	"material": "pino",
	"precio": 25000
}';
DECLARE @json2 NVARCHAR(MAX) = N'{
	"material": "roble",
	"precio": 35000
}';

-- Mesas
DECLARE @json3 NVARCHAR(MAX) = N'{
	"material": "madera",
	"cantPersonas": 8,
	"precio": 35000
}';
DECLARE @json4 NVARCHAR(MAX) = N'{
	"material": "metal",
	"cantPersonas": 4,
	"precio": 10000
}';

-- Escritorio
DECLARE @json5 NVARCHAR(MAX) = N'{
	"material": "madera",
	"tamano": "1mx2m",
	"precio": 37000
}';

-- Comoda
DECLARE @json6 NVARCHAR(MAX) = N'{
	"material": "madera",
	"tamano": "90x70",
	"precio": 17000
}';

-- Cama
DECLARE @json7 NVARCHAR(MAX) = N'{
	"material": "acero",
	"tipo": "individual",
	"precio": 100000
}';
DECLARE @json8 NVARCHAR(MAX) = N'{
	"material": "madera",
	"tipo": "queen",
	"precio": 200000
}';

-- Sofas
DECLARE @json9 NVARCHAR(MAX) = N'{
	"material": "cuero",
	"plaza": 3.2,
	"reclinable": true,
	"precio": 50000
}';
DECLARE @json10 NVARCHAR(MAX) = N'{
	"material": "cuerina",
	"plaza": 2.2,
	"reclinable": false,
	"precio": 15000
}';
DECLARE @json11 NVARCHAR(MAX) = N'{
	"material": "tela",
	"plaza": 2.2,
	"reclinable": true,
	"precio": 10000
}';

----------------------- TABLA -----------------------

INSERT INTO Producto(tipoProId, fabricanteId, nombre, caract) VALUES
	(1, 1, 'Silla para mesa', @json1),
	(1, 2, 'Silla de escritorio', @json2),
	(2, 3, 'Mesa cuadrada', @json3),
	(2, 4, 'Mesa redonda', @json4),
	(3, 5, 'Escritorio de madera', @json5),
	(4, 1, 'Comoda para cuarto', @json6),
	(5, 7, 'Cama pequena', @json7),
	(5, 6, 'Cama grande', @json8),
	(6, 8, 'Sofa grande', @json9),
	(6, 9, 'Sofa unico', @json10),
	(6, 2, 'Sofa lindo', @json11);

-- SELECT * FROM Producto

----------------------------------- Ventas -----------------------------------

DECLARE @venta1 NVARCHAR(MAX) = N'{
    "sillas" : [
        {"id" : 1},
        {"id" : 2},
        {"id" : 3}
    ],
    "sofas" : [
        {"id" : 11},
    ],
    "camas" : [
        {"id" : 7},
    ]
}';

DECLARE @venta2 NVARCHAR(MAX) = N'{
    "sofas" : [
        {"id" : 10},
    ],
    "comodas" : [
        {"id" : 7},
    ]
}';

DECLARE @venta3 NVARCHAR(MAX) = N'{ 
    "sillas" : [
        {"id" : 1},
    ],
}';

DECLARE @venta4 NVARCHAR(MAX) = N'{ 
    "escritorios" : [
        {"id" : 5},
    ],
    "mesas" : [
        {"id" : 3},
        {"id" : 4},
    ]
}';

DECLARE @venta5 NVARCHAR(MAX) = N'{ 
    "camas" : [
        {"id" : 8},
    ],
}';

DECLARE @venta6 NVARCHAR(MAX) = N'{ 
    "sillas" : [
        {"id" : 3}
    ],
    "mesas" : [
        {"id" : 4},
    ],
    "camas" : [
        {"id" : 7},
    ]
}';

INSERT INTO Ventas(clienteId, productos, monto, fecha, empleadoId) VALUES
	(1, @venta1, 120000, GETDATE(), 1),
	(2, @venta2, 15000, GETDATE(), 1),
	(3, @venta3, 19999, GETDATE(), 2),
	(4, @venta4, 180000, GETDATE(), 3),
	(5, @venta5, 520000, GETDATE(), 4),
	(6, @venta6, 320000, GETDATE(), 5);

-- SELECT * FROM Ventas

----------------------------------- Inventario -----------------------------------
INSERT INTO Inventario(productoId, cantidad) VALUES
	(1, 10),
	(2, 7),
	(3, 25),
	(4, 4),
	(5, 32),
	(6, 8),
	(7, 4),
	(8, 2),
	(9, 1),
	(10, 14),
	(11, 12);

-- SELECT * FROM Inventario