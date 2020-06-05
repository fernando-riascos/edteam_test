/*Anteriormente se crearon procedimientos almacenados para reliazar las debidas consultas por ende en ese script 
solo se llama a los procedimientos y se le dan los parametos necesarios*/

/* 1. Consulta la facturación de un cliente en específico.*/
CALL factu_cli(2);

/*2. Consulta la facturación de un producto en específico.*/
CALL factu_pro('tenis nike');

/*3. Consulta la facturación de un rango de fechas.*/
CALL factu_fechas('2020-08-15','2020-09-16');

/*4. De la facturación, consulta los clientes únicos
(es decir, se requiere el listado de los clientes que han comprado por lo menos una vez,
pero en el listado no se deben repetir los clientes)*/
CALL factu_clientes();


/*--------------------------Consultas directas--------------------------*/

/*Consulta 1.*/
SELECT * FROM ezr_facturacion WHERE fac_cli_id = 2;

/*Consulta 2.*/
SELECT fac_id FROM ezr_facturacion WHERE fac_compra regexp 'tenis nike';

/*Consulta 3.*/
SELECT * FROM ezr_facturacion WHERE fac_fecha BETWEEN '2020-08-15' AND '2020-09-16';

/*Consulta 4. esta consulta funciona debido a que el campo de fac_cli_id esta declarado como UNIQUE*/
SELECT fac_cli_id,cli_nom FROM ezr_cliente INNER JOIN ezr_facturacion ON ezr_cliente.cli_id = ezr_facturacion.fac_cli_id;


