ALTER proc [dbo].[sp_EliminarMarca](
@IdMarca int,
@Mensaje varchar(500) output,
@Resultado bit output
)
as
begin
	SET @Resultado = 0 
	IF NOT EXISTS (SELECT * FROM PRODUCTO p
	inner join MARCA m on m.IdMarca= p.IdCategoria
	where p.IdMarca = @IdMarca)
	begin
		
		delete top (1) from MARCA where IdMarca = @IdMarca
		SET @Resultado = 1

	end
	else 
	 set @Mensaje = 'La marca se encuentra relacionada a un producto'
end