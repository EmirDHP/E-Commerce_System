use DBCARRITO

select * from MARCA;

select * from PRODUCTO;

select p.IdProducto, p.Nombre, p.Descripcion,
m.IdMarca, m.Descripcion[DesMarca],
c.IdCategoria, c.Descripcion[DesCategoria],
p.Precio, p.Stock, p.RutaImagen, p.NombreImagen, p.Activo
from PRODUCTO p
inner join MARCA m on m.IdMarca = p.IdMarca
inner join CATEGORIA c on c.IdCategoria = p.IdCategoria