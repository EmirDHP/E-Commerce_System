USE DBCARRITO;
SELECT * FROM USUARIO;

begin -- USUARIOS --
CREATE PROC sp_RegistrarUsuario(
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



CREATE PROC sp_EditarUsuario(
@IdUsuario int,
@Nombres varchar(100),
@Apellidos varchar(100),
@Correo varchar(100),
@Clave varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado bit output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM USUARIO WHERE Correo = @Correo and IdUsuario != @IdUsuario)
	begin
		update top (1) USUARIO set
		Nombres = @Nombres,
		Apellidos = @Apellidos,
		Correo = @Correo,
		Activo = @Activo
		where IdUsuario = @IdUsuario

		SET @Resultado = 1
	end
	else
	set @Mensaje = 'El correo del usuario ya existe'
end

end

begin -- CATEGORIAS --
create proc sp_RegistrarCategoria(
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin
	SET @Resultado = 0 
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion)
	begin
		insert into CATEGORIA(Descripcion,Activo) values
		(@Descripcion,@Activo)

		SET @Resultado = SCOPE_IDENTITY()
	end
	else 
	 set @Mensaje = 'La categoria ya existe'
end


create proc sp_EditarCategoria(
@IdCategoria int,
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado bit output
)
as
begin
	SET @Resultado = 0 
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion and IdCategoria !=@IdCategoria)
	begin
		
		update top(1) CATEGORIA set
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdCategoria = @IdCategoria

		SET @Resultado = 1
	end
	else 
	 set @Mensaje = 'La categoria ya existe'
end


create proc sp_EliminarCategoria(
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

end

begin -- MARCA --
create proc sp_RegistrarMarca(
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


create proc sp_EditarMarca(
@IdMarca int,
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado bit output
)
as
begin
	SET @Resultado = 0 
	IF NOT EXISTS (SELECT * FROM MARCA WHERE Descripcion = @Descripcion and IdMarca !=@IdMarca)
	begin
		
		update top(1) MARCA set
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdMarca = @IdMarca

		SET @Resultado = 1
	end
	else 
	 set @Mensaje = 'La categoria ya existe'
end


create proc sp_EliminarMarca(
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
end

begin -- PRODUCTO --
create proc sp_RegistrarProducto(
@Nombre varchar(100),
@Descripcion varchar(100),
@IdMarca varchar(100),
@IdCategoria varchar(100),
@Precio decimal(10,2),
@Stock int,
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin
	SET @Resultado = 0 
	IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE Nombre = @Nombre)
	begin
		insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,Activo) values
		(@Nombre, @Descripcion, @IdMarca, @IdCategoria, @Precio, @Stock, @Activo)

		SET @Resultado = SCOPE_IDENTITY()
	end
	else 
	 set @Mensaje = 'El producto ya existe'
end

create proc sp_EditarProducto(
@IdProducto int,
@Nombre varchar(100),
@Descripcion varchar(100),
@IdMarca varchar(100),
@IdCategoria varchar(100),
@Precio decimal(10,2),
@Stock int,
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin
	SET @Resultado = 0 
	IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE Nombre = @Nombre and IdProducto != @IdProducto)
	begin
		update PRODUCTO set
		Nombre = @Nombre,
		Descripcion = @Descripcion,
		IdMarca = @IdMarca,
		IdCategoria = @IdCategoria,
		Precio = @Precio,
		Stock = @Stock,
		Activo = @Activo
		where IdProducto = @IdProducto

		SET @Resultado = 1
	end
	else 
	 set @Mensaje = 'El producto ya existe'
end

create proc sp_EliminarProducto(
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

end


begin -- DASHBOARD --
create proc  sp_ReporteDashboard
as begin

select

(select count(*) from CLIENTE)[TotalCliente],
(select ISNULL(sum(cantidad),0) from DETALLE_VENTA)[TotalVenta],
(select count(*) from PRODUCTO)[TotalProducto]

end
end

begin -- TABLA DETALLES DASHBOARD --

create proc  sp_ReporteVentas(
@fechainicio varchar(10),
@fechafin varchar(10),
@idtransaccion varchar(50)
)
as begin

set dateformat dmy;

select 
CONVERT(char(10), v.FechaVenta,108)[FechaVenta],CONCAT( c.Nombres,' ',c.Apellidos)[Cliente],
p.Nombre[Producto], p.Precio, dv.Cantidad, dv.Total, v.IdTransaccion
from DETALLE_VENTA dv
inner join PRODUCTO p on p.IdProducto = dv.IdProducto
inner join VENTA v on v.IdVenta = dv.IdVenta
inner join CLIENTE c on c.IdCliente = v.IdCliente
where CONVERT(date, v.FechaVenta ) between @fechainicio and @fechafin

and  v.IdTransaccion = iif(@idtransaccion = '', v.IdTransaccion, @idtransaccion)
end

end