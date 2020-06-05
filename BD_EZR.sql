/*Este script fue desarrollado en MySql Workbench 8.0
-- Todas las tablas de este Script cuentan con un id auto_incrementable ademas de esto, este id es la llave primaria*/

CREATE DATABASE ezr;

USE ezr;

/*tabla presentacion dependiente de la tabla productos*/
CREATE TABLE ezr_presentacion(
    pre_id INT AUTO_INCREMENT PRIMARY KEY,
    pre_categoria VARCHAR(70)
);

/*tabla pais dependiente de la tabla cliente*/
CREATE TABLE ezr_pais(
    pais_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    pais_nombre VARCHAR(70)
);

/*tabla productos*/
CREATE TABLE ezr_productos(
    pro_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    pro_nom VARCHAR(70),
    pro_presen_id INT,
    pro_valor INTEGER(10),

    FOREIGN KEY(pro_presen_id) REFERENCES ezr_presentacion(pre_id)
);

/*tabla cliente*/
CREATE TABLE ezr_cliente(
    cli_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    cli_nom VARCHAR (70),
    cli_pais_id INT,

    FOREIGN KEY(cli_pais_id) REFERENCES ezr_pais(pais_id)
);

/*tabla inventario*/
CREATE TABLE ezr_inventario(
    inven_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    inven_tipo_movi BOOLEAN,/*0 == Entrada /// 1  == Salida */
    inven_fecha DATE,
    inven_cantidad INT,
    inven_pro_id INT,

    FOREIGN KEY(inven_pro_id) REFERENCES ezr_productos(pro_id)
);

/*tabla facturacion*/
CREATE TABLE ezr_facturacion(
    fac_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    fac_cli_id INTEGER UNIQUE, /*este campo es llave foranea para evitar su repeticion y reduncia en la BD se declara UNIQUE */
    fac_compra VARCHAR(300),
    fac_impu INT,
    fac_val_pago INT,
    fac_descu INT,
    fac_fecha DATE,
    FOREIGN KEY (fac_cli_id) REFERENCES ezr_cliente(cli_id)
);

/* Procedimientos almacenados para facilitar las consultas*/

DELIMITER //
    /*-- este procedimiento recibe como parametro el ID del cliente que se quiere buscar*/
    CREATE PROCEDURE factu_cli(cli_id INTEGER)
        BEGIN
            SELECT * FROM ezr_facturacion WHERE fac_cli_id = cli_id;
        END //

    /*--este procedimiento recibe como parametros el rango de fechas a consultar en el formato(AAAA-MM-DD)*/
    CREATE PROCEDURE factu_fechas(fec_ini DATE, fec_fin DATE)
        BEGIN
            SELECT * FROM ezr_facturacion WHERE fac_fecha BETWEEN fec_ini AND fec_fin;
        END //

    /*--este procedimiento recibe como parametro el nombre del producto*/
    CREATE PROCEDURE factu_pro(pro_nom VARCHAR(70))
        BEGIN
            SELECT fac_id FROM ezr_facturacion WHERE fac_compra regexp pro_nom;
        END //

    /*--este procedimiento nos devuelve el listado de los clientes*/
    CREATE PROCEDURE factu_clientes()
        BEGIN
            SELECT fac_cli_id,cli_nom FROM ezr_cliente INNER JOIN ezr_facturacion ON ezr_cliente.cli_id = ezr_facturacion.fac_cli_id;
        END //
DELIMITER ;
