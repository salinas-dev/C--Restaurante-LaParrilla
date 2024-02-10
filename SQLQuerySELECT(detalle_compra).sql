SELECT dc.id_detalle_compra AS ID,
i.id_insumo AS ID_MESA,
dc.cantidad AS CANTIDAD,
p.nombre AS PROVEEDOR,
dc.fecha AS FECHA,
dc.subtotal AS SUBTOTAL
FROM detalle_compra dc 
INNER JOIN insumo i ON dc.id_insumo = i.id_insumo 
INNER JOIN proveedor p ON dc.id_proveedor = p.id_proveedor 