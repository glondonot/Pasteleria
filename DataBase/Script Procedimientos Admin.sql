-- PROCEDIMIENTOS Y FUNCIONES PARA EL ADMINISTRADOR
SELECT * FROM cliente;
-- TABLA CLIENTE
-- READ
DROP PROCEDURE IF EXISTS ADMIN_VISTA_CLIENTE;
DELIMITER $
CREATE PROCEDURE ADMIN_VISTA_CLIENTE (IN nombre varchar(80))
BEGIN
	SELECT * FROM vw_cliente WHERE nombre = cli_nombre;
END;
$$
DELIMITER ;
-- CALL ADMIN_VISTA_CLIENTE('Sandra Guzman');

-- CREAR
DROP PROCEDURE IF EXISTS ADMIN_CREAR_CLIENTE;
DELIMITER $
CREATE PROCEDURE ADMIN_CREAR_CLIENTE (IN id INT, IN nombre varchar(80), IN numero varchar(80), IN correo varchar(80), IN direccion varchar(80))
BEGIN
	INSERT cliente VALUES (id, nombre, numero, correo, direccion);
END;
$$
DELIMITER ;
-- CALL ADMIN_CREAR_CLIENTE(1234567, 'Leonardo Cardenas', 322856915, 'leocardenas@gmail.com', NULL);

-- DELETE
DROP PROCEDURE IF EXISTS ADMIN_BORRAR_CLIENTE;
DELIMITER $$
CREATE PROCEDURE ADMIN_BORRAR_CLIENTE (id INT)
BEGIN
	DELETE FROM cliente WHERE id = ID_cliente;
END;
$$
DELIMITER ;
-- CALL ADMIN_BORRAR_CLIENTE(1234567);

-- UPDATE

DROP PROCEDURE IF EXISTS ADMIN_ACTUALIZAR_CLIENTE;
DELIMITER $$
CREATE PROCEDURE ADMIN_ACTUALIZAR_CLIENTE (IN id INT, IN nombre varchar(80), IN numero varchar(80), IN correo varchar(80), IN direccion varchar(80))
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
END
$$
DELIMITER ;
-- CALL ADMIN_ACTUALIZAR_CLIENTE(1234567, NULL, NULL, 'jpalaciosf@unal.edu.co' , NULL);

-- CREAR LOGIN

DROP PROCEDURE IF EXISTS ADMIN_CREAR_LOGIN;
DELIMITER $
CREATE PROCEDURE ADMIN_CREAR_LOGIN (IN id INT, IN correo varchar(80), IN passwrd varchar(80))
BEGIN
	INSERT into login_datos VALUES (id, correo, passwrd);
END;
$$
DELIMITER ;
-- CALL ADMIN_CREAR_LOGIN(1234567, 'cbuitragom@gmail.com', 322);




-- ANCHETA 

SELECT * FROM ancheta;

-- READ
DROP PROCEDURE IF EXISTS ADMIN_VISTA_ANCHETA;
DELIMITER $
CREATE PROCEDURE ADMIN_VISTA_ANCHETA (IN nombre varchar(80))
BEGIN
	SELECT * FROM vw_acheta WHERE nombre = anc_nombre;
END;
$$
DELIMITER ;
-- CALL ADMIN_VISTA_ANCHETA('Picnic Romantico');

-- CREAR
DROP PROCEDURE IF EXISTS ADMIN_CREAR_ANCHETA;
DELIMITER $
CREATE PROCEDURE ADMIN_CREAR_ANCHETA (IN id INT, IN nombre varchar(80), IN precio INT, IN motivo varchar(80), IN ventas INT)
BEGIN
	INSERT ancheta VALUES (id, nombre, precio,  motivo, ventas);
END;
$$
DELIMITER ;
-- CALL ADMIN_CREAR_ANCHETA(126, 'Sorpresa Frutas', 50000, NULL, 0);

-- UPDATE

DROP PROCEDURE IF EXISTS ADMIN_ACTUALIZAR_ANCHETA;
DELIMITER $$
CREATE PROCEDURE ADMIN_ACTUALIZAR_ANCHETA (IN id INT, IN nombre varchar(80), IN precio INT, IN motivo varchar(80), IN ventas INT)
BEGIN
	IF (nombre IS NULL) THEN
		UPDATE ancheta SET anc_nombre = anc_nombre WHERE ID_producto = id;
	ELSE
		UPDATE ancheta SET anc_nombre = nombre WHERE ID_producto = id;
	END IF;
    IF (precio IS NULL) THEN
		UPDATE ancheta SET anc_precio = anc_precio WHERE ID_producto = id;
	ELSE
		UPDATE ancheta SET anc_precio = precio WHERE ID_producto = id;
	END IF;
    IF ( motivo IS NULL) THEN
		UPDATE ancheta SET anc_motivo = anc_motivo WHERE ID_producto = id;
	ELSE
		UPDATE ancheta SET anc_motivo = motivo WHERE ID_producto = id;
	END IF;
    IF ( ventas IS NULL) THEN
		UPDATE ancheta SET anc_ventas = anc_ventas WHERE ID_producto = id;
	ELSE
		UPDATE ancheta SET anc_ventas = ventas WHERE ID_producto = id;
	END IF;
END
$$
DELIMITER ;
-- CALL ADMIN_ACTUALIZAR_ANCHETA(126, NULL, 60000, NULL, 4);

-- CUPCAKE

SELECT * FROM cupcake;

-- READ
DROP PROCEDURE IF EXISTS ADMIN_VISTA_CUPCAKE;
DELIMITER $
CREATE PROCEDURE ADMIN_VISTA_CUPCAKE (IN nombre varchar(80))
BEGIN
	SELECT * FROM vw_cupcake WHERE nombre = cup_nombre;
END;
$$
DELIMITER ;
-- CALL ADMIN_VISTA_CUPCAKE('Cupcakes de Aniversario');

-- CREAR
DROP PROCEDURE IF EXISTS ADMIN_CREAR_CUPCAKE;
DELIMITER $
CREATE PROCEDURE ADMIN_CREAR_CUPCAKE (IN id INT, IN nombre varchar(80), IN precio varchar(80), IN motivo varchar(80), IN ventas INT, IN unidades INT, IN sabor varchar(80), IN relleno varchar(80), IN cobertura varchar(80))
BEGIN
	INSERT cupcake VALUES (id, nombre, precio, motivo, ventas, unidades, sabor, relleno, cobertura);
END;
$$
DELIMITER ;
-- CALL ADMIN_CREAR_CUPCAKE(127, 'Cupcakes Pink', 21000, NULL, 0, 6, 'Vainilla con semillas de amapola', NULL, 'Buttercream');

-- UPDATE

DROP PROCEDURE IF EXISTS ADMIN_ACTUALIZAR_CUPCAKE;
DELIMITER $$
CREATE PROCEDURE ADMIN_ACTUALIZAR_CUPCAKE (IN id INT, IN nombre varchar(80), IN precio varchar(80), IN motivo varchar(80), IN ventas INT, IN unidades INT, IN sabor varchar(80), IN relleno varchar(80), IN cobertura varchar(80))
BEGIN
	IF (nombre IS NULL) THEN
		UPDATE cupcake SET cup_nombre = cup_nombre WHERE ID_producto = id;
	ELSE
		UPDATE cupcake SET anc_nombre = nombre WHERE ID_producto = id;
	END IF;
    IF (precio IS NULL) THEN
		UPDATE cupcake SET cup_precio = cup_precio WHERE ID_producto = id;
	ELSE
		UPDATE cupcake SET cup_precio = precio WHERE ID_producto = id;
	END IF;
    IF ( motivo IS NULL) THEN
		UPDATE cupcake SET cup_motivo = cup_motivo WHERE ID_producto = id;
	ELSE
		UPDATE cupcake SET cup_motivo = motivo WHERE ID_producto = id;
	END IF;
    IF ( ventas IS NULL) THEN
		UPDATE cupcake SET cup_ventas = cup_ventas WHERE ID_producto = id;
	ELSE
		UPDATE cupcake SET cup_ventas = ventas WHERE ID_producto = id;
	END IF;
    IF (unidades IS NULL) THEN
		UPDATE cupcake SET cup_unidades =cup_unidades WHERE ID_producto = id;
	ELSE
		UPDATE cupcake SET cup_unidades = unidades WHERE ID_producto = id;
	END IF;
    IF (sabor IS NULL) THEN
		UPDATE cupcake SET cup_sabor = cup_sabor WHERE ID_producto = id;
	ELSE
		UPDATE cupcake SET cup_sabor = sabor WHERE ID_producto = id;
	END IF;
	IF (relleno IS NULL) THEN
		UPDATE cupcake SET cup_relleno = cup_relleno WHERE ID_producto = id;
	ELSE
		UPDATE cupcake SET cup_relleno = relleno WHERE ID_producto = id;
	END IF;
    IF (cobertura IS NULL) THEN
		UPDATE cupcake SET cup_cobertura = cup_cobertura WHERE ID_producto = id;
	ELSE
		UPDATE cupcake SET cup_cobertura = cobertura WHERE ID_producto = id;
	END IF;
END
$$
DELIMITER ;
-- CALL ADMIN_ACTUALIZAR_CUPCAKE(127, NULL, 60000, NULL, 4, NULL, 'Vainilla', 'Chocolate', 'Fondant');


-- PONQUE

SELECT * FROM ponque;

-- READ
DROP PROCEDURE IF EXISTS ADMIN_VISTA_PONQUE;
DELIMITER $
CREATE PROCEDURE ADMIN_VISTA_PONQUE (IN nombre varchar(80))
BEGIN
	SELECT * FROM vw_ponque WHERE nombre = pon_nombre;
END;
$$
DELIMITER ;
-- CALL ADMIN_VISTA_PONQUE('Dripcake de cumpleaños');

-- CREAR
DROP PROCEDURE IF EXISTS ADMIN_CREAR_PONQUE;
DELIMITER $
CREATE PROCEDURE ADMIN_CREAR_PONQUE (IN id INT, IN nombre varchar(80), IN precio varchar(80), IN motivo varchar(80), IN ventas INT, IN porciones INT, IN sabor varchar(80), IN relleno varchar(80), IN cobertura varchar(80))
BEGIN
	INSERT ponque VALUES (id, nombre, precio, motivo, ventas, porciones, sabor, relleno, cobertura);
END;
$$
DELIMITER ;
-- CALL ADMIN_CREAR_PONQUE(128, 'Super-Torta', 51000, NULL, 0, 26, 'Naranja', 'Postre de Fresa', 'Fondant');

-- UPDATE

DROP PROCEDURE IF EXISTS ADMIN_ACTUALIZAR_PONQUE;
DELIMITER $$
CREATE PROCEDURE ADMIN_ACTUALIZAR_PONQUE (IN id INT, IN nombre varchar(80), IN precio varchar(80), IN motivo varchar(80), IN ventas INT, IN porciones INT, IN sabor varchar(80), IN relleno varchar(80), IN cobertura varchar(80))
BEGIN
	IF (nombre IS NULL) THEN
		UPDATE ponque SET pon_nombre = pon_nombre WHERE ID_producto = id;
	ELSE
		UPDATE ponque SET pon_nombre = nombre WHERE ID_producto = id;
	END IF;
    IF (precio IS NULL) THEN
		UPDATE ponque SET pon_precio = pon_precio WHERE ID_producto = id;
	ELSE
		UPDATE ponque SET pon_precio = precio WHERE ID_producto = id;
	END IF;
    IF ( motivo IS NULL) THEN
		UPDATE ponque SET pon_motivo = pon_motivo WHERE ID_producto = id;
	ELSE
		UPDATE ponque SET pon_motivo = motivo WHERE ID_producto = id;
	END IF;
    IF ( ventas IS NULL) THEN
		UPDATE ponque SET pon_ventas = pon_ventas WHERE ID_producto = id;
	ELSE
		UPDATE ponque SET pon_ventas = ventas WHERE ID_producto = id;
	END IF;
    IF (porciones IS NULL) THEN
		UPDATE ponque SET pon_porciones = pon_porciones WHERE ID_producto = id;
	ELSE
		UPDATE ponque SET pon_porciones = porciones WHERE ID_producto = id;
	END IF;
    IF (sabor IS NULL) THEN
		UPDATE ponque SET pon_sabor = pon_sabor WHERE ID_producto = id;
	ELSE
		UPDATE ponque SET pon_sabor = sabor WHERE ID_producto = id;
	END IF;
	IF (relleno IS NULL) THEN
		UPDATE ponque SET pon_relleno = pon_relleno WHERE ID_producto = id;
	ELSE
		UPDATE ponque SET pon_relleno = relleno WHERE ID_producto = id;
	END IF;
    IF (cobertura IS NULL) THEN
		UPDATE ponque SET pon_cobertura = pon_cobertura WHERE ID_producto = id;
	ELSE
		UPDATE ponque SET pon_cobertura = cobertura WHERE ID_producto = id;
	END IF;
END
$$
DELIMITER ;
-- CALL ADMIN_ACTUALIZAR_PONQUE(128, NULL, 50000, NULL, 3, NULL, 'Chocolate', 'Crema chantilly', 'Masmelo');


-- UTILIDAD 
SELECT * FROM utilidad;

-- READ
DROP PROCEDURE IF EXISTS ADMIN_VISTA_UTILIDAD;
DELIMITER $
CREATE PROCEDURE ADMIN_VISTA_UTILIDAD (IN id INT)
BEGIN
	SELECT * FROM vw_utilidad WHERE ID_producto = id;
END;
$$
DELIMITER ;
-- CALL ADMIN_VISTA_UTILIDAD(100);

-- CREAR
DROP PROCEDURE IF EXISTS ADMIN_CREAR_UTILIDAD;
DELIMITER $
CREATE PROCEDURE ADMIN_CREAR_UTILIDAD (IN id INT, IN Pganancia INT, IN costo INT, IN ganancia INT)
BEGIN
	INSERT utilidad VALUES (id, Pganancia, costo, ganancia);
END;
$$
DELIMITER ;
-- CALL ADMIN_CREAR_UTILIDAD(128, 20, 40000, 10000);

-- UPDATE

DROP PROCEDURE IF EXISTS ADMIN_ACTUALIZAR_UTILIDAD;
DELIMITER $$
CREATE PROCEDURE ADMIN_ACTUALIZAR_UTILIDAD (IN id INT, IN Pganancia INT, IN costo INT, IN ganancia INT)
BEGIN
	IF (Pganancia IS NULL) THEN
		UPDATE utilidad SET uti_Pganancia = uti_Pganancia WHERE ID_producto = id;
	ELSE
		UPDATE utilidad SET uti_Pganancia =  Pganancia WHERE ID_producto = id;
	END IF;
    IF (costo IS NULL) THEN
		UPDATE utilidad SET uti_costo = uti_costo WHERE ID_producto = id;
	ELSE
		UPDATE utilidad SET uti_costo = costo WHERE ID_producto = id;
	END IF;
    IF (ganancia IS NULL) THEN
		UPDATE utilidad SET uti_ganancia = uti_ganancia WHERE ID_producto = id;
	ELSE
		UPDATE utilidad SET uti_ganancia = ganancia WHERE ID_producto = id;
	END IF;
END
$$
DELIMITER ;
-- CALL ADMIN_ACTUALIZAR_UTILIDAD(100, 30, 94500, 40500);



-- PEDIDO 
SELECT * FROM pedido;

-- READ
DROP PROCEDURE IF EXISTS ADMIN_VISTA_PEDIDO;
DELIMITER $
CREATE PROCEDURE ADMIN_VISTA_PEDIDO (IN id INT)
BEGIN
	SELECT * FROM vw_pedido WHERE ID_pedido = id;
END;
$$
DELIMITER ;
-- CALL ADMIN_VISTA_PEDIDO(1000);

-- CREAR
DROP PROCEDURE IF EXISTS ADMIN_CREAR_PEDIDO;
DELIMITER $
CREATE PROCEDURE ADMIN_CREAR_PEDIDO (IN id INT, IN id_c INT, IN direccion varchar(80), IN fecha_creacion varchar(80), IN fecha_entrega varchar(80), IN estado varchar(80), IN costo INT)
BEGIN
	INSERT pedido VALUES (id, id_c, direccion, fecha_creacion, fecha_entrega, estado, costo);
END;
$$
DELIMITER ;
-- CALL ADMIN_CREAR_PEDIDO(1014, 52267126, 'cra 20A #171-31', '2022-11-04' , '2022-11-07', 'Entregado', 42000);

-- UPDATE

DROP PROCEDURE IF EXISTS ADMIN_ACTUALIZAR_PEDIDO;
DELIMITER $$
CREATE PROCEDURE ADMIN_ACTUALIZAR_PEDIDO (IN id INT, IN id_c INT, IN direccion varchar(80), IN fecha_creacion varchar(80), IN fecha_entrega varchar(80), IN estado varchar(80), IN costo INT)
BEGIN
	IF (id_c IS NULL) THEN
		UPDATE pedido SET ID_cliente = ID_cliente WHERE ID_pedido = id;
	ELSE
		UPDATE pedido SET ID_cliente = id_c WHERE ID_pedido = id;
	END IF;
    IF (direccion IS NULL) THEN
		UPDATE pedido SET ped_direccion = ped_direccion WHERE ID_pedido = id;
	ELSE
		UPDATE pedido SET ped_direccion = direccion WHERE ID_pedido = id;
	END IF;
    IF (fecha_creacion IS NULL) THEN
		UPDATE pedido SET ped_fecha_creacion = ped_fecha_creacion WHERE ID_pedido = id;
	ELSE
		UPDATE pedido SET ped_fecha_creacion = fecha_creacion WHERE ID_pedido = id;
	END IF;
    IF (fecha_entrega IS NULL) THEN
		UPDATE pedido SET ped_fecha_entrega = ped_fecha_entrega WHERE ID_pedido = id;
	ELSE
		UPDATE pedido SET ped_fecha_entrega = fecha_entrega WHERE ID_pedido = id;
	END IF;
    IF (estado IS NULL) THEN
		UPDATE pedido SET ped_estado = ped_estado WHERE ID_pedido = id;
	ELSE
		UPDATE pedido SET ped_estado = estado WHERE ID_pedido = id;
	END IF;
    IF (costo IS NULL) THEN
		UPDATE pedido SET ped_costo = ped_costo WHERE ID_pedido = id;
	ELSE
		UPDATE pedido SET ped_costo = costo WHERE ID_pedido = id;
	END IF;
END
$$
DELIMITER ;
-- CALL ADMIN_ACTUALIZAR_PEDIDO(1000, 52267126, NULL, NULL, '2022-01-07', 'Entregado', NULL);


-- Admin procedimiento read vw_comentario;
DROP PROCEDURE IF EXISTS ADMIN_VISTA_COMENTARIO;
DELIMITER $$
CREATE PROCEDURE ADMIN_VISTA_COMENTARIO (IN ID INT)
BEGIN
	SELECT * FROM vw_comentario WHERE ID = ID_pedido;
END $$
DELIMITER ;
-- CALL ADMIN_VISTA_COMENTARIO(1000);
