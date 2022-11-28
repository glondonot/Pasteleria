-- PROCEDIMIENTOS CLIENTE

-- TABLA CLIENTE

SELECT *FROM cliente;

-- READ
DROP PROCEDURE IF EXISTS CLIENTE_VISTA_CLIENTE;
DELIMITER $$
CREATE PROCEDURE CLIENTE_VISTA_CLIENTE (IN ID INT)
BEGIN
	SELECT * FROM vw_cliente WHERE ID = ID_cliente;
END $$
DELIMITER ;
CALL CLIENTE_VISTA_CLIENTE(1032356059);

-- UPDATE
DROP PROCEDURE IF EXISTS CLIENTE_ACTUALIZAR_CLIENTE;
DELIMITER $$
CREATE PROCEDURE CLIENTE_ACTUALIZAR_CLIENTE (IN id INT, IN nombre varchar(80), IN numero varchar(80), IN correo varchar(80), IN direccion varchar(80))
BEGIN
	IF (nombre IS NULL) THEN
		UPDATE cliente SET cli_nombre = cli_nombre WHERE ID_cliente = id;
	ELSE
		UPDATE cliente SET cli_nombre = nombre WHERE ID_cliente = id;
	END IF;
    IF (numero IS NULL) THEN
		UPDATE cliente SET cli_numero = cli_numero WHERE ID_cliente = id;
	ELSE
		UPDATE cliente SET cli_numero = numero WHERE ID_cliente = id;
	END IF;
    IF (correo IS NULL) THEN
		UPDATE cliente SET cli_correo = cli_correo WHERE ID_cliente = id;
	ELSE
		UPDATE cliente SET cli_correo = correo WHERE ID_cliente = id;
	END IF;
    IF (direccion IS NULL) THEN
		UPDATE cliente SET cli_direccion = cli_direccion WHERE ID_cliente = id;
	ELSE
		UPDATE cliente SET cli_direccion = direccion WHERE ID_cliente = id;
	END IF;
END $$
DELIMITER ;
CALL CLIENTE_ACTUALIZAR_CLIENTE(1032356059, 'Gabriela Guzman Rivera', NULL, 'gabyguzman.rivera@gmail.com' , NULL);

-- CREATE 

DROP PROCEDURE IF EXISTS CLIENTE_CREAR_CLIENTE;
DELIMITER $$
CREATE PROCEDURE CLIENTE_CREAR_CLIENTE (IN id INT, IN nombre varchar(80), IN numero varchar(80), IN correo varchar(80), IN direccion varchar(80))
BEGIN
	INSERT cliente VALUES (id, nombre, numero, correo, direccion);
END $$
DELIMITER ;
CALL CLIENTE_CREAR_CLIENTE(1234567, 'Leonardo Cardenas', 322856915, 'leocardenas@gmail.com', NULL);

-- DELETE

DROP PROCEDURE IF EXISTS CLIENTE_BORRAR_CLIENTE;
DELIMITER $$
CREATE PROCEDURE CLIENTE_BORRAR_CLIENTE (IN id INT)
BEGIN
	DELETE FROM cliente WHERE id = ID_cliente;
END $$
DELIMITER ;
CALL CLIENTE_BORRAR_CLIENTE(1234567);





-- TABLA ANCHETA

SELECT * FROM ancheta;

-- READ
DROP PROCEDURE IF EXISTS CLIENTE_VISTA_ANCHETA_NOMBRE;
DELIMITER $$
CREATE PROCEDURE CLIENTE_VISTA_ANCHETA_NOMBRE (IN nombre varchar(80))
BEGIN
	SELECT * FROM vw_ancheta WHERE nombre = anc_nombre;
END;
$$
DELIMITER ;
CALL CLIENTE_VISTA_ANCHETA_NOMBRE('Picnic Romantico');

DROP PROCEDURE IF EXISTS CLIENTE_VISTA_ANCHETA_PRECIO;
DELIMITER $$
CREATE PROCEDURE CLIENTE_VISTA_ANCHETA_PRECIO (IN precio INT)
BEGIN
	SELECT * FROM vw_ancheta WHERE precio = anc_precio;
END;
$$
DELIMITER ;
CALL CLIENTE_VISTA_ANCHETA_PRECIO(180000);

DROP PROCEDURE IF EXISTS CLIENTE_VISTA_ANCHETA_MOTIVO;
DELIMITER $$
CREATE PROCEDURE CLIENTE_VISTA_ANCHETA_MOTIVO (IN motivo varchar(80))
BEGIN
	SELECT * FROM vw_ancheta WHERE motivo = anc_motivo;
END;
$$
DELIMITER ;
CALL CLIENTE_VISTA_ANCHETA_MOTIVO('Dia del Padre');




-- TABLA CUPCAKE

-- READ
DROP PROCEDURE IF EXISTS CLIENTE_VISTA_CUPCAKE_NOMBRE;
DELIMITER $$
CREATE PROCEDURE CLIENTE_VISTA_CUPCAKE_NOMBRE (IN nombre varchar(80))
BEGIN
	SELECT * FROM vw_cupcake WHERE nombre = cup_nombre;
END;
$$
DELIMITER ;
CALL CLIENTE_VISTA_CUPCAKE_NOMBRE('Cupcakes de Aniversario');

DROP PROCEDURE IF EXISTS CLIENTE_VISTA_CUPCAKE_PRECIO;
DELIMITER $$
CREATE PROCEDURE CLIENTE_VISTA_CUPCAKE_PRECIO (IN precio INT)
BEGIN
	SELECT * FROM vw_cupcake WHERE precio = cup_precio;
END;
$$
DELIMITER ;
CALL CLIENTE_VISTA_CUPCAKE_PRECIO(21000);

DROP PROCEDURE IF EXISTS CLIENTE_VISTA_CUPCAKE_MOTIVO;
DELIMITER $$
CREATE PROCEDURE CLIENTE_VISTA_CUPCAKE_MOTIVO (IN motivo varchar(80))
BEGIN
	SELECT * FROM vw_cupcake WHERE motivo = cup_motivo;
END;
$$
DELIMITER ;
CALL  CLIENTE_VISTA_CUPCAKE_MOTIVO('Dia de la Madre');

DROP PROCEDURE IF EXISTS CLIENTE_VISTA_CUPCAKE_SABOR;
DELIMITER $$
CREATE PROCEDURE CLIENTE_VISTA_CUPCAKE_SABOR (IN sabor varchar(80))
BEGIN
	SELECT * FROM vw_cupcake WHERE sabor = cup_sabor;
END;
$$
DELIMITER ;
CALL  CLIENTE_VISTA_CUPCAKE_SABOR('Vainilla');





-- TABLA PONQUE

-- READ

DROP PROCEDURE IF EXISTS CLIENTE_VISTA_PONQUE_NOMBRE;
DELIMITER $$
CREATE PROCEDURE CLIENTE_VISTA_PONQUE_NOMBRE (IN nombre varchar(80))
BEGIN
	SELECT * FROM vw_ponque WHERE nombre = pon_nombre;
END;
$$
DELIMITER ;
CALL CLIENTE_VISTA_PONQUE_NOMBRE('Mousse de Maracuyá Mediano');

DROP PROCEDURE IF EXISTS CLIENTE_VISTA_PONQUE_PRECIO;
DELIMITER $$
CREATE PROCEDURE CLIENTE_VISTA_PONQUE_PRECIO (IN precio INT)
BEGIN
	SELECT * FROM vw_ponque WHERE precio = pon_precio;
END;
$$
DELIMITER ;
CALL CLIENTE_VISTA_PONQUE_PRECIO(48000);

DROP PROCEDURE IF EXISTS CLIENTE_VISTA_PONQUE_MOTIVO;
DELIMITER $$
CREATE PROCEDURE CLIENTE_VISTA_PONQUE_MOTIVO (IN motivo varchar(80))
BEGIN
	SELECT * FROM vw_ponque WHERE motivo = pon_motivo;
END;
$$
DELIMITER ;
CALL CLIENTE_VISTA_PONQUE_MOTIVO('Cumpleaños');

DROP PROCEDURE IF EXISTS CLIENTE_VISTA_PONQUE_SABOR;
DELIMITER $$
CREATE PROCEDURE CLIENTE_VISTA_PONQUE_SABOR (IN sabor varchar(80))
BEGIN
	SELECT * FROM vw_ponque WHERE sabor = pon_sabor;
END;
$$
DELIMITER ;
CALL  CLIENTE_VISTA_PONQUE_SABOR('Chocolate');

DROP PROCEDURE IF EXISTS CLIENTE_VISTA_PONQUE_PORCIONES;
DELIMITER $$
CREATE PROCEDURE CLIENTE_VISTA_PONQUE_PORCIONES (IN porciones INT)
BEGIN
	SELECT * FROM vw_ponque WHERE porciones = pon_porciones;
END;
$$
DELIMITER ;
CALL CLIENTE_VISTA_PONQUE_PORCIONES(10);









-- TABLA PEDIDO


-- READ
DROP PROCEDURE IF EXISTS CLIENTE_VISTA_PEDIDO_ID_PEDIDO;
DELIMITER $$
CREATE PROCEDURE CLIENTE_VISTA_PEDIDO_ID_PEDIDO (IN ID INT, IN id_c INT)
BEGIN
	SELECT * FROM vw_pedido WHERE ID = ID_pedido AND id_c = ID_cliente;
END $$
DELIMITER ;
CALL CLIENTE_VISTA_PEDIDO_ID_PEDIDO(1000, 52267126);

DROP PROCEDURE IF EXISTS CLIENTE_VISTA_PEDIDOS_ID_CLIENTE;
DELIMITER $$
CREATE PROCEDURE CLIENTE_VISTA_PEDIDOS_ID_CLIENTE (IN ID INT)
BEGIN
	SELECT * FROM vw_pedido WHERE ID = ID_cliente;
END $$
DELIMITER ;
CALL CLIENTE_VISTA_PEDIDOS_ID_CLIENTE(1032356059);

DROP PROCEDURE IF EXISTS CLIENTE_VISTA_PEDIDO_FECHA_CREACION;
DELIMITER $$
CREATE PROCEDURE CLIENTE_VISTA_PEDIDO_FECHA_CREACION (IN ID INT, IN fecha date)
BEGIN
	SELECT * FROM vw_pedido WHERE ped_fecha_creacion = fecha AND ID = ID_cliente;
END $$
DELIMITER ;
CALL CLIENTE_VISTA_PEDIDO_FECHA_CREACION(1032356059, '2022-10-29');

DROP PROCEDURE IF EXISTS CLIENTE_VISTA_PEDIDO_FECHA_ENTREGA;
DELIMITER $$
CREATE PROCEDURE CLIENTE_VISTA_PEDIDO_FECHA_ENTREGA (IN ID INT, IN fecha date)
BEGIN
	SELECT * FROM vw_pedido WHERE ped_fecha_entrega = fecha AND ID = ID_cliente;
END $$
DELIMITER ;
CALL CLIENTE_VISTA_PEDIDO_FECHA_ENTREGA(1032356059, '2022-10-31');

DROP PROCEDURE IF EXISTS CLIENTE_VISTA_PEDIDO_COSTO;
DELIMITER $$
CREATE PROCEDURE CLIENTE_VISTA_PEDIDO_COSTO (IN ID INT, IN costo INT)
BEGIN
	SELECT * FROM vw_pedido WHERE ped_costo = costo AND ID = ID_cliente;
END $$
DELIMITER ;
CALL CLIENTE_VISTA_PEDIDO_COSTO (1032356059, 80000);

DROP PROCEDURE IF EXISTS CLIENTE_VISTA_PEDIDO_ESTADO;
DELIMITER $$
CREATE PROCEDURE CLIENTE_VISTA_PEDIDO_ESTADO (IN ID INT, IN estado varchar(80))
BEGIN
	SELECT * FROM vw_pedido WHERE ped_estado = estado AND ID = ID_cliente;
END $$
DELIMITER ;
CALL CLIENTE_VISTA_PEDIDO_ESTADO (1032356058, 'Entregado');


-- DELETE O CANCELAR PEDIDO

SELECT * FROM pedido;
SELECT * FROM pedido_producto;

DROP PROCEDURE IF EXISTS CLIENTE_BORRAR_PEDIDO;
DELIMITER $$
CREATE PROCEDURE CLIENTE_BORRAR_PEDIDO(IN id INT, IN id_c INT)
BEGIN
	DECLARE det_pedido INT;
    DECLARE estado VARCHAR(80);
    SELECT ped_estado INTO estado FROM vw_pedido WHERE ID_pedido = id AND id_c = ID_cliente;
    SELECT COUNT(ID_pedido) INTO det_pedido FROM vw_pedido_producto WHERE ID_pedido = id;
    IF det_pedido > 0 AND estado = 'Realizando' THEN
		CALL BORRAR_PEDIDO_PRODUCTO(id);
	END IF;
    DELETE FROM vw_pedido where ID_pedido = id AND id_c = ID_cliente AND ped_estado = 'Realizando';
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS CLIENTE_BORRAR_PEDIDO_PRODUCTO;
DELIMITER $$
CREATE PROCEDURE CLIENTE_BORRAR_PEDIDO_PRODUCTO (IN id INT)
BEGIN
	DELETE FROM	vw_pedido_producto WHERE id = ID_pedido;
END;
$$
DELIMITER ;
CALL CLIENTE_BORRAR_PEDIDO (1000, 52267126);






-- TABLA PEDIDO_PRODUCTO

-- READ

DROP PROCEDURE IF EXISTS CLIENTE_VISTA_PEDIDO_PRODUCTO;
DELIMITER $$
CREATE PROCEDURE CLIENTE_VISTA_PEDIDO_PRODUCTO (IN ID INT, IN id_c INT)
BEGIN
	DECLARE confirmacion INT;
    SELECT ID_cliente INTO confirmacion FROM vw_pedido WHERE ID = ID_pedido;
	IF confirmacion = id_c THEN 
		SELECT * FROM vw_pedido_producto WHERE ID = ID_pedido;
	END IF;
END $$
DELIMITER ;
CALL CLIENTE_VISTA_PEDIDO_PRODUCTO(1014, 1032356059);


-- TABLA COMENTARIO

SELECT * FROM vw_comentario;

-- READ
DROP PROCEDURE IF EXISTS CLIENTE_VISTA_COMENTARIO;
DELIMITER $$
CREATE PROCEDURE CLIENTE_VISTA_COMENTARIO (IN id INT, IN id_c INT)
BEGIN
	DECLARE confirmacion INT;
    SELECT ID_cliente INTO confirmacion FROM vw_pedido WHERE id = ID_pedido;
	IF confirmacion = id_c THEN 
		SELECT * FROM vw_comentario WHERE ID = ID_pedido;
	END IF;
END $$
DELIMITER ;
CALL CLIENTE_VISTA_COMENTARIO(1000, 52267126);


-- CREATE 
DROP PROCEDURE IF EXISTS CLIENTE_CREACION_COMENTARIO;
DELIMITER $$
CREATE PROCEDURE CLIENTE_CREACION_COMENTARIO (IN id INT, IN id_c INT, IN c_satisfaccion tinyint, IN c_descripcion varchar(80))
BEGIN
	DECLARE confirmacion INT;
    SELECT ID_cliente INTO confirmacion FROM vw_pedido WHERE id = ID_pedido;
	IF confirmacion = id_c THEN 
		INSERT vw_comentario VALUES (id, c_satisfaccion, c_descripcion);
	END IF;
END $$
DELIMITER ;
CALL CLIENTE_CREACION_COMENTARIO(1014, 1032356059, 10, 'Muy lindo');


-- ACTUALIZAR

DROP PROCEDURE IF EXISTS CLIENTE_ACTUALIZAR_COMENTARIO;
DELIMITER $$
CREATE PROCEDURE CLIENTE_ACTUALIZAR_COMENTARIO (IN id INT, IN id_c INT, IN c_satisfaccion tinyint, IN c_descripcion varchar(80))
BEGIN
	DECLARE confirmacion INT;
    SELECT ID_cliente INTO confirmacion FROM vw_pedido WHERE id = ID_pedido;
	IF confirmacion = id_c THEN 
		IF (c_satisfaccion IS NULL) THEN
			UPDATE comentario SET com_nivelSatisfaccion = com_nivelSatisfaccion WHERE ID_pedido = id;
		ELSE
			UPDATE comentario SET com_nivelSatisfaccion = c_satisfaccion WHERE ID_pedido = id;
		END IF;
		IF (c_descripcion IS NULL) THEN
			UPDATE comentario SET com_descripcion = com_descripcion WHERE ID_pedido = id;
		ELSE
			UPDATE comentario SET com_descripcion = c_descripcion WHERE ID_pedido = id;
		END IF;
	END IF;
END $$
DELIMITER ;
CALL CLIENTE_ACTUALIZAR_COMENTARIO(1000, 52267126 , 8, 'UN POCO DULCE');

-- DELETE 

DROP PROCEDURE IF EXISTS CLIENTE_BORRAR_COMENTARIO;
DELIMITER $$
CREATE PROCEDURE CLIENTE_BORRAR_COMENTARIO (IN id INT, IN id_c INT)
BEGIN
	DECLARE confirmacion INT;
    SELECT ID_cliente INTO confirmacion FROM vw_pedido WHERE id = ID_pedido;
	IF confirmacion = id_c THEN 
		DELETE FROM comentario WHERE id = ID_pedido;
	END IF;
END $$
DELIMITER ;
CALL CLIENTE_BORRAR_COMENTARIO(1001, 1000356059);





-- CREACION DE UN PEDIDO Y SU DETALLE CON FUNCION

SELECT * FROM pedido;
SELECT * FROM pedido_producto;

DROP FUNCTION IF EXISTS TOTAL_PEDIDO;
DELIMITER $$
CREATE FUNCTION TOTAL_PEDIDO(id INT)
RETURNS INT
BEGIN
	DECLARE total INT DEFAULT 0;
    SELECT SUM(pp_total) INTO total FROM vw_pedido_producto WHERE id = ID_pedido;
    IF total IS NULL THEN
		SET total = 0;
	END IF;
    UPDATE vw_pedido SET ped_costo = total WHERE id = ID_pedido;
RETURN total;
END $$
DELIMITER ;

SET @total = TOTAL_PEDIDO(1014);
SELECT @total;


DROP FUNCTION IF EXISTS TOTAL_PEDIDO_PRODUCTO;
DELIMITER $$
CREATE FUNCTION TOTAL_PEDIDO_PRODUCTO(cantidad INT, precio INT)
RETURNS INT
BEGIN
	DECLARE subtotal INT DEFAULT 0;
	SET subtotal = cantidad * precio;
RETURN subtotal;
END $$
DELIMITER ;

SET @subtotal = TOTAL_PEDIDO_PRODUCTO(1, 135000);
SELECT @subtotal;



DROP PROCEDURE IF EXISTS CLIENTE_CREACION_PEDIDO;
DELIMITER $$
CREATE PROCEDURE CLIENTE_CREACION_PEDIDO(IN id INT, IN id_c INT, IN direccion varchar(80), IN fecha_creacion date, IN fecha_entrega date, IN estado varchar(80), IN costo INT)
BEGIN
	IF costo IS NULL THEN
		SET costo = 0;
	END IF;
	INSERT vw_pedido VALUES (id, id_c, direccion, fecha_creacion, fecha_entrega, estado, costo);
END $$
DELIMITER $$
CALL CLIENTE_CREACION_PEDIDO (1014, 1032356059, 'cra 20A #171-31', '2022-11-25', '2022-11-30', 'Entregado', @total);


DROP PROCEDURE IF EXISTS CLIENTE_CREACION_PEDIDO_PRODUCTO;
DELIMITER $$
CREATE PROCEDURE CLIENTE_CREACION_PEDIDO_PRODUCTO(IN id INT, IN id_p INT, IN nombre varchar(80), IN precio INT, IN cantidad INT, IN total INT)
BEGIN
	IF total IS NULL THEN
		SET total = 0;
	END IF;
	INSERT vw_pedido_producto VALUES (id, id_p, nombre, precio, cantidad, total);
END $$
DELIMITER $$
CALL CLIENTE_CREACION_PEDIDO_PRODUCTO(1014, 111, 'Cupcakes de Aniversario' , 21000, 2, @subtotal);
CALL CLIENTE_CREACION_PEDIDO_PRODUCTO(1014, 100, 'Ancheta de Cumpleaños', 135000, 1, @subtotal);

