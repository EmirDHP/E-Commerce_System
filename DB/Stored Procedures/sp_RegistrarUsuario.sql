ALTER PROC [dbo].[sp_RegistrarUsuario](
@Nombres varchar(100),
@Apellidos varchar(100),
@Correo varchar(100),
@Clave varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)
as begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM USUARIO WHERE Correo = @Correo)
	begin
		insert into USUARIO(Nombres,Apellidos,Correo,Clave,Activo) values
		(@Nombres,@Apellidos,@Correo,@Clave,@Activo)

		SET @Resultado = SCOPE_IDENTITY()
	end
	else
	set @Mensaje = 'El correo del usuario ya existe'
end