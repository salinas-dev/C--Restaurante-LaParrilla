------PROCEDURES PROVEEDOR----------
CREATE PROCEDURE InsertarProveedor
  @nombre VARCHAR(50),
  @telefono VARCHAR(30)
AS
BEGIN
  INSERT INTO proveedor (nombre, telefono)
  VALUES (@nombre, @telefono);
END


EXEC InsertarProveedor
  @nombre = 'Proveedor A',
  @telefono = '123456789';
