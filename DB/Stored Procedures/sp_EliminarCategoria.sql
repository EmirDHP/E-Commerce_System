ALTER proc [dbo].[sp_EliminarCategoria](
@IdCategoria int,
@Mensaje varchar(500) output,
@Resultado bit output
)
as
begin
	SET @Resultado = 0 
	IF NOT EXISTS (SELECT * FROM PRODUCTO p
	inner join CATEGORIA c on c.IdCategoria = p.IdCategoria
	where p.IdCategoria = @IdCategoria)
	begin
		
		delete top (1) from CATEGORIA where IdCategoria = @IdCategoria
		SET @Resultado = 1

	end
	else 
	 set @Mensaje = 'La categoria se encuentra relacionada a un producto'
end