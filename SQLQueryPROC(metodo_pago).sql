------PROCEDURES METODO PAGO----------
CREATE PROCEDURE InsertarMetodoPago
  @nombre VARCHAR(50)
AS
BEGIN
  INSERT INTO metodo_pago (nombre)
  VALUES (@nombre)
END;


EXEC InsertarMetodoPago 'Efectivo';

SELECT * FROM metodo_pago;