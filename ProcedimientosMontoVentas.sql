--IF OBJECT_ID('ventasXproducto') IS NOT NULL
	--DROP procedure ventasXproducto;


-- Obtiene los montos de ventas por productos, puede motrar por fechas,cliente o producto
CREATE or ALTER PROCEDURE dbo.ventasXproducto
@fecha date = null,
@cliente int = null,
@producto NVARCHAR(MAX) =null
AS
BEGIN

    
    --hay que probar el codigo!!

    if (@fecha is not NULL)
        BEGIN
            select sum(Ventas.monto) as VentasTotales,Ventas.productos as totalVentasFechas from Ventas
            where Ventas.fecha = @fecha
            group by  productos; --JSON_VALUE(productos,@query) as productoId

        END;
   else if (@cliente is not NULL)
        BEGIN
            select sum(Ventas.monto) as VentasTotales, Ventas.productos as totalVentasCliente from Ventas
            where Ventas.clienteId = @cliente
            group by productos;

        END;
    else -- se asume que va a consultar por producto
        BEGIN
            DECLARE @query NVARCHAR(MAX) = N'$.' + @producto + 'id';

            select sum(Ventas.monto) as totalVentasProducto from Ventas
			where Ventas.productos = @producto;
            
        END;
END




EXEC ventasXproducto
	@cliente = 1;


DECLARE @fechahoy date = getdate();

execute ventasXproducto 
    @fecha = @fechahoy;


DECLARE @productosVen NVARCHAR(MAX) = N'{
    "sillas" : [
        {"id" : 1, "cant": 1},
        {"id" : 2, "cant": 1},
        {"id" : 3, "cant": 1}
    ],
    "sofas" : [
        {"id" : 11, "cant": 1},
    ],
    "camas" : [
        {"id" : 7, "cant": 1},
    ]
}';

execute ventasXproducto 
    @producto = @productosVen;