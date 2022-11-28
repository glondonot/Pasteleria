-- CLIENTES

CREATE INDEX indice_cli_nombre ON cliente(cli_nombre);
SHOW INDEX FROM cliente;
-- SELECT * FROM cliente;
DROP INDEX indice_cli_nombre ON cliente;

-- ANCHETAS 

CREATE INDEX indice_anc_nombre ON ancheta(anc_nombre);
-- SHOW INDEX FROM ancheta;
-- SELECT * FROM ancheta;
-- DROP INDEX indice_anc_nombre ON ancheta;

CREATE INDEX indice_anc_precio ON ancheta(anc_precio);
-- SHOW INDEX FROM ancheta;
-- SELECT * FROM ancheta;
-- DROP INDEX indice_anc_precio ON ancheta;

CREATE INDEX indice_anc_motivo ON ancheta(anc_motivo);
-- SHOW INDEX FROM ancheta;
-- SELECT * FROM ancheta;
-- DROP INDEX indice_anc_motivo ON ancheta;

-- CUPCAKES

CREATE INDEX indice_cup_nombre ON cupcake(cup_nombre);
-- SHOW INDEX FROM cupcake;
-- SELECT * FROM cupcake;
-- DROP INDEX indice_cup_nombre ON cupcake;

CREATE INDEX indice_cup_precio ON cupcake(cup_precio);
-- SHOW INDEX FROM cupcake;
-- SELECT * FROM cupcake;
-- DROP INDEX indice_cup_precio ON cupcake;

CREATE INDEX indice_cup_motivo ON cupcake(cup_motivo);
-- SHOW INDEX FROM cupcake;
-- SELECT * FROM cupcake;
-- DROP INDEX indice_cup_motivo ON cupcake;

CREATE INDEX indice_cup_sabor ON cupcake(cup_sabor);
-- SHOW INDEX FROM cupcake;
-- SELECT * FROM cupcake;
-- DROP INDEX indice_cup_sabor ON cupcake;

-- PONQUE 

CREATE INDEX indice_pon_nombre ON ponque(pon_nombre);
-- SHOW INDEX FROM ponque;
-- SELECT * FROM ponque;
-- DROP INDEX indice_pon_nombre ON ponque;

CREATE INDEX indice_pon_precio ON ponque(pon_precio);
-- SHOW INDEX FROM ponque;
-- SELECT * FROM ponque;
-- DROP INDEX indice_pon_precio ON ponque;

CREATE INDEX indice_pon_motivo ON ponque(pon_motivo);
-- SHOW INDEX FROM ponque;
-- SELECT * FROM ponque;
-- DROP INDEX indice_pon_motivo ON ponque;

CREATE INDEX indice_pon_porciones ON ponque(pon_porciones);
-- SHOW INDEX FROM ponque;
-- SELECT * FROM ponque;
-- DROP INDEX indice_pon_porciones ON ponque;

CREATE INDEX indice_pon_sabor ON ponque(pon_sabor);
-- SHOW INDEX FROM ponque;
-- SELECT * FROM ponque;
-- DROP INDEX indice_pon_sabor ON ponque;

-- UTILIDAD 

CREATE INDEX indice_uti_Pganancia ON utilidad(uti_Pganancia);
-- SHOW INDEX FROM utilidad;
-- SELECT * FROM utilidad;
-- DROP INDEX indice_uti_Pganancia ON utilidad;

CREATE INDEX indice_uti_costo ON utilidad(uti_costo);
-- SHOW INDEX FROM utilidad;
-- SELECT * FROM utilidad;
-- DROP INDEX indice_uti_costo ON utilidad;

CREATE INDEX indice_uti_ganancia ON utilidad(uti_ganancia);
-- SHOW INDEX FROM utilidad;
-- SELECT * FROM utilidad;
-- DROP INDEX indice_uti_ganancia ON utilidad;

-- PEDIDO 
CREATE INDEX indice_ped_fecha_creacion ON pedido(ped_fecha_creacion);
-- SHOW INDEX FROM pedido;
-- SELECT * FROM pedido;
-- DROP INDEX indice_ped_fecha_creacion ON pedido;

CREATE INDEX indice_ped_fecha_entrega ON pedido(ped_fecha_entrega);
-- SHOW INDEX FROM pedido;
-- SELECT * FROM pedido;
-- DROP INDEX indice_ped_fecha_entrega ON pedido;

CREATE INDEX indice_ped_estado ON pedido(ped_estado);
-- SHOW INDEX FROM pedido;
-- SELECT * FROM pedido;
-- DROP INDEX indice_ped_estado ON pedido;

CREATE INDEX indice_ped_costo ON pedido(ped_costo);
-- SHOW INDEX FROM pedido;
-- SELECT * FROM pedido;
-- DROP INDEX indice_ped_costo ON pedido;

-- PEDIDO_PRODUCTO

CREATE INDEX indice_producto ON pedido_producto(ID_producto);
-- SHOW INDEX FROM pedido_producto;
-- SELECT * FROM pedido_producto;
DROP INDEX indice_producto ON pedido_producto;

CREATE INDEX indice_pp_total ON pedido_producto(pp_total);
-- SHOW INDEX FROM pedido_producto;
-- SELECT * FROM pedido_producto;
-- DROP INDEX indice_pp_total ON pedido_producto;

-- COMENTARIO

CREATE INDEX indice_com_nivelSatisfaccion ON comentario(com_nivelSatisfaccion);
-- SHOW INDEX FROM comentario;
-- SELECT * FROM comentario;
-- DROP INDEX indice_com_nivelSatisfaccion ON comentario;

-- INVENTARIO

CREATE INDEX indice_nom_insumo ON inventario(nom_insumo);
-- SHOW INDEX FROM inventario;
-- SELECT * FROM inventario;
-- DROP INDEX indice_nom_insumo ON inventario;

-- PREPARACION 

CREATE INDEX indice_nom_insumo ON preparacion(nom_insumo);
-- SHOW INDEX FROM preparacion;
-- SELECT * FROM preparacion;
-- DROP INDEX indice_nom_insumo ON preparacion;

-- COMPRA

CREATE INDEX indice_comp_fecha_entrega ON compra(comp_fecha_entrega);
-- SHOW INDEX FROM compra;
-- SELECT * FROM compra;
-- DROP INDEX indice_comp_fecha_entrega ON compra;

CREATE INDEX indice_comp_costo ON compra(comp_costo);
-- SHOW INDEX FROM compra;
-- SELECT * FROM compra;
-- DROP INDEX indice_comp_costo ON compra;

-- COMPRA INVENTARIO 

CREATE INDEX indice_nom_insumo ON compra_inventario(nom_insumo);
-- SHOW INDEX FROM compra_inventario;
-- SELECT * FROM compra_inventario;
-- DROP INDEX indice_nom_insumo ON compra_inventario;

CREATE INDEX indice_ci_total ON compra_inventario(ci_total);
-- SHOW INDEX FROM compra_inventario;
-- SELECT * FROM compra_inventario;
-- DROP INDEX indice_ci_total ON compra_inventario;

CREATE INDEX indice_ci_nomLugar ON compra_inventario(ci_nomLugar);
-- SHOW INDEX FROM compra_inventario;
-- SELECT * FROM compra_inventario;
-- DROP INDEX indice_ci_nomLugar ON compra_inventario;
