------PROCEDURES CATEGORIA----------
CREATE PROCEDURE InsertarCategoria
  @nombre VARCHAR(50)
AS
BEGIN
  INSERT INTO categoria (nombre)
  VALUES (@nombre)
END;


EXEC InsertarCategoria 'Platillo';