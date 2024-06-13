-- Creación de la base de datos
CREATE DATABASE GestionInventariosEcommerce;
USE GestionInventariosEcommerce;

-- Creación de la tabla Categoría
CREATE TABLE Categoria (
    ID_Categoria INT PRIMARY KEY,
    Nombre_Categoria VARCHAR(100),
    Descripción TEXT
);

-- Creación de la tabla Proveedor
CREATE TABLE Proveedor (
    ID_Proveedor INT PRIMARY KEY,
    Nombre_Proveedor VARCHAR(100),
    Contacto VARCHAR(100)
);

-- Creación de la tabla Producto
CREATE TABLE Producto (
    ID_Producto INT PRIMARY KEY,
    Nombre_Producto VARCHAR(100),
    Descripción TEXT,
    Precio DECIMAL(10,2),
    Stock INT,
    ID_Categoria INT,
    ID_Proveedor INT,
    FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID_Categoria),
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedor(ID_Proveedor)
);

-- Creación de la tabla Cliente
CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY,
    Nombre_Cliente VARCHAR(100),
    Correo_Electronico VARCHAR(100),
    Direccion VARCHAR(200)
);

-- Creación de la tabla Pedido
CREATE TABLE Pedido (
    ID_Pedido INT PRIMARY KEY,
    Fecha_Pedido DATE,
    ID_Cliente INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

-- Creación de la tabla Detalle_Pedido
CREATE TABLE Detalle_Pedido (
    ID_Detalle INT PRIMARY KEY,
    ID_Pedido INT,
    ID_Producto INT,
    Cantidad INT,
    Precio_Unitario DECIMAL(10,2),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);
