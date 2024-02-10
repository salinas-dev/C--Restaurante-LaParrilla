USE [db_restaurante]
GO
/****** Object:  StoredProcedure [dbo].[InsertarMesa]    Script Date: 21/06/2023 18:59:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InsertarMesa]
  @capacidad INT,
  @estado VARCHAR(50)
AS
BEGIN
  IF @estado NOT IN ('Disponible', 'Ocupado', 'Reservado')
  BEGIN
    RAISERROR('El estado debe ser "Disponible", "Ocupado" o "Reservado"', 16, 1);
    RETURN;
  END;

  INSERT INTO mesa (capacidad, estado)
  VALUES (@capacidad, @estado);
END;
