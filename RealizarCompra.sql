-- Proceso para compras de productos

-- Se ingresa el parametro "producto" como un JSON
CREATE PROCEDURE compra
@clienteID INT,
@productos NVARCHAR(MAX),
@monto MONEY,
@empleadoID INT
AS
BEGIN
	DECLARE @fecha DATE = GETDATE();
	
	INSERT INTO Ventas(clienteId, productos, monto, fecha, empleadoId) 
	VALUES (@clienteID, @productos, @monto, @fecha, @empleadoID);
END


-- Ejemplo
DECLARE @ventaEjemplo NVARCHAR(MAX) = N'{ 
    "sillas" : [
        {"id" : 3, "cant": 1}
    ],
    "mesas" : [
        {"id" : 4, "cant": 3},
    ]
}';

DECLARE @inCliente INT = 1, @inMonto INT = 10000, @inEmpleado INT = 1;

EXEC compra
	@clienteID = @inCliente,
	@productos = @ventaEjemplo,
	@monto = @inMonto,
	@empleadoID = @inEmpleado;