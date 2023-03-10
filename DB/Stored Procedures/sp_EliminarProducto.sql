ALTER proc [dbo].[sp_EliminarProducto](
@IdProducto int,
@Mensaje varchar(500) output,
@Resultado bit output
)
as
begin
	SET @Resultado = 0 
	IF NOT EXISTS (SELECT * FROM DETALLE_VENTA dv
	inner join PRODUCTO p on p.IdProducto= dv.IdProducto
	where p.IdProducto = @IdProducto)
	begin
		
		delete top (1) from PRODUCTO where IdProducto = @IdProducto
		SET @Resultado = 1

	end
	else 
	 set @Mensaje = 'La marca se encuentra relacionada a un producto'
end
