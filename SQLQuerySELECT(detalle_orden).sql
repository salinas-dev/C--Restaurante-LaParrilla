SELECT do.id_detalle_venta AS ID, 
m.id_mesa AS ID_MESA,
p.nombre AS NOMBRE_PRODUCTO,
do.cantidad AS CANTIDAD,
do.fecha AS FECHA,
do.subtotal AS SUBTOTAL,
mp.nombre AS METODO_PAGO
FROM detalle_orden do
INNER JOIN mesa m ON do.id_mesa = m.id_mesa
INNER JOIN productos p ON do.id_producto = p.id_producto
INNER JOIN metodo_pago mp ON do.id_met_pago = mp.id_met_pago
