# Login  verificacion de datos
# @autor: Magno Efren
# Youtube: https://www.youtube.com/c/MagnoEfren

import mysql.connector
from datetime import datetime, timedelta
now = datetime.now()
ID_ = 1014
#import singup, login
#from login import doc_entry

#admin mysql
usr = 'Mariacamila'
#contraseña admin mysl
psswrd = 'pasteleria'


class Registro_datos():

    def __init__(self,usr,psswrd):
        self.id = ID_
        self.conexion = mysql.connector.connect( host='localhost',
                                            database ='mariacamilapasteleria', 
                                            user = usr,
                                            password = psswrd)

    def role_usuario(self,doc,passwrd):
        cur = self.conexion.cursor()
        sql = "CREATE USER IF NOT EXISTS '{}'@'localhost' IDENTIFIED BY '{}'".format(doc,passwrd)
        cur.execute(sql)
        sql = "GRANT CLIENTE TO '{}'@'localhost'".format(doc)
        cur.execute(sql)
        sql = "SET DEFAULT ROLE CLIENTE TO '{}'@'localhost'".format(doc)
        cur.execute(sql)
        self.conexion.commit()
        cur.close()    
        print(cur.rowcount, "Role cliente asignado.")

    def busca_users(self, users):
        cur = self.conexion.cursor()
        sql = "SELECT * FROM vw_login_datos WHERE ID_cliente = {}".format(users)
        cur.execute(sql)
        usersx = cur.fetchall()
        cur.close()
        return usersx 

    def busca_password(self, password):
        cur = self.conexion.cursor()
        sql = "SELECT * FROM vw_login_datos WHERE login_password = {}".format(password) 
        cur.execute(sql)
        passwordx = cur.fetchall()
        cur.close()
        print('hecho con usuario',passwordx)
        return passwordx 

    def crear_login(self,doc,user,passwrd):
        cur = self.conexion.cursor()
        sql = "CALL ADMIN_CREAR_LOGIN({}, '{}', '{}')".format(doc,user,passwrd)
        cur.execute(sql)
        self.conexion.commit()
        cur.close()    
        print(cur.rowcount, "login inserted")

    def crear_cliente(self,doc,name,phone,user,dir):
        cur = self.conexion.cursor()
        sql = "CALL ADMIN_CREAR_CLIENTE({}, '{}', {}, '{}', '{}')".format(doc,name,phone,user,dir)
        cur.execute(sql)
        self.conexion.commit()
        cur.close()    
        print(cur.rowcount, "CLIENTE CREADO")
    
    def pedido_por_estado(self,doc,estado):
        self.conexion = mysql.connector.connect( host='localhost', database ='mariacamilapasteleria', user = usr, password = psswrd)
        cur = self.conexion.cursor()
        sql = "CALL CLIENTE_VISTA_PEDIDO_ESTADO ({}, '{}')".format(doc,estado)
        cur.execute(sql)
        est = cur.fetchall() 
        cur.close()   
        c = 0
        for i in est:
            c += 1
        return c , est
    
    def poducto_por_pedido(self,doc,id_p):
        self.conexion = mysql.connector.connect( host='localhost', database ='mariacamilapasteleria', user = usr, password = psswrd)
        cur = self.conexion.cursor()
        sql = "CALL CLIENTE_VISTA_PEDIDO_PRODUCTO({}, {});".format(id_p,doc)
        cur.execute(sql)
        est = cur.fetchall() 
        cur.close()  
        c = 0
        for i in est:
            c += 1
        return c , est
        
    def eliminar_pedido(self,doc,id_p):
        self.conexion = mysql.connector.connect( host='localhost', database ='mariacamilapasteleria', user = usr, password = psswrd)
        cur = self.conexion.cursor()
        sql = "CALL CLIENTE_BORRAR_PEDIDO({}, {});".format(id_p,doc)
        cur.execute(sql)
        self.conexion.commit()
        cur.close() 
        print(cur.rowcount, "pedido eliminado")

    def ver_perfil(self,doc):
        self.conexion = mysql.connector.connect( host='localhost', database ='mariacamilapasteleria', user = usr, password = psswrd)
        cur = self.conexion.cursor()
        sql = "CALL CLIENTE_VISTA_CLIENTE({})".format(doc)
        cur.execute(sql)
        est = cur.fetchall() 
        cur.close()
        return est

    def cantidad_pedidos(self,doc):
        self.conexion = mysql.connector.connect( host='localhost', database ='mariacamilapasteleria', user = usr, password = psswrd)
        cur = self.conexion.cursor()
        sql = "SET @TOTAL_PEDIDOS = NUMERO_PEDIDOS({})".format(doc)
        cur.execute(sql)
        sql = "SELECT @TOTAL_PEDIDOS"
        cur.execute(sql)
        est = cur.fetchall() 
        cur.close() 
        print(est[0][0])
        return est

    def ver_productos_1(self):
        self.conexion = mysql.connector.connect( host='localhost', database ='mariacamilapasteleria', user = usr, password = psswrd)
        cur = self.conexion.cursor()
        sql = "SELECT * FROM vw_ancheta"
        cur.execute(sql)
        est = cur.fetchall() 
        cur.close()  
        c = 0
        for i in est:
            c += 1
        return c , est

    def ver_productos_2(self):
        self.conexion = mysql.connector.connect( host='localhost', database ='mariacamilapasteleria', user = usr, password = psswrd)
        cur = self.conexion.cursor()
        sql = "SELECT * FROM vw_cupcake"
        cur.execute(sql)
        est = cur.fetchall() 
        cur.close()  
        c = 0
        for i in est:
            c += 1
        return c , est

    def ver_productos_3(self):
        self.conexion = mysql.connector.connect( host='localhost', database ='mariacamilapasteleria', user = usr, password = psswrd)
        cur = self.conexion.cursor()
        sql = "SELECT * FROM vw_ponque"
        cur.execute(sql)
        est = cur.fetchall() 
        cur.close()  
        c = 0
        for i in est:
            c += 1
        return c , est

    def agregar_pedido_producto(self,id_prod,nom_prod,val_prod,cant_prod):
        cur = self.conexion.cursor()
        sql = "SET @subtotal = TOTAL_PEDIDO_PRODUCTO({}, {})".format(cant_prod,id_prod)
        cur.execute(sql)
        sql = "START TRANSACTION"
        cur.execute(sql)
        sql = "CALL CLIENTE_CREACION_PEDIDO_PRODUCTO ({}, {}, '{}', '{}', '{}', @subtotal)".format(self.id,id_prod,nom_prod,val_prod,cant_prod)
        cur.execute(sql)
        sql = "COMMIT"
        cur.execute(sql)
        self.conexion.commit()
        cur.close()    
        print(cur.rowcount, "producto agregao")
        return

    def crear_pedido(self,doc,dir):
        self.conexion = mysql.connector.connect( host='localhost', database ='mariacamilapasteleria', user = usr, password = psswrd)
        cur = self.conexion.cursor()
        sql = "CALL CLIENTE_CREACION_PEDIDO ({}, {}, '{}', '{}', '{}', '{}', {})".format(self.id,doc,dir,now.date(),now.date()+timedelta(days=5),'pendiente',0)
        cur.execute(sql)
        self.conexion.commit()
        cur.close()    
        print(cur.rowcount, "Role cliente asignado.")

    def terminar_pedido(self):
        cur = self.conexion.cursor()
        sql = "SET @total = TOTAL_PEDIDO({})".format(self.id)
        cur.execute(sql)
        # sql = "SELECT @total"
        # cur.execute(sql)
        self.conexion.commit()
        cur.close()   
        print(cur.rowcount, "Role cliente asignado.")
        self.id += 1
