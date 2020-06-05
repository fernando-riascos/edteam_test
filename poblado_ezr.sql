/*Poblacion de la base de datos, inserts a todas la tablas
-- Es importante el orden debido a que algunas tablas son dependientes de otras*/

/*Insert a la tabla presentacion*/
INSERT INTO ezr_presentacion(pre_categoria) VALUES ('Deportivos');
INSERT INTO ezr_presentacion(pre_categoria) VALUES ('Escolares');
INSERT INTO ezr_presentacion(pre_categoria) VALUES ('Caminata');

/*Insert a la tabla pais*/
INSERT INTO ezr_pais(pais_nombre) VALUES ('Colombia');
INSERT INTO ezr_pais(pais_nombre) VALUES ('Chile');
INSERT INTO ezr_pais(pais_nombre) VALUES ('Argentina');

/*Insert a la tabla cliente*/
INSERT INTO ezr_cliente(cli_nom,cli_pais_id) VALUES ('fernando mendez', 1);
INSERT INTO ezr_cliente(cli_nom,cli_pais_id) VALUES ('john caballero', 2);
INSERT INTO ezr_cliente(cli_nom,cli_pais_id) VALUES ('niko medina', 3);

/*Insert a la tabla productos*/
INSERT INTO ezr_productos(pro_nom,pro_presen_id,pro_valor) VALUES ('tenis nike',1,150000);
INSERT INTO ezr_productos(pro_nom,pro_presen_id,pro_valor) VALUES ('escolar negro',2,50000);
INSERT INTO ezr_productos(pro_nom,pro_presen_id,pro_valor) VALUES ('zapatilla',3,45000);
INSERT INTO ezr_productos(pro_nom,pro_presen_id,pro_valor) VALUES ('tenis adidas',1,250000);

/*Insert a la tabla inventario*/
INSERT INTO ezr_inventario(inven_tipo_movi,inven_fecha,inven_cantidad,inven_pro_id) VALUES (1,'2020-05-18',28,4);
INSERT INTO ezr_inventario(inven_tipo_movi,inven_fecha,inven_cantidad,inven_pro_id) VALUES (0,'2020-02-18',10,1);
INSERT INTO ezr_inventario(inven_tipo_movi,inven_fecha,inven_cantidad,inven_pro_id) VALUES (1,'2020-08-18',5,2);

/*Insert a la tabla facturacion*/
INSERT INTO ezr_facturacion(fac_cli_id,fac_compra,fac_impu,fac_val_pago,fac_descu,fac_fecha) VALUES(1,'tenis nike - escolar negro',5,200000,5,'2020-09-15');
INSERT INTO ezr_facturacion(fac_cli_id,fac_compra,fac_impu,fac_val_pago,fac_descu,fac_fecha) VALUES(2,'zapatilla',5,45000,5,'2020-11-16');
INSERT INTO ezr_facturacion(fac_cli_id,fac_compra,fac_impu,fac_val_pago,fac_descu,fac_fecha) VALUES(3,'tenis adidas - tenis nike',10,250000,10,'2020-10-17');