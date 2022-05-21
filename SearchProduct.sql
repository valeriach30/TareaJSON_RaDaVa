-- Buscar un producto por caracacteristica 
CREATE PROCEDURE dbo.searchProduct
@caracteristica NVARCHAR(MAX),
@valor NVARCHAR(MAX)
AS
BEGIN
	DECLARE @query NVARCHAR(MAX) = N'$.' + @caracteristica;
	
	SELECT
		nombre,
		JSON_VALUE(caract, '$.precio') AS Precio 
	FROM Producto WHERE JSON_VALUE(caract, @query) = @valor;		
END
	

-- Ejemplo
DECLARE @inCaract NVARCHAR(MAX) = 'material', @inValue NVARCHAR(MAX) = 'madera';

EXEC searchProduct
	@caracteristica = @inCaract,
	@valor = @inValue;