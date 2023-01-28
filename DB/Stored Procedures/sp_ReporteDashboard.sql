ALTER proc [dbo].[sp_ReporteDashboard]
as
begin

select 

(select count(*) from CLIENTE)[TotalCliente],
(select ISNULL(sum(cantidad),0) from DETALLE_VENTA)[TotalVenta],
(select count(*) from PRODUCTO)[TotalProducto]

end