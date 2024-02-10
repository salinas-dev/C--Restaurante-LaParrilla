CREATE PROCEDURE insertar_detalle_compra
  @nombre_insumo VARCHAR(100),
  @cantidad INT,
  @nombre_proveedor VARCHAR(100)
AS
BEGIN
  SET NOCOUNT ON;

  -- Obtener el id_insumo y el id_proveedor basado en los nombres proporcionados
  DECLARE @id_insumo INT, @id_proveedor INT;
  SELECT @id_insumo = id_insumo FROM insumo WHERE nombre_insumo = @nombre_insumo;
  SELECT @id_proveedor = id_proveedor FROM proveedor WHERE nombre = @nombre_proveedor;

  -- Calcular el subtotal utilizando el precio de compra del insumo
  DECLARE @subtotal DECIMAL(10, 2);
  SET @subtotal = (SELECT precio_compra FROM insumo WHERE id_insumo = @id_insumo) * @cantidad;

  -- Insertar el registro en la tabla detalle_compra
  INSERT INTO detalle_compra (id_insumo, cantidad, id_proveedor, fecha, subtotal)
  VALUES (@id_insumo, @cantidad, @id_proveedor, GETDATE(), @subtotal);
END;






















CREATE PROCEDURE insertar_detalle_compra
  @nombre_insumo VARCHAR(100),
  @cantidad INT,
  @nombre_proveedor VARCHAR(100)
AS
BEGIN
  SET NOCOUNT ON;

  -- Obtener el id_insumo y el id_proveedor basado en los nombres proporcionados
  DECLARE @id_insumo INT, @id_proveedor INT;
  SELECT @id_insumo = id_insumo FROM insumo WHERE nombre_insumo = @nombre_insumo;
  SELECT @id_proveedor = id_proveedor FROM proveedor WHERE nombre = @nombre_proveedor;

  -- Calcular el subtotal utilizando el precio de compra del insumo
  DECLARE @subtotal DECIMAL(10, 2);
  SET @subtotal = (SELECT precio_compra FROM insumo WHERE id_insumo = @id_insumo) * @cantidad;

  -- Insertar el registro en la tabla detalle_compra
  INSERT INTO detalle_compra (id_insumo, cantidad, id_proveedor, fecha, subtotal)
  VALUES (@id_insumo, @cantidad, @id_proveedor, GETDATE(), @subtotal);

  -- Aumentar la cantidad de insumos en la tabla insumo
  UPDATE insumo SET existencia_insumo = existencia_insumo + @cantidad WHERE id_insumo = @id_insumo;
END;


