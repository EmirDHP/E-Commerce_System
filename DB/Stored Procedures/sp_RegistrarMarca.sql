USE [DBCARRITO]
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarMarca]    Script Date: 1/27/2023 10:33:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[sp_RegistrarMarca](
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin
	SET @Resultado = 0 
	IF NOT EXISTS (SELECT * FROM MARCA WHERE Descripcion = @Descripcion)
	begin
		insert into MARCA(Descripcion,Activo) values
		(@Descripcion,@Activo)

		SET @Resultado = SCOPE_IDENTITY()
	end
	else 
	 set @Mensaje = 'La marca ya existe'
end