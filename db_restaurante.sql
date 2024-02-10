CREATE DATABASE db_restaurante;

USE db_restaurante;

-----TABLE METDOO PAGO-----
CREATE TABLE metodo_pago (
  id_met_pago INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(50)
);

-----TABLE CATEGORIA-----
CREATE TABLE categoria (
  id_categoria INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(50)
);

-----TABLE MESA-----
CREATE TABLE mesa (
  id_mesa INT IDENTITY(1,1) PRIMARY KEY,
  capacidad INT,
  estado VARCHAR(50)
);

-----TABLE PROVEEDOR-----
CREATE TABLE proveedor (
  id_proveedor INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(50),
  telefono VARCHAR(30)
);

-----TABLE PRODUCTOS-----
CREATE TABLE productos (
  id_producto INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(50),
  precio_venta DECIMAL(10,2),
  id_categoria INT,
  existencia INT,
  FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);


---TABLA ORDEN---
CREATE TABLE orden(
	folio_orden VARCHAR(50) PRIMARY KEY,
	fecha DATETIME,
	total DECIMAL(10,2)
);

-----TABLE DETALLE ORDEN-----
CREATE TABLE detalle_orden ( 
  id_detalle_orden INT IDENTITY(1,1) PRIMARY KEY,
  folio_orden VARCHAR(50),
  id_mesa INT,
  id_producto INT,
  cantidad INT,
  fecha DATETIME,
  subtotal DECIMAL(10,2), 
  id_met_pago INT,
  FOREIGN KEY (folio_orden) REFERENCES orden(folio_orden),
  FOREIGN KEY (id_met_pago) REFERENCES metodo_pago(id_met_pago),
  FOREIGN KEY (id_mesa) REFERENCES mesa(id_mesa),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);


-----TABLE INSUMO-----
CREATE TABLE insumo (
  id_insumo INT IDENTITY(1,1) PRIMARY KEY,
  id_producto INT,
  nombre_insumo VARCHAR(50),
  existencia_insumo INT,
  precio_compra DECIMAL(10,2),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);



-----TABLE DETALLE COMPRA-----
CREATE TABLE detalle_compra (
  id_detalle_compra INT IDENTITY(1,1) PRIMARY KEY,
  id_insumo INT,
  cantidad INT,
  id_proveedor INT,
  fecha DATETIME,
  subtotal DECIMAL(10,2)
  FOREIGN KEY (id_insumo) REFERENCES insumo(id_insumo),
  FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);




-----TABLE BITACORAVENTA-----
CREATE TABLE bitacoraVenta (
  id_bitacoraVenta INT IDENTITY(1,1) PRIMARY KEY,
  nombre_producto VARCHAR(50),
  cantidad INT,
  fecha DATETIME,
  mesa INT,
  total DECIMAL(10,2)
);

