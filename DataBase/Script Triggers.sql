DROP TRIGGER IF EXISTS REESTABLECER_CONTEO;
DELIMITER $$
CREATE TRIGGER REESTABLECER_CONTEO BEFORE UPDATE ON pedido
FOR EACH ROW BEGIN
	SET	@TOTAL_PEDIDOS = 0;
END;
$$
DELIMITER ;
SELECT @TOTAL_PEDIDOS;

DROP TRIGGER IF EXISTS CONTEO_PEDIDOS;
DELIMITER $$
CREATE TRIGGER CONTEO_PEDIDOS AFTER UPDATE ON pedido
FOR EACH ROW BEGIN
	SET	@TOTAL_PEDIDOS = (SELECT COUNT(*) FROM vw_pedido WHERE ID_cliente = NEW.ID_cliente);
END;
$$
DELIMITER ;
SELECT @TOTAL_PEDIDOS;

DROP TRIGGER IF EXISTS RESTAURAR_CONTEO;
DELIMITER $$
CREATE TRIGGER RESTAURAR_CONTEO AFTER DELETE ON pedido
FOR EACH ROW BEGIN
	SET	@TOTAL_PEDIDOS = (SELECT COUNT(*) FROM vw_pedido WHERE ID_cliente = OLD.ID_cliente);
END;
$$
DELIMITER ;
SELECT @TOTAL_PEDIDOS;