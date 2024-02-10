CREATE PROCEDURE InsertarInsumo
  @nombre_insumo VARCHAR(50),
  @existencia_insumo INT,
  @precio_compra DECIMAL(10,2)
AS
BEGIN
  INSERT INTO insumo (nombre_insumo, existencia_insumo, precio_compra)
  VALUES (@nombre_insumo, @existencia_insumo, @precio_compra);
END;



CREATE PROCEDURE InsertarInsumo
    @nombre_producto VARCHAR(50),
    @nombre_insumo VARCHAR(50),
    @existencia INT, 
    @precio_compra DECIMAL(10,2)
AS
BEGIN
    DECLARE @id_producto INT

    SELECT @id_producto = id_producto
    FROM productos
    WHERE nombre = @nombre_producto

    INSERT INTO insumo (id_producto, nombre_insumo, existencia_insumo, precio_compra)
    VALUES (@id_producto, @nombre_insumo, @existencia, @precio_compra)
END

EXEC InsertarInsumo
@nombre_producto = 'Sopa de codo',
@nombre_insumo = 'Cebolla',
@existencia = 15,
@precio_compra = 21.99;

SELECT * FROM productos;
SELECT * FROM insumo;