-- Buscar un producto por caracacteristica 
CREATE or ALTER PROCEDURE dbo.searchProduct
@caracteristica NVARCHAR(MAX),
@valor NVARCHAR(MAX)
AS
BEGIN
	BEGIN TRY
		DECLARE @query NVARCHAR(MAX) = N'$.' + @caracteristica;
	
		SELECT
			nombre,
			JSON_VALUE(caract, '$.precio') AS Precio 
		FROM Producto WHERE JSON_VALUE(caract, @query) = @valor;	
	END TRY
	BEGIN CATCH
			PRINT 'Error al buscar producto';
	END CATCH
END
	

-- Ejemplo
DECLARE @inCaract NVARCHAR(MAX) = 'material', @inValue NVARCHAR(MAX) = 'madera';

EXEC searchProduct
	@caracteristica = @inCaract,
	@valor = @inValue;

