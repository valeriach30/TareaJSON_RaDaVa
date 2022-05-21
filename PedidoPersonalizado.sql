-- Pedidos Personalizados
CREATE PROCEDURE pedidoPersonalizado
@clienteID INT,
@pedido NVARCHAR(MAX)
AS BEGIN
	BEGIN TRY
		INSERT INTO PedidosPersonalizados(clienteID, pedido)
		VALUES (@clienteID, @pedido);
	END TRY
	BEGIN CATCH
		PRINT 'Error al insertar pedido personalizado';
	END CATCH
END

-- Ejemplo
DECLARE @pedidoEjemplo NVARCHAR(MAX) = N'{ 
    "sillas" : [
        {"id" : 3, "cant": 7, "material": "madera"}
    ],
    "mesas" : [
        {"id" : 4, "cant": 3, "material": "plastico"},
    ]
}';

EXEC pedidoPersonalizado 
	@clienteID = 1,
	@pedido = @pedidoEjemplo;