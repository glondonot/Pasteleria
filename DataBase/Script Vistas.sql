USE MariaCamilaPasteleria;

-- PARA EL ADMINISTRADOR

DROP VIEW IF EXISTS vw_utilidad;
CREATE VIEW vw_utilidad AS SELECT ID_producto, uti_Pganancia, uti_costo, uti_ganancia FROM utilidad;

DROP VIEW IF EXISTS vw_inventario;
CREATE VIEW vw_inventario AS SELECT ID_insumo, nom_insumo, inv_cantidad, inv_descripcion FROM inventario;

DROP VIEW IF EXISTS vw_preparacion;
CREATE VIEW vw_preparacion AS SELECT ID_producto, ID_insumo, nom_insumo, pre_cantidad FROM preparacion;

DROP VIEW IF EXISTS vw_compra;
CREATE VIEW vw_compra AS SELECT ID_compra, comp_fecha_entrega, comp_costo FROM compra;

DROP VIEW IF EXISTS vw_compra_inventario;
CREATE VIEW vw_compra_inventario AS SELECT ID_compra, ID_insumo, nom_insumo, ci_cantidad, ins_precio, ci_total, ci_nomLugar, ci_direccion FROM compra_inventario;


DROP VIEW IF EXISTS vw_gastos;
CREATE VIEW vw_gastos AS SELECT sum(comp_costo) AS total_gastado FROM compra;

DROP VIEW IF EXISTS vw_ventas;
CREATE VIEW vw_ventas AS SELECT sum(pp_total) AS total_vendido FROM pedido_producto;

DROP VIEW IF EXISTS vw_ganancias;
CREATE VIEW vw_ganancias AS SELECT total_vendido, total_gastado, total_vendido - total_gastado AS total_ganancias FROM vw_gastos CROSS JOIN vw_ventas;


-- PARA CLIENTE Y ADMINISTRADOR
DROP VIEW IF EXISTS vw_cliente;
CREATE VIEW vw_cliente AS SELECT ID_cliente, cli_nombre, cli_numero, cli_correo, cli_direccion FROM cliente;

DROP VIEW IF EXISTS vw_ancheta;
CREATE VIEW vw_ancheta AS SELECT ID_producto, anc_nombre, anc_precio, anc_motivo, anc_ventas FROM ancheta;

DROP VIEW IF EXISTS vw_cupcake;
CREATE VIEW vw_cupcake AS SELECT ID_producto, cup_nombre, cup_precio, cup_motivo, cup_ventas, cup_unidades, cup_sabor, cup_relleno, cup_cobertura FROM cupcake;

DROP VIEW IF EXISTS vw_ponque;
CREATE VIEW vw_ponque AS SELECT ID_producto, pon_nombre, pon_precio, pon_motivo, pon_ventas, pon_porciones, pon_sabor, pon_relleno, pon_cobertura FROM ponque;	

DROP VIEW IF EXISTS vw_pedido;
CREATE VIEW vw_pedido AS SELECT ID_pedido, ID_cliente, ped_direccion, ped_fecha_creacion, ped_fecha_entrega, ped_estado, ped_costo FROM pedido;

DROP VIEW IF EXISTS vw_comentario;
CREATE VIEW vw_comentario AS SELECT ID_pedido, com_nivelSatisfaccion, com_descripcion FROM comentario;

DROP VIEW IF EXISTS vw_pedido_producto;
CREATE VIEW vw_pedido_producto AS SELECT ID_pedido, ID_producto, pro_nombre, pro_precio, pp_cantidad, pp_total FROM pedido_producto;

DROP VIEW IF EXISTS vw_login_datos;
CREATE VIEW vw_login_datos AS SELECT ID_cliente, login_usuario, login_password FROM login_datos;
