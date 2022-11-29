-- CREATE SCHEMA MariaCamilaPasteleria;
USE MariaCamilaPasteleria;

DROP TABLE IF EXISTS compra_inventario;
DROP TABLE IF EXISTS compra;
DROP TABLE IF EXISTS preparacion;
DROP TABLE IF EXISTS inventario;
DROP TABLE IF EXISTS comentario;
DROP TABLE IF EXISTS pedido_producto;
DROP TABLE IF EXISTS pedido;
DROP TABLE IF EXISTS utilidad;
DROP TABLE IF EXISTS ancheta;
DROP TABLE IF EXISTS cupcake;
DROP TABLE IF EXISTS ponque;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS login_datos;

CREATE TABLE cliente
(
	ID_cliente	 			int	 		 PRIMARY KEY, 
    cli_nombre				varchar(80)	 NOT NULL,
    cli_numero				int			 NOT NULL,
    cli_correo				varchar(80)	 NOT NULL,
    cli_direccion			varchar(80)	 NULL
);

insert into cliente values(	1032356059, 'Gabriela Guzman'	 , 3228405897, 'gguzmanr@unal.edu.co'    , 'cra 20A #171-31');
insert into cliente values(	1032356058, 'Gabriel Londoño'	 , 3102393679, 'glondonot@unal.edu.co'   , 'cra 19A #30-11');
insert into cliente values(	1032356057, 'Brandon Forero' 	 , 3213131687, 'bforerob@unal.edu.co'    , 'cra 18A #75-90');
insert into cliente values(	1000381967, 'Juan Esteban Hunter', 3188387926, 'jhunter@unal.edu.co'     , 'cra 7F #145-75');
insert into cliente values(	1026381706, 'Gabriela Gallegos'  , 3228968052, 'ggallegosr@unal.edu.co'  , NULL);
insert into cliente values(	1000356059, 'Omar David Toledo'  , 3226235226, 'otoledol@unal.edu.co'    , NULL);
insert into cliente values(	1032381967, 'Santiago Restrepo'  , 3209866614, 'srestreporo@unal.edu.co' , 'cra 10B #63-80');
insert into cliente values(	52267126  , 'Sandra Guzman'      , 3165385502, 'sgcortazar@hotmal.com'   , 'cra 20A #171-31');
insert into cliente values( 1038123456, 'Gonzalo Molano'     , 3178953801, 'gonzalomolanos@gmail.com', 'calle 63 #68-56 bis sur');
insert into cliente values(	1011160559, 'Camila Buitrago'    , 3178143906, 'cbuitragom@gmail.com'    , NULL);


CREATE TABLE ancheta
(
	ID_producto				int			  PRIMARY KEY,
    anc_nombre				varchar(80)	  NOT NULL,
    anc_precio				int			  NOT NULL,
    anc_motivo				varchar(80)	  NULL,
    anc_ventas				int			  NOT NULL
);

insert into ancheta values(	100, 'Ancheta de Cumpleaños', 135000, 'Cumpleaños'     , 2);
insert into ancheta values(	101, 'Ancheta para brindar' , 180000, 'Celebracion'    , 1);
insert into ancheta values(	103, 'Picnic Romantico'     , 140000, NULL             , 2);
insert into ancheta values(	106, 'Sorpresa para Papa'   ,  80000, 'Dia del Padre'  , 1);
insert into ancheta values(	107, 'Carrito de Dulces'    , 105000, NULL             , 1);

CREATE TABLE cupcake
(
	ID_producto				int			  PRIMARY KEY,
    cup_nombre				varchar(80)	  NOT NULL,
    cup_precio				int			  NOT NULL,
    cup_motivo				varchar(80)	  NULL,
    cup_ventas				int			  NOT NULL,
    cup_unidades			int			  NOT NULL,
    cup_sabor				varchar(80)	  NOT NULL,
    cup_relleno				varchar(80)	  NULL,
    cup_cobertura			varchar(80)	  NOT NULL
);

insert into cupcake values(	108, 'Cupcakes de Chocolate Especiales', 21000, NULL             , 1, 6, 'Chocolate',  NULL, 'Chocolate');
insert into cupcake values(	109, 'Cupcakes Sunday'                 , 21000, NULL             , 1, 6, 'Banano'   , 'Crema chantilly', 'Crema chantilly');
insert into cupcake values(	111, 'Cupcakes de Aniversario'         , 21000, 'Aniversario'    , 2, 6, 'Vainilla' , NULL, 'Fondant');
insert into cupcake values(	112, 'Cupcakes para Mamá'              , 21000, 'Dia de la Madre', 1, 6, 'Vainilla con semillas de amapola', 'Arequipe', 'Fondant');
insert into cupcake values(	113, 'Cupcakes Galácticos'             , 21000, NULL             , 2, 6, 'Vainilla' , NULL, 'Buttercream');

CREATE TABLE ponque
(
	ID_producto				int			  PRIMARY KEY,
    pon_nombre				varchar(80)	  NOT NULL,
    pon_precio				int			  NOT NULL,
    pon_motivo				varchar(80)	  NULL,
    pon_ventas				int			  NOT NULL,
    pon_porciones			int			  NOT NULL,			 
    pon_sabor				varchar(80)	  NOT NULL,
    pon_relleno				varchar(80)	  NULL,
    pon_cobertura			varchar(80)	  NULL
);

insert into ponque values(	114, 'Ponqué de Cumpleaños Clásico Pequeño'   , 37000 , 'Cumpleaños', 1, 10, 'Chocolate'            ,  NULL, 'Crema con fresas');
insert into ponque values(	118, 'Mousse de Maracuyá Mediano'             , 48000 , NULL        , 1, 24, 'Vainilla'             , 'Mousse de maracuyá'  , 'Malla de chocolate y fruta');
insert into ponque values(	120, 'Torta de M&M y fresas Grande'           , 60000 , NULL        , 1, 40, 'Vainilla'             , 'Crema chantilly'     , 'Chocolate y M&M ');
insert into ponque values(	121, 'Dripcake de cumpleaños'                 , 48000 , 'Cumpleaños', 1, 25, 'Chocolate'            , 'Mousse de chocolate' , 'Drip de chocolate');
insert into ponque values(	124, 'Torta de Fresas en Smoking Extragrande' , 85000 , NULL        , 1, 60, 'Vainilla'             , 'Ganache de chocolate', 'Chocolate y fruta');
insert into ponque values(	125, 'Torta de Personaje Mediana'             , 48000 , NULL        , 2, 24, 'Naranja'              , 'Arequipe'            , 'Fondant');

CREATE TABLE utilidad
(
	ID_producto				int			  PRIMARY KEY,
    uti_Pganancia			int			  NOT NULL,
    uti_costo				int			  NOT NULL,
    uti_ganancia			int			  NOT NULL
);

insert into utilidad values(100, 20, 108000, 27000);
insert into utilidad values(101, 15, 153000, 27000);
insert into utilidad values(103, 21, 110600, 29400);
insert into utilidad values(106, 12, 70400 , 96000);
insert into utilidad values(107, 14, 90300 , 14700);
insert into utilidad values(108, 25, 15750 , 5250);
insert into utilidad values(109, 25, 15750 , 5250);
insert into utilidad values(111, 25, 15750 , 5250);
insert into utilidad values(112, 25, 15750 , 5250);
insert into utilidad values(113, 25, 15750 , 5250);
insert into utilidad values(114, 20, 29600 , 7400);
insert into utilidad values(118, 18, 39360 , 8640);
insert into utilidad values(120, 20, 48000 , 12000);
insert into utilidad values(121, 18, 39360 , 8640);
insert into utilidad values(124, 17, 70550 , 14450);
insert into utilidad values(125, 18, 39360 , 8640);

CREATE TABLE pedido
(
	ID_pedido				int     	  PRIMARY KEY,
    ID_cliente				int			  NOT NULL,
    ped_direccion			varchar(80)	  NOT NULL,
    ped_fecha_creacion		date	      NOT NULL,
    ped_fecha_entrega		date	      NOT NULL,
    ped_estado				varchar(80)	  NOT NULL,
    ped_costo				int			  NOT NULL
);

insert into pedido values(999, 1032356058 , 'cra 20A #171-31'        , '2022-01-04' , '2022-01-07', 'Entregado' , 58000); 
insert into pedido values(1001, 1000356059, 'cra 45A #26-53'         , '2022-02-15' , '2022-02-17', 'Entregado' , 48000); 
insert into pedido values(1002, 1032356058, 'cra 19A #30-11'         , '2022-03-09' , '2022-03-12', 'Entregado' , 105000);
insert into pedido values(1003, 1032356057, 'cra 18A #75-90'         , '2022-03-19' , '2022-03-22', 'Entregado' , 21000);
insert into pedido values(1004, 1000381967, 'cra 7F #145-75'         , '2022-04-04' , '2022-04-06', 'Entregado' , 106000);
insert into pedido values(1005, 1032356059, 'cra 20A #171-31'        , '2022-04-05' , '2022-04-07', 'Entregado' , 80000);
insert into pedido values(1006, 1026381706, 'calle 26 #17-04'        , '2022-04-09' , '2022-04-15', 'Entregado' , 81000);
insert into pedido values(1007, 1032381967, 'cra 10B #63-80'         , '2022-04-23' , '2022-04-25', 'Entregado' , 180000);
insert into pedido values(1008, 1011160559, 'cra 90A #89-90'         , '2022-04-25' , '2022-04-28', 'Entregado' , 48000);
insert into pedido values(1009, 1038123456, 'calle 63 #68-56 bis sur', '2022-04-30' , '2022-05-05', 'Entregado' , 69000);
insert into pedido values(1010, 1032356058, 'cra 19A #30-11'         , '2022-05-09' , '2022-05-12', 'Entregado' , 140000);
insert into pedido values(1011, 52267126  , 'cra 20A #171-31'        , '2022-06-04' , '2022-06-07', 'Entregado' , 270000);
insert into pedido values(1012, 1000356059, 'cra 67D #59-68'         , '2022-06-15' , '2022-06-17', 'Entregado' , 48000);
insert into pedido values(1016, 1032356058, 'cra 20A #171-31'        , '2022-10-29' , '2022-10-31', 'Pendiente', 42000);

CREATE TABLE pedido_producto
(
	ID_pedido				int			  NOT NULL,
    FOREIGN KEY (ID_pedido) REFERENCES pedido(ID_pedido),
    ID_producto				int			  NOT NULL,
    pro_nombre				varchar(80)	  NOT NULL,
    pro_precio				int			  NOT NULL,
    pp_cantidad				int			  NOT NULL,
    pp_total				int			  NOT NULL
);

insert into pedido_producto values(1000, 109, 'Cupcakes Sunday'                       , 21000 , 1, 21000);
insert into pedido_producto values(1000, 114, 'Ponqué de Cumpleaños Clásico Pequeño'  , 37000 , 1, 37000);
insert into pedido_producto values(1001, 121, 'Dripcake de cumpleaños'                , 48000 , 1, 48000);
insert into pedido_producto values(1002, 107, 'Carrito de Dulces'                     , 105000, 1, 105000);
insert into pedido_producto values(1002, 107, 'Carrito de Dulces'                     , 105000, 2, 105000);
insert into pedido_producto values(1003, 112, 'Cupcakes para Mamá'                    , 21000 , 1, 21000);
insert into pedido_producto values(1004, 124, 'Torta de Fresas en Smoking Extragrande', 85000 , 1, 85000);
insert into pedido_producto values(1004, 108, 'Cupcakes de Chocolate Especiales'      , 21000 , 1, 21000);
insert into pedido_producto values(1005, 106, 'Sorpresa para Papa'                    , 80000 , 1, 80000);
insert into pedido_producto values(1006, 120, 'Torta de M&M y fresas Grande'          , 60000 , 1, 60000);
insert into pedido_producto values(1006, 111, 'Cupcakes de Aniversario'               , 21000 , 1, 21000);
insert into pedido_producto values(1007, 101, 'Ancheta para brindar'                  , 180000, 1, 180000);
insert into pedido_producto values(1008, 125, 'Torta de Personaje Mediana'            , 48000 , 1, 48000);
insert into pedido_producto values(1009, 118, 'Mousse de Maracuyá Mediano'            , 48000 , 1, 48000);
insert into pedido_producto values(1009, 111, 'Cupcakes de Aniversario'               , 21000 , 1, 21000);
insert into pedido_producto values(1010, 103, 'Picnic Romantico'                      , 140000, 1, 140000);
insert into pedido_producto values(1011, 100, 'Ancheta de Cumpleaños'                 , 135000, 2, 270000);
insert into pedido_producto values(1012, 125, 'Torta de Personaje Mediana'            , 48000 , 1, 48000);
insert into pedido_producto values(1013, 113, 'Cupcakes Galácticos'                   , 21000 , 2, 42000);

CREATE TABLE comentario
(
	ID_pedido				int			  NOT NULL,
    com_nivelSatisfaccion	tinyint			  NULL,
    com_descripcion			varchar(80)	  NULL,
	FOREIGN KEY (ID_pedido) REFERENCES pedido(ID_pedido)
);

insert into comentario values(1000, 9  , 'Delicioso' ); 
insert into comentario values(1001, NULL, NULL ); 
insert into comentario values(1002, 8, 'Excelente' );
insert into comentario values(1003, 9, 'Bonito' );
insert into comentario values(1004, 10, 'Delicioso' );
insert into comentario values(1005, 8, 'Encantador');
insert into comentario values(1006, 9, NULL );
insert into comentario values(1007, NULL, NULL );
insert into comentario values(1008, 10, 'Lindo y delicioso' );
insert into comentario values(1009, 9 , 'Buen sabor' );
insert into comentario values(1010, 8, 'Agradable');
insert into comentario values(1011, 7 , 'Lindo');
insert into comentario values(1012, 9, NULL );
insert into comentario values(1013, NULL, NULL );

CREATE TABLE inventario
(
	ID_insumo				int			  PRIMARY KEY,
    nom_insumo				varchar(80)	  NOT NULL,
    inv_cantidad			int			  NOT NULL,
    inv_descripcion			varchar(80)	  NULL
);

insert into inventario values(	10, 'Harina'          ,  3, 'Unidad (1 kilogramo)');
insert into inventario values(	11, 'Huevos'          , 10, 'Unidad (docena de huevos)');
insert into inventario values(	12, 'Azucar'          ,  5, 'Unidad (1 kilogramo)');
insert into inventario values(	13, 'Crema'           , 18, 'Unidad (Bolsa 500 ml');
insert into inventario values(	14, 'Mantequilla'     , 21, 'Unidad (Barra 125 gramos)');
insert into inventario values(	15, 'Arequipe'        , 21, 'Unidad (Tarro 500 g)');
insert into inventario values(	16, 'Naranja'         , 10, NULL);
insert into inventario values(	17, 'Fresa'           , 30, 'Unidad (500 gramos)');
insert into inventario values(	18, 'Maracuya'        , 19, 'Unidad (500 gramos)');
insert into inventario values(	19, 'Cereza Marrasquino', 20, 'Unidad (250 gramos)');
insert into inventario values(	20, 'Vino'            , 14, 'Unidad (Botella 750ml)');
insert into inventario values(	21, 'Vainilla'        , 10, 'Unidad (Botella 60ml)');
insert into inventario values(	22, 'Chocolate'       , 17, 'Unidad (500 gramos)');
insert into inventario values(	23, 'Caja de madera'  ,  9, NULL);
insert into inventario values(	25, 'Peluche'         ,  6, NULL);
insert into inventario values(	26, 'Globo metalizado', 20, NULL);
insert into inventario values(	27, 'Ferrero rocher'  , 13, 'Caja 8 unidades');
insert into inventario values(	28, 'M&M'             , 23, 'Unidad (Bolsa 299g)');
insert into inventario values(	29, 'Arco de globos'  ,  2, NULL);
insert into inventario values(	30, 'Queso'           ,  15, 'Unidad (Bolsa 38 gramos)');
insert into inventario values(	31, 'Nutella'         ,  10, 'Unidad (Tarro 350 gramos)');
insert into inventario values(	32, 'Chocolate kinder',  30, 'Unidad (43 gramos)');
insert into inventario values(	33, 'Galletas Saltin' ,  12, 'Unidad (9 galletas)');
insert into inventario values(	34, 'Copas de cristal',   9, NULL);
insert into inventario values(	35, 'Mugs'            ,   8, NULL);
insert into inventario values(	36, 'Bonyurt'         ,   9, NULL);
insert into inventario values(	37, 'Sandwich'        ,   5, NULL);
insert into inventario values(	38, 'Cubiertos madera',  33, NULL);
insert into inventario values(	39, 'Individual'      ,  24, NULL);
insert into inventario values(	40, 'Cafe'            ,  17, 'Unidad (1 porcion para una taza)');
insert into inventario values(	41, 'Flores'          ,  10, 'Unidad (Ramo 10 flores)');
insert into inventario values(	42, 'Avena'           ,  15, 'Unidad (250 g)');
insert into inventario values(	43, 'Te Hatsu'        ,  14, 'Unidad (400 ml)');
insert into inventario values(	44, 'Salchichon'      ,   6, 'Unidad (50 gramos)');
insert into inventario values(	45, 'Cerveza'         ,  14, 'Unidad (355 ml)');
insert into inventario values(	46, 'Mani'            ,  25, 'Unidad (25 gramos)');
insert into inventario values(	47, 'Banano'          ,  19, NULL);
insert into inventario values(	48, 'Semillas de amapola',  3, 'Unidad (500 gramos)');

CREATE TABLE preparacion
(
	ID_producto				int			  NOT NULL,
    ID_insumo				int			  NOT NULL,
    nom_insumo				varchar(80)	  NOT NULL,
    pre_cantidad			varchar(80)	  NOT NULL,
    FOREIGN KEY (ID_insumo) REFERENCES inventario(ID_insumo)
);

insert into preparacion values(100, 23, 'Caja de madera'  , 1);
insert into preparacion values(100, 26, 'Globo metalizado', 1);
insert into preparacion values(100, 29, 'Arco de globos'  , 1);
insert into preparacion values(100, 30, 'Queso'           , 2);
insert into preparacion values(100, 28, 'M&M'             , 1);
insert into preparacion values(100, 32, 'Chocolate kinder', 2);
insert into preparacion values(100, 31, 'Nutella'         , 1);
insert into preparacion values(101, 23, 'Caja de madera'  , 1);
insert into preparacion values(101, 26, 'Globo metalizado', 4);
insert into preparacion values(101, 20, 'Vino'            , 1);
insert into preparacion values(101, 27, 'Ferrero rocher'  , 1);
insert into preparacion values(101, 34, 'Copas de cristal', 2);
insert into preparacion values(103, 23, 'Caja de madera'  , 1);
insert into preparacion values(103, 27, 'Ferrero rocher'  , 1);
insert into preparacion values(103, 20, 'Vino'            , 1);
insert into preparacion values(103, 34, 'Copas de cristal', 2);
insert into preparacion values(103, 30, 'Queso'           , 2);
insert into preparacion values(103, 44, 'Salchichon'      , 2);
insert into preparacion values(103, 41, 'Flores'          , 1);
insert into preparacion values(106, 23, 'Caja de madera'  , 1);
insert into preparacion values(106, 45, 'Cerveza'         , 1);
insert into preparacion values(106, 46, 'Mani'            , 2);
insert into preparacion values(106, 28, 'M&M'             , 1);
insert into preparacion values(106, 25, 'Peluche'         , 1);
insert into preparacion values(106, 39, 'Individual'      , 3);
insert into preparacion values(107, 26, 'Globo metalizado', 1);
insert into preparacion values(107, 27, 'Ferrero rocher'  , 1);
insert into preparacion values(107, 28, 'M&M'             , 3);
insert into preparacion values(107, 31, 'Nutella'         , 1);
insert into preparacion values(107, 36, 'Bonyurt'         , 2);
insert into preparacion values(107, 25, 'Peluche'         , 2);
insert into preparacion values(108, 10, 'Harina'          , '200 gramos');
insert into preparacion values(108, 11, 'Huevos'          , '2 Huevos');
insert into preparacion values(108, 12, 'Azucar'          , '120 gramos');
insert into preparacion values(108, 13, 'Crema'           , '100 g');
insert into preparacion values(108, 14, 'Mantequilla'     , '100 gramos');
insert into preparacion values(108, 22, 'Chocolate'       , '120 gramos');
insert into preparacion values(109, 10, 'Harina'          , '200 gramos');
insert into preparacion values(109, 11, 'Huevos'          , '2 Huevos');
insert into preparacion values(109, 12, 'Azucar'          , '120 gramos');
insert into preparacion values(109, 13, 'Crema'           , '100 g');
insert into preparacion values(109, 14, 'Mantequilla'     , '100 gramos');
insert into preparacion values(109, 22, 'Chocolate'       , '50 gramos');
insert into preparacion values(109, 19, 'Cereza Marrasquino', '6 cerezas');
insert into preparacion values(109, 47, 'Banano'          , 1);
insert into preparacion values(111, 10, 'Harina'          , '200 gramos');
insert into preparacion values(111, 11, 'Huevos'          , '2 Huevos');
insert into preparacion values(111, 12, 'Azucar'          , '120 gramos');
insert into preparacion values(111, 13, 'Crema'           , '100 g');
insert into preparacion values(111, 14, 'Mantequilla'     , '100 gramos');
insert into preparacion values(111, 21, 'Vainilla'        , '10 g');
insert into preparacion values(112, 10, 'Harina'          , '200 gramos');
insert into preparacion values(112, 11, 'Huevos'          , '2 Huevos');
insert into preparacion values(112, 12, 'Azucar'          , '120 gramos');
insert into preparacion values(112, 13, 'Crema'           , '100 g');
insert into preparacion values(112, 14, 'Mantequilla'     , '100 gramos');
insert into preparacion values(112, 48, 'Semillas de amapola' , '50 gramos');
insert into preparacion values(112, 21, 'Vainilla'        , '10 g');
insert into preparacion values(113, 10, 'Harina'          , '200 gramos');
insert into preparacion values(113, 11, 'Huevos'          , '2 Huevos');
insert into preparacion values(113, 12, 'Azucar'          , '120 gramos');
insert into preparacion values(113, 13, 'Crema'           , '100 g');
insert into preparacion values(113, 14, 'Mantequilla'     , '100 gramos');
insert into preparacion values(113, 21, 'Vainilla'        , '10 g');
insert into preparacion values(114, 10, 'Harina'          , '360 gramos');
insert into preparacion values(114, 11, 'Huevos'          , '4 Huevos');
insert into preparacion values(114, 12, 'Azucar'          , '280 gramos');
insert into preparacion values(114, 13, 'Crema'           , '120 g');
insert into preparacion values(114, 14, 'Mantequilla'     , '220 gramos');
insert into preparacion values(114, 22, 'Chocolate'       , '100 gramos');
insert into preparacion values(114, 17, 'Fresa'           , '4 fresas');
insert into preparacion values(118, 10, 'Harina'          , '480 gramos');
insert into preparacion values(118, 11, 'Huevos'          , '6 huevos');
insert into preparacion values(118, 12, 'Azucar'          , '360 gramos');
insert into preparacion values(118, 13, 'Crema'           , '200 g');
insert into preparacion values(118, 14, 'Mantequilla'     , '300 gramos' );
insert into preparacion values(118, 22, 'Chocolate'       , '50 gramos');
insert into preparacion values(118, 21, 'Vainilla'        , 'una cucharadita');
insert into preparacion values(118, 18, 'Maracuya'        , '2 frutas');
insert into preparacion values(118, 19, 'Cereza Marrasquino', '4 cerezas');
insert into preparacion values(118, 17, 'Fresa'           , '4 fresas');
insert into preparacion values(120, 10, 'Harina'          , '520 gramos');
insert into preparacion values(120, 11, 'Huevos'          , '8 huevos');
insert into preparacion values(120, 12, 'Azucar'          , '400 gramos');
insert into preparacion values(120, 13, 'Crema'           , '250 g');
insert into preparacion values(120, 14, 'Mantequilla'     , '350 gramos');
insert into preparacion values(120, 22, 'Chocolate'       , '100 gramos');
insert into preparacion values(120, 21, 'Vainilla'        , 'una cucharadita');
insert into preparacion values(120, 28, 'M&M'             , 1);
insert into preparacion values(120, 17, 'Fresa'           , '17 fresas');
insert into preparacion values(121, 10, 'Harina'          , '480 gramos');
insert into preparacion values(121, 11, 'Huevos'          , '6 huevos');
insert into preparacion values(121, 12, 'Azucar'          , '360 gramos');
insert into preparacion values(121, 13, 'Crema'           , '250 g');
insert into preparacion values(121, 14, 'Mantequilla'     , '300 gramos' );
insert into preparacion values(121, 22, 'Chocolate'       , '200 gramos');
insert into preparacion values(124, 10, 'Harina'          , '580 gramos');
insert into preparacion values(124, 11, 'Huevos'          , '10 huevos');
insert into preparacion values(124, 12, 'Azucar'          , '460 gramos');
insert into preparacion values(124, 13, 'Crema'           , '350 g');
insert into preparacion values(124, 14, 'Mantequilla'     , '400 gramos' );
insert into preparacion values(124, 22, 'Chocolate'       , '100 gramos');
insert into preparacion values(124, 21, 'Vainilla'        , 'una cucharada');
insert into preparacion values(124, 17, 'Fresa'           , '18 fresas');
insert into preparacion values(125, 10, 'Harina'          , '480 gramos');
insert into preparacion values(125, 11, 'Huevos'          , '6 huevos');
insert into preparacion values(125, 12, 'Azucar'          , '360 gramos');
insert into preparacion values(125, 13, 'Crema'           , '200 g');
insert into preparacion values(125, 14, 'Mantequilla'     , '300 gramos' );
insert into preparacion values(125, 15, 'Arequipe'        , '100 gramos');
insert into preparacion values(125, 16, 'Naranja'         , '2 naranjas');

CREATE TABLE compra
(
	ID_compra				int			  PRIMARY KEY,
    comp_fecha_entrega		date	      NOT NULL,
    comp_costo				int			  NOT NULL
);

insert into compra values(10000, '2021-11-15', 2103213);
insert into compra values(10001, '2021-11-20', 1482770);
insert into compra values(10002, '2021-12-10', 907000);

CREATE TABLE compra_inventario
(
	ID_compra				int			  NOT NULL,
    ID_insumo				int			  NOT NULL,
    nom_insumo				varchar(80)	  NOT NULL,
    ci_cantidad				float		  NOT NULL,
    ins_precio				int			  NOT NULL,
    ci_total				int			  NOT NULL,
    ci_nomLugar			    varchar(80)	  NOT NULL,
    ci_direccion			varchar(80)	  NOT NULL,
    FOREIGN KEY (ID_compra) REFERENCES compra(ID_compra),
    FOREIGN KEY (ID_insumo) REFERENCES inventario(ID_insumo)
);

insert into compra_inventario values( 10000, 10, 'Harina'          ,  3, 4290 , 12870 , 'Corabastos', 'carrera 80 # 2-51');
insert into compra_inventario values( 10000, 11, 'Huevos'          , 10, 18900, 189000, 'Corabastos', 'carrera 80 # 2-51');
insert into compra_inventario values( 10000, 12, 'Azucar'          ,  5, 4590 , 22950 , 'Corabastos', 'carrera 80 # 2-51');
insert into compra_inventario values( 10000, 13, 'Crema'           , 18, 7590 , 136620, 'Corabastos', 'carrera 80 # 2-51');
insert into compra_inventario values( 10000, 14, 'Mantequilla'     , 21, 6990 , 146790, 'Corabastos', 'carrera 80 # 2-51');
insert into compra_inventario values( 10000, 15, 'Arequipe'        , 21, 12990, 272790, 'Corabastos', 'carrera 80 # 2-51');
insert into compra_inventario values( 10000, 16, 'Naranja'         , 10, 675  , 6750  , 'Corabastos', 'carrera 80 # 2-51');
insert into compra_inventario values( 10000, 17, 'Fresa'           , 30, 1990 , 59700 , 'Corabastos', 'carrera 80 # 2-51');
insert into compra_inventario values( 10000, 18, 'Maracuya'        , 19, 5200 , 98800 , 'Corabastos', 'carrera 80 # 2-51');
insert into compra_inventario values( 10000, 19, 'Cereza'          , 20, 9990 , 199800, 'Corabastos', 'carrera 80 # 2-51');
insert into compra_inventario values( 10000, 20, 'Vino'            , 14, 33742, 472388, 'Corabastos', 'carrera 80 # 2-51');
insert into compra_inventario values( 10000, 21, 'Vainilla'        , 10, 3990 , 39900 , 'Corabastos', 'carrera 80 # 2-51');
insert into compra_inventario values( 10000, 22, 'Chocolate'       , 17, 15590, 265030, 'Corabastos', 'carrera 80 # 2-51');
insert into compra_inventario values( 10000, 30, 'Queso'           , 15, 1398 , 35975 , 'Corabastos', 'carrera 80 # 2-51');
insert into compra_inventario values( 10000, 44, 'Salchichon'      ,  6, 1631 , 9790  , 'Corabastos', 'carrera 80 # 2-51');
insert into compra_inventario values( 10000, 47, 'Banano'          , 19, 440  , 8360  , 'Corabastos', 'carrera 80 # 2-51');
insert into compra_inventario values( 10000, 48, 'Semillas de amapola', 3, 41900 , 125700 , 'Corabastos', 'carrera 80 # 2-51');
insert into compra_inventario values( 10001, 27, 'Ferrero rocher'  , 13, 21000, 273000, 'Makro'     , 'Cl. 192 #1912' );
insert into compra_inventario values( 10001, 28, 'M&M'             , 23, 22880, 526240, 'Makro'     , 'Cl. 192 #1912' );
insert into compra_inventario values( 10001, 31, 'Nutella'         , 10, 17200, 172000, 'Makro'     , 'Cl. 192 #1912' );
insert into compra_inventario values( 10001, 32, 'Chocolate kinder', 30, 5500 , 165000, 'Makro'     , 'Cl. 192 #1912' );
insert into compra_inventario values( 10001, 33, 'Galletas Saltin' , 12, 5500 , 66000 , 'Makro'     , 'Cl. 192 #1912' );
insert into compra_inventario values( 10001, 36, 'Bonyurt'         ,  9, 2720 , 24480 , 'Makro'     , 'Cl. 192 #1912' );
insert into compra_inventario values( 10001, 37, 'Sandwich'        ,  5, 6490 , 32450 , 'Makro'     , 'Cl. 192 #1912' );
insert into compra_inventario values( 10001, 40, 'Cafe'            , 17, 2000 , 34000 , 'Makro'     , 'Cl. 192 #1912' );
insert into compra_inventario values( 10001, 42, 'Avena'           , 15, 3900 , 58500 , 'Makro'     , 'Cl. 192 #1912' );
insert into compra_inventario values( 10001, 43, 'Te Hatsu'        , 14, 3900 , 54600 , 'Makro'     , 'Cl. 192 #1912' );
insert into compra_inventario values( 10001, 45, 'Cerveza'         , 14, 3500 , 49000 , 'Makro'     , 'Cl. 192 #1912' );
insert into compra_inventario values( 10001, 46, 'Mani'            , 25, 1100 , 27500 , 'Makro'     , 'Cl. 192 #1912' );
insert into compra_inventario values( 10002, 23, 'Caja de madera'  ,  9, 9000 , 81000 , 'Aromas y Sabores', 'Cra 17 52-71');
insert into compra_inventario values( 10002, 25, 'Peluche'         ,  6, 13000, 78000 , 'Aromas y Sabores', 'Cra 17 52-71');
insert into compra_inventario values( 10002, 26, 'Globo metalizado', 20, 4000 , 80000 , 'Aromas y Sabores', 'Cra 17 52-71');
insert into compra_inventario values( 10002, 29, 'Arco de globos'  ,  2, 10000, 20000 , 'Aromas y Sabores', 'Cra 17 52-71');
insert into compra_inventario values( 10002, 38, 'Cubiertos madera',  33, 1200, 39600 , 'Aromas y Sabores', 'Cra 17 52-71');
insert into compra_inventario values( 10002, 39, 'Individual'      ,  24, 3500, 84000 , 'Aromas y Sabores', 'Cra 17 52-71');
insert into compra_inventario values( 10002, 41, 'Flores'          ,  10, 6000, 60000 , 'Aromas y Sabores', 'Cra 17 52-71');
insert into compra_inventario values( 10002, 34, 'Copas de cristal',  9, 42000, 378000, 'Aromas y Sabores', 'Cra 17 52-71');
insert into compra_inventario values( 10002, 35, 'Mugs'            ,  8, 10800, 86400 , 'Aromas y Sabores', 'Cra 17 52-71');

DROP TABLE IF EXISTS login_datos;
CREATE TABLE login_datos
(
	ID_cliente			int			  PRIMARY KEY,
    login_usuario		varchar(80)	  NOT NULL,
    login_password		varchar(80)	  NOT NULL
);

-- insert into login_datos values(	1032356059, 'gguzmanr@unal.edu.co'    , '1234');
insert into login_datos values(	1032356058, 'glondonot@unal.edu.co'   , '1');
insert into login_datos values(	1032356057, 'bforerob@unal.edu.co'    , '1357');
insert into login_datos values(	1000381967, 'jhunter@unal.edu.co'     , '2468');
insert into login_datos values(	1026381706, 'ggallegosr@unal.edu.co'  , '4321');
insert into login_datos values(	1000356059, 'otoledol@unal.edu.co'    , '5432');
insert into login_datos values(	1032381967, 'srestreporo@unal.edu.co' , '1324');
insert into login_datos values(	52267126  , 'sgcortazar@hotmal.com'   , '4231');
insert into login_datos values( 1038123456, 'gonzalomolanos@gmail.com', '3564');
insert into login_datos values(	1011160559, 'cbuitragom@gmail.com'    , '7564');
insert into login_datos values(	1, 'a'    , 'a');