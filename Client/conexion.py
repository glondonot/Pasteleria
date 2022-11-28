# Login  verificacion de datos
# @autor: Magno Efren
# Youtube: https://www.youtube.com/c/MagnoEfren

import mysql.connector

#admin mysql
usr = 'root'
#contraseña admin mysl
psswrd = '152103'


class Registro_datos():

    def __init__(self,usr,psswrd):
        self.conexion = mysql.connector.connect( host='localhost',
                                            database ='mariacamilapasteleria', 
                                            user = usr,
                                            password = psswrd)

    def busca_users(self, users):
        cur = self.conexion.cursor()
        sql = "SELECT * FROM vw_login_datos WHERE login_usuario = {}".format(users)
        cur.execute(sql)
        usersx = cur.fetchall()
        cur.close()
        return usersx 

    def busca_password(self, password):
        cur = self.conexion.cursor()
        sql = "SELECT * FROM vw_login_datos WHERE login_password = {}".format(password) #
        cur.execute(sql)
        passwordx = cur.fetchall()
        cur.close()     
        return passwordx 

    def crear_login(self,doc,user,passwrd):
        cur = self.conexion.cursor()
        sql = "CALL ADMIN_CREAR_LOGIN({}, '{}', '{}')".format(doc,user,passwrd)
        cur.execute(sql)
        self.conexion.commit()
        cur.close()    
        print(cur.rowcount, "record inserted.")
        print('putavida')

    def crear_cliente(self,user,name,phone,dir,doc):
        cur = self.conexion.cursor()
        sql = "CALL ADMIN_CREAR_CLIENTE({}, '{}', {}, '{}', '{}')".format(doc,name,phone,user,dir)
        cur.execute(sql)
        self.conexion.commit()
        cur.close()    
        print(cur.rowcount, "record inserted.")
    
    def pedido_por_estado(self):
        cur = self.conexion.cursor()
        sql = "CALL CLIENTE_VISTA_PEDIDO_ESTADO (1032356058, 'Entregado');"
        cur.execute(sql)
        x = cur.fetchall()
        cur.close()
        