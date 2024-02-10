CREATE PROCEDURE [dbo].[InsertarProducto]
  @nombre VARCHAR(50),
  @precio_venta DECIMAL(10,2),
  @nombre_categoria VARCHAR(50),
  @existencia INT
AS
BEGIN
  DECLARE @id_categoria INT

  SELECT @id_categoria = id_categoria
  FROM categoria
  WHERE nombre = @nombre_categoria

  INSERT INTO productos (nombre, precio_venta, id_categoria, existencia)
  VALUES (@nombre, @precio_venta, @id_categoria, @existencia);

  SELECT p.id_producto AS ID, 
         p.nombre AS NOMBRE, 
         p.precio_venta AS PRECIO, 
         c.nombre AS CATEGORIA
  FROM productos p
  INNER JOIN categoria c ON p.id_categoria = c.id_categoria
  WHERE p.nombre = @nombre;
END