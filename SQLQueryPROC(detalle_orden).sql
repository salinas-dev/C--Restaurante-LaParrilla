CREATE PROCEDURE insertar_detalle_orden
    @mesa VARCHAR(50),
    @nombre_producto VARCHAR(50),
    @cantidad INT,
    @nombre_metodo_pago VARCHAR(50)
AS
BEGIN
    DECLARE @id_producto INT
    DECLARE @subtotal DECIMAL(10,2)
    DECLARE @id_metodo_pago INT

    SELECT @id_producto = id_producto
    FROM productos
    WHERE nombre = @nombre_producto

    SET @subtotal = (SELECT precio_venta FROM productos WHERE nombre = @nombre_producto) * @cantidad

    SELECT @id_metodo_pago = id_met_pago
    FROM metodo_pago
    WHERE nombre = @nombre_metodo_pago

    INSERT INTO detalle_orden (id_mesa, id_producto, cantidad, fecha, subtotal, id_met_pago)
    VALUES (@mesa, @id_producto, @cantidad, GETDATE(), @subtotal, @id_metodo_pago)
END


EXEC insertar_detalle_orden
    @mesa = '2',
    @nombre_producto = 'Sopa de codito',
    @cantidad = 1,
    @nombre_metodo_pago = 'Tarjeta de debito'


	SELECT * FROM detalle_orden

























	CREATE PROCEDURE insertar_detalle_orden
    @mesa VARCHAR(50),
    @nombre_producto VARCHAR(50),
    @cantidad INT,
    @nombre_metodo_pago VARCHAR(50)
AS
BEGIN
    DECLARE @id_producto INT;
    DECLARE @subtotal DECIMAL(10,2);
    DECLARE @id_metodo_pago INT;

    SELECT @id_producto = id_producto
    FROM productos
    WHERE nombre = @nombre_producto;

    SET @subtotal = (SELECT precio_venta FROM productos WHERE nombre = @nombre_producto) * @cantidad;

    SELECT @id_metodo_pago = id_met_pago
    FROM metodo_pago
    WHERE nombre = @nombre_metodo_pago;

    IF @cantidad >= 0  -- Verificar si la cantidad es mayor o igual a cero
    BEGIN
        -- Verificar si la cantidad a vender es menor o igual a la existencia del producto
        IF @cantidad <= (SELECT existencia FROM productos WHERE id_producto = @id_producto)
        BEGIN
            INSERT INTO detalle_orden (id_mesa, id_producto, cantidad, fecha, subtotal, id_met_pago)
            VALUES (@mesa, @id_producto, @cantidad, GETDATE(), @subtotal, @id_metodo_pago);

            -- Disminuir la cantidad de productos en la tabla productos
            UPDATE productos SET existencia = existencia - @cantidad WHERE id_producto = @id_producto;
        END
        ELSE
        BEGIN
            RAISERROR ('La cantidad a vender supera la existencia actual del producto.', 16, 1);
        END
    END
    ELSE
    BEGIN
        RAISERROR ('La cantidad debe ser mayor o igual a cero.', 16, 1);  -- Generar un error en caso de cantidad inválida
    END
END;

