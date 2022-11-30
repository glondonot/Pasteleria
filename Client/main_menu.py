import tkinter as tk
from tkinter import ttk
import conexion
import singup, login

DIRECCION_g = ''


class Frame(tk.Frame):
    def __init__(self, root = None):
        super().__init__(root)
        self.root = root
        self.pack()
        self.config(bg = '#FFDDDD')
        self.datos = conexion.Registro_datos(conexion.usr, conexion.psswrd)

        #importa usuario y password global de la sesion del usuario
        from login import ID_usuario_g, PASSWRD_g
        self.ID_usuario_g = ID_usuario_g
        self.PASSWRD_g = PASSWRD_g
        self.DIRECCION_g = DIRECCION_g
        print(1,ID_usuario_g)
        print(2,self.ID_usuario_g)
        #da role de cliente a usuario y cambia estos datos en la conexion a la BD
        self.datos.role_usuario(ID_usuario_g,PASSWRD_g)
        self.datos = conexion.Registro_datos(ID_usuario_g, PASSWRD_g)  #usuario no deja ejecutar procedimientos
        






        #creacion y configuracion de la tabla de pedidos pendientes
        self.pedidos_pendientes_tabla = ttk.Treeview(self, columns = ('Id','Direccion', 'Fecha_de_entrega', 'Costo'))
        self.scroll_pendientes = ttk.Scrollbar(self, orient = 'vertical', command = self.pedidos_pendientes_tabla.yview)
        
        styl = ttk.Style()
        styl.configure('Treeview.Heading',font = ('Lucida Sans', 12))
        styl.configure('Treeview',font = ('Arial', 12), width = 500)

        self.pedidos_pendientes_tabla.heading('#0', text = 'ID')
        self.pedidos_pendientes_tabla.heading('#1', text = 'DIRECCION')
        self.pedidos_pendientes_tabla.heading('#2', text = 'FECHA DE ENTREGA')
        self.pedidos_pendientes_tabla.heading('#3', text = 'COSTO')
        self.pedidos_pendientes_tabla.config(height = 20, yscrollcommand = self.scroll_pendientes.set)


        #creacion y configuracion de la tabla pedidos recibidos
        self.pedidos_recibidos_tabla = ttk.Treeview(self, columns=('Id','Direccion', 'Fecha_de_entrega', 'Costo'))
        self.scroll_recibidos = ttk.Scrollbar(self, orient='vertical', command=self.pedidos_recibidos_tabla.yview)
        self.pedidos_recibidos_tabla.heading('#0', text='ID')
        self.pedidos_recibidos_tabla.heading('#1', text='DIRECCION')
        self.pedidos_recibidos_tabla.heading('#2', text='FECHA DE ENTREGA')
        self.pedidos_recibidos_tabla.heading('#3', text='COSTO')
        self.pedidos_recibidos_tabla.config(height=20, yscrollcommand= self.scroll_pendientes.set)       
       
       
        # creacion y configuracion de la tabla de productos de un pedido
        self.pedido_producto_tabla = ttk.Treeview(self, columns=('Nombre', 'Precio', 'Cantidad', 'total'))
        self.scroll_pedido_producto = ttk.Scrollbar(self, orient='vertical', command=self.pedido_producto_tabla.yview)
        self.pedido_producto_tabla.heading('#0', text='ID')
        self.pedido_producto_tabla.heading('#1', text='NOMBRE')
        self.pedido_producto_tabla.heading('#2', text='PRECIO')
        self.pedido_producto_tabla.heading('#3', text='CANTIDAD')
        self.pedido_producto_tabla.heading('#4', text='TOTAL')
        self.pedido_producto_tabla.config(height=10, yscrollcommand=self.scroll_pedido_producto.set)


        # creacion y configuracion de la tabla de productos de un recibido
        self.recibido_producto_tabla = ttk.Treeview(self, columns=('Nombre', 'Precio', 'Cantidad', 'total'))
        self.scroll_recibido_producto = ttk.Scrollbar(self, orient='vertical', command=self.recibido_producto_tabla.yview)
        self.recibido_producto_tabla.heading('#0', text='ID')
        self.recibido_producto_tabla.heading('#1', text='NOMBRE')
        self.recibido_producto_tabla.heading('#2', text='PRECIO')
        self.recibido_producto_tabla.heading('#3', text='CANTIDAD')
        self.recibido_producto_tabla.heading('#4', text='TOTAL')
        self.recibido_producto_tabla.config(height=10, yscrollcommand=self.scroll_recibido_producto.set)

        # creacion y configuracion de la tabla productos
        self.productos_tabla = ttk.Treeview(self, columns=('id_producto', 'nombre', 'precio',''))
        self.scroll_productos = ttk.Scrollbar(self, orient='vertical', command=self.productos_tabla.yview)
        self.productos_tabla.heading('#0', text='ID PRODUCTO')
        self.productos_tabla.heading('#1', text='NOMBRE')
        self.productos_tabla.heading('#2', text='PRECIO')
        self.productos_tabla.heading('#3', text='')
        self.productos_tabla.config(height=20, yscrollcommand=self.scroll_pendientes.set)







        #creacion y configuracion boton ver pedido xd
        self.ver_pedido_bot = tk.Button(self, text="VER PEDIDO", command=self.ver_pendientes_fun)
        self.ver_pedido_bot.config(width=20, font=('Arial', 12, 'bold', 'italic'), fg='#DAD5D6')

        # creacion y configuracion boton ver pedido xd
        self.ver_recibido_bot = tk.Button(self, text="VER PEDIDO", command=self.ver_recibidos_fun)
        self.ver_recibido_bot.config(width=20, font=('Arial', 12, 'bold', 'italic'), fg='#DAD5D6')

        # creacion y configuracion boton cancelar pedido
        self.cancelar_pedido_bot = tk.Button(self, text="CANCELAR PEDIDO", command=self.cancelar_pedido_fun)
        self.cancelar_pedido_bot.config(width=20, font=('Arial', 12, 'bold', 'italic'), fg='#DAD5D6')

        # creacion y configuracion boton CONTINUAR para nuevo pedido
        self.continuar_bot = tk.Button(self, text="CONTINUAR", command=self.productos_fun)
        self.continuar_bot.config(width=20, font=('Arial', 12, 'bold', 'italic'), fg='#DAD5D6')

        # creacion y configuracion boton registrar producto para nuevo pedido
        self.registrar_producto_bot = tk.Button(self, text="AGREGAR PRODUCTO", command=self.registrar_producto_fun)
        self.registrar_producto_bot.config(width=20, font=('Arial', 12, 'bold', 'italic'), fg='#DAD5D6')

        # creacion y configuracion boton finalizar pedido para nuevo pedido
        self.finalizar_pedido = tk.Button(self, text="FINALIZAR PEDIDO", command=self.agregar_pedido_fun)
        self.finalizar_pedido.config(width=20, font=('Arial', 12, 'bold', 'italic'), fg='#DAD5D6')








        self.label_id_pedido = tk.Label(self, text= 'Id pedido:')
        self.label_id_pedido.config(font=('Arial', 12, 'bold', 'italic'),bg='#FFDDDD')
        self.id_string_var = tk.StringVar() 
        self.id_string_var.set('')
        self.lab_id_pedido = tk.Label(self, textvariable=self.id_string_var)
        self.lab_id_pedido.config(font=('Arial', 12, 'bold', 'italic'), bg='#FFDDDD')


        self.label_direccion = tk.Label(self, text='Direccion:')
        self.label_direccion.config(font=('Arial', 12, 'bold', 'italic'), bg='#FFDDDD')
        self.dir_string_var = tk.StringVar() 
        self.dir_string_var.set('')
        self.lab_direccion = tk.Label(self, textvariable=self.dir_string_var)
        self.lab_direccion.config(font=('Arial', 12, 'bold', 'italic'), bg='#FFDDDD')


        self.mi_direccion = tk.StringVar()
        self.entry_direccion = tk.Entry(self, textvariable=self.mi_direccion)
        self.entry_direccion.config(width=50, state='disable', font=('Arial', 12))


        self.label_fecha_entrega = tk.Label(self, text='Fecha de entrega:')
        self.label_fecha_entrega.config(font=('Arial', 12, 'bold', 'italic'), bg='#FFDDDD')
        self.fecha_string_var = tk.StringVar() 
        self.fecha_string_var.set('')
        self.lab_fecha_entrega = tk.Label(self, textvariable=self.fecha_string_var)
        self.lab_fecha_entrega.config(font=('Arial', 12, 'bold', 'italic'), bg='#FFDDDD')


        self.mi_fecha = tk.StringVar()
        self.entry_fecha_entrega = tk.Entry(self, textvariable=self.mi_fecha)
        self.entry_fecha_entrega.config(width=50, state='disable', font=('Arial', 12))


        self.label_costo = tk.Label(self, text='Costo:')
        self.label_costo.config(font=('Arial', 12, 'bold', 'italic'), bg='#FFDDDD')
        self.costo_string_var = tk.StringVar() 
        self.costo_string_var.set('')
        self.lab_costo = tk.Label(self, textvariable=self.costo_string_var)
        self.lab_costo.config(font=('Arial', 12, 'bold', 'italic'), bg='#FFDDDD')

        self.label_productos = tk.Label(self, text='Productos')
        self.label_productos.config(font=('Arial', 12, 'bold', 'italic'), bg='#FFDDDD')

        self.label_cantidad = tk.Label(self, text='Cantidad')
        self.label_cantidad.config(font=('Arial', 12, 'bold', 'italic'), bg='#FFDDDD')








        self.label_perfil_id = tk.Label(self, text='ID')
        self.label_perfil_id.config(font=('Arial', 12, 'bold', 'italic'), bg='#FFDDDD')
        self.p_id_string_var = tk.StringVar() 
        self.p_id_string_var.set('')
        self.p_lab_id = tk.Label(self, textvariable=self.p_id_string_var)
        self.p_lab_id.config(font=('Arial', 12, 'bold', 'italic'), bg='#FFDDDD')


        self.label_perfil_nombre = tk.Label(self, text='NOMBRE')
        self.label_perfil_nombre.config(font=('Arial', 12, 'bold', 'italic'), bg='#FFDDDD')
        self.p_nombre_string_var = tk.StringVar() 
        self.p_nombre_string_var.set('')
        self.p_lab_nombre = tk.Label(self, textvariable=self.p_nombre_string_var)
        self.p_lab_nombre.config(font=('Arial', 12, 'bold', 'italic'), bg='#FFDDDD')


        self.label_perfil_numero = tk.Label(self, text='TELEFONO')
        self.label_perfil_numero.config(font=('Arial', 12, 'bold', 'italic'), bg='#FFDDDD')
        self.p_numero_string_var = tk.StringVar() 
        self.p_numero_string_var.set('')
        self.p_lab_numero = tk.Label(self, textvariable=self.p_numero_string_var)
        self.p_lab_numero.config(font=('Arial', 12, 'bold', 'italic'), bg='#FFDDDD')


        self.label_perfil_correo = tk.Label(self, text='CORREO')
        self.label_perfil_correo.config(font=('Arial', 12, 'bold', 'italic'), bg='#FFDDDD')
        self.p_correo_string_var = tk.StringVar() 
        self.p_correo_string_var.set('')
        self.p_lab_correo = tk.Label(self, textvariable=self.p_correo_string_var)
        self.p_lab_correo.config(font=('Arial', 12, 'bold', 'italic'), bg='#FFDDDD')


        self.label_perfil_dir = tk.Label(self, text='DIRECCION')
        self.label_perfil_dir.config(font=('Arial', 12, 'bold', 'italic'), bg='#FFDDDD')
        self.p_dir_string_var = tk.StringVar() 
        self.p_dir_string_var.set('')
        self.p_lab_direccion = tk.Label(self, textvariable=self.p_dir_string_var)
        self.p_lab_direccion.config(font=('Arial', 12, 'bold', 'italic'), bg='#FFDDDD')


        self.label_perfil_cantidad = tk.Label(self, text='TOTAL DE PEDIDOS')
        self.label_perfil_cantidad.config(font=('Arial', 12, 'bold', 'italic'), bg='#FFDDDD')
        self.p_cantidad_string_var = tk.StringVar() 
        self.p_cantidad_string_var.set('')
        self.p_lab_cantidad = tk.Label(self, textvariable=self.p_cantidad_string_var)
        self.p_lab_cantidad.config(font=('Arial', 12, 'bold', 'italic'), bg='#FFDDDD')


        self.mi_cantidad = tk.StringVar()
        self.entry_cantidad = tk.Entry(self, textvariable=self.mi_cantidad)
        self.entry_cantidad.config(width=15, state='disable', font=('Arial', 12))




        self.botones_principales()
        self.pedidos_pendientes_fun()




    def salir(self):
        self.root.destroy()
        self.root.quit()




    def botones_principales(self):
        self.pedidos_pendientes_bot = tk.Button(self, text="PEDIDOS PENDIENTES", command=self.pedidos_pendientes_fun)
        self.pedidos_pendientes_bot.config(width=20, font=('Arial', 12, 'bold', 'italic'),fg='#DAD5D6')
        self.pedidos_pendientes_bot.grid(row=0, column=0, padx=10, pady=10)

        self.pedidos_recibidos_bot = tk.Button(self, text="PEDIDOS RECIBIDOS", command=self.pedidos_recibidos_fun)
        self.pedidos_recibidos_bot.config(width=20, font=('Arial', 12, 'bold', 'italic'),fg='#DAD5D6')
        self.pedidos_recibidos_bot.grid(row=0, column=1, padx=10, pady=10)

        self.nuevo_pedido_bot = tk.Button(self, text="PEDIDO NUEVO", command=self.productos_fun)
        self.nuevo_pedido_bot.config(width=20, font=('Arial', 12, 'bold', 'italic'),fg='#DAD5D6')
        self.nuevo_pedido_bot.grid(row=0, column=2, padx=10, pady=10)

        self.perfil_bot = tk.Button(self, text="PERFIL", command=self.perfil_fun)
        self.perfil_bot.config(width=20, font=('Arial', 12, 'bold', 'italic'),fg='#DAD5D6')
        self.perfil_bot.grid(row=0, column=3, padx=10, pady=10)






    def pedidos_pendientes_fun(self):
        self.limpiarventana()
        self.pedidos_pendientes_bot.config(state='disabled')
        self.pedidos_recibidos_bot.config(state='normal')
        self.nuevo_pedido_bot.config(state='normal')
        self.perfil_bot.config(state='normal')

        dir_glob = self.datos.ver_perfil(self.ID_usuario_g)
        self.DIRECCION_g = dir_glob[0][4]

        #mostrar lo necesario para la interfaz de pedidos pendientes
        self.pedidos_pendientes_tabla.grid(row=1, column=0, columnspan=4, sticky='nse')
        self.entregado = 'Pendiente'
        c , ped_pend = self.datos.pedido_por_estado(self.ID_usuario_g, self.entregado)
        for i in range(0,c):
            eval ("self.pedidos_pendientes_tabla.insert('', 0 , text=" + str(ped_pend[i][0]) +", values =('"+ str(ped_pend[i][2]) +"', '"+ str(ped_pend[i][4]) +"', '"+ str(ped_pend[i][6]) +"' ))")
        
        self.scroll_pendientes.grid(row=1, column=4, sticky='nse')

        self.label_blanco = tk.Label(self.master, text= '')

        self.ver_pedido_bot.grid(row=10, column=1, columnspan=2)




    def pedidos_recibidos_fun(self):
        self.limpiarventana()
        self.pedidos_pendientes_bot.config(state='normal')
        self.pedidos_recibidos_bot.config(state='disabled')
        self.nuevo_pedido_bot.config(state='normal')
        self.perfil_bot.config(state='normal')

        # mostrar lo necesario para la interfaz de pedidos recibidos
        self.pedidos_recibidos_tabla.grid(row=1, column=0, columnspan=4, sticky='nse')
        self.entregado = 'Entregado'
        c , ped_entre = self.datos.pedido_por_estado(self.ID_usuario_g, self.entregado)
        for i in range(0,c):
            eval ("self.pedidos_recibidos_tabla.insert('', 0 , text=" + str(ped_entre[i][0]) +", values =('"+ str(ped_entre[i][2]) +"', '"+ str(ped_entre[i][4]) +"', '"+ str(ped_entre[i][6]) +"' ))")
        self.scroll_recibidos.grid(row=1, column=4, sticky='nse')
        self.ver_recibido_bot.grid(row=9,column=1,columnspan=2)






    
    #primer funcion, de aca se supone que se selecciona un pedido de la tabla de pedidos al darle a esta funcion
    #en este frame hay un boton que es el que esta abajo de nombre cancelar_pedido_fun en ese tienen que poner practicamente
    #para eliminar el pedido con lo que tienen hay
    def ver_pendientes_fun(self):
        try:
            self.id_pedido = self.pedidos_pendientes_tabla.item(self.pedidos_pendientes_tabla.selection())['text']
            self.direccion_pedido = self.pedidos_pendientes_tabla.item(self.pedidos_pendientes_tabla.selection())['values'][0]
            self.fecha_pedido = self.pedidos_pendientes_tabla.item(self.pedidos_pendientes_tabla.selection())['values'][1]
            self.costo_pedido = self.pedidos_pendientes_tabla.item(self.pedidos_pendientes_tabla.selection())['values'][2]

        except:
            pass

        if (self.id_pedido != ''):

            self.limpiarventana()
            self.label_id_pedido.grid(row=1,column=0, padx=10, pady=10)
            self.lab_id_pedido.grid(row=1, column=1, padx=10, pady=10,columnspan=2)
            self.id_string_var.set(self.id_pedido)            

            self.label_direccion.grid(row=2, column=0, padx=10, pady=10)
            self.lab_direccion.grid(row=2, column=1, padx=10, pady=10, columnspan=2)
            self.dir_string_var.set(self.direccion_pedido)

            self.label_fecha_entrega.grid(row=3, column=0, padx=10, pady=10)
            self.lab_fecha_entrega.grid(row=3, column=1, padx=10, pady=10, columnspan=2)
            self.fecha_string_var.set(self.fecha_pedido)

            self.label_costo.grid(row=4, column=0, padx=10, pady=10)
            self.lab_costo.grid(row=4, column=1, padx=10, pady=10, columnspan=2)
            self.costo_string_var.set(self.costo_pedido)

            # mostrar lo necesario para la interfaz de pedidos recibidos

            c , prod_pend = self.datos.poducto_por_pedido(self.ID_usuario_g, self.id_pedido)
            for i in range(0,c):
                eval ("self.pedido_producto_tabla.insert('', 0 , text=" + str(prod_pend[i][1]) +", values =('"+ str(prod_pend[i][2]) +"', '"+ str(prod_pend[i][3]) +"', '"+ str(prod_pend[i][4]) +"', '"+ str(prod_pend[i][4] * prod_pend[i][3])+"' ))")
        

            self.pedido_producto_tabla.grid(row=5, column=0, columnspan=4, sticky='nse')
            self.scroll_pedido_producto.grid(row=5, column=4, sticky='nse')
            self.cancelar_pedido_bot.grid(row=7, column=1, columnspan=2)


    def cancelar_pedido_fun(self):
        self.datos.eliminar_pedido(self.ID_usuario_g, self.id_pedido)
        self.pedidos_pendientes_fun()


    def ver_recibidos_fun(self):
        try:
            self.id_pedido = self.pedidos_recibidos_tabla.item(self.pedidos_recibidos_tabla.selection())['text']
            self.direccion_pedido = self.pedidos_recibidos_tabla.item(self.pedidos_recibidos_tabla.selection())['values'][0]
            self.fecha_pedido = self.pedidos_recibidos_tabla.item(self.pedidos_recibidos_tabla.selection())['values'][1]
            self.costo_pedido = self.pedidos_recibidos_tabla.item(self.pedidos_recibidos_tabla.selection())['values'][2]

        except:
            pass

        if (self.id_pedido != ''):

            self.limpiarventana()
            self.label_id_pedido.grid(row=1,column=0, padx=10, pady=10)
            self.lab_id_pedido.grid(row=1, column=1, padx=10, pady=10,columnspan=2)
            self.id_string_var.set(self.id_pedido)            

            self.label_direccion.grid(row=2, column=0, padx=10, pady=10)
            self.lab_direccion.grid(row=2, column=1, padx=10, pady=10, columnspan=2)
            self.dir_string_var.set(self.direccion_pedido)

            self.label_fecha_entrega.grid(row=3, column=0, padx=10, pady=10)
            self.lab_fecha_entrega.grid(row=3, column=1, padx=10, pady=10, columnspan=2)
            self.fecha_string_var.set(self.fecha_pedido)

            self.label_costo.grid(row=4, column=0, padx=10, pady=10)
            self.lab_costo.grid(row=4, column=1, padx=10, pady=10, columnspan=2)
            self.costo_string_var.set(self.costo_pedido)

            # mostrar lo necesario para la interfaz de pedidos recibidos

            c , prod_pend = self.datos.poducto_por_pedido(self.ID_usuario_g, self.id_pedido)
            for i in range(0,c):
                eval ("self.recibido_producto_tabla.insert('', 0 , text=" + str(prod_pend[i][1]) +", values =('"+ str(prod_pend[i][2]) +"', '"+ str(prod_pend[i][3]) +"', '"+ str(prod_pend[i][4]) +"', '"+ str(prod_pend[i][4] * prod_pend[i][3])+"' ))")
        

            self.recibido_producto_tabla.grid(row=5, column=0, columnspan=4, sticky='nse')
            self.scroll_recibido_producto.grid(row=5, column=4, sticky='nse')
            #self.cancelar_pedido_bot.grid(row=7, column=1, columnspan=2)




    def perfil_fun(self):
        
        self.limpiarventana()

        datos_usuario = self.datos.ver_perfil(self.ID_usuario_g)
        print(datos_usuario)

        self.label_perfil_id.grid(row=1,column=1, padx=10, pady=30)
        self.p_lab_id.grid(row=1, column=2, padx=10, pady=10)
        self.p_id_string_var.set(datos_usuario[0][0])

        self.label_perfil_nombre.grid(row=2,column=1, padx=10, pady=30)
        self.p_lab_nombre.grid(row=2, column=2, padx=10, pady=10)
        self.p_nombre_string_var.set(datos_usuario[0][1])
        
        self.label_perfil_numero.grid(row=3,column=1, padx=10, pady=30)
        self.p_lab_numero.grid(row=3, column=2, padx=10, pady=10)
        self.p_numero_string_var.set(datos_usuario[0][2])

        self.label_perfil_correo.grid(row=4,column=1, padx=10, pady=30)
        self.p_lab_correo.grid(row=4, column=2, padx=10, pady=10)
        self.p_correo_string_var.set(datos_usuario[0][3])

        self.label_perfil_dir.grid(row=5,column=1, padx=10, pady=30)
        self.p_lab_direccion.grid(row=5, column=2, padx=10, pady=10)
        self.p_dir_string_var.set(datos_usuario[0][4])

        

        self.cantidad_ped = self.datos.cantidad_pedidos(self.ID_usuario_g)
        
        self.label_perfil_cantidad.grid(row=6,column=1, padx=10, pady=30)
        self.p_lab_cantidad.grid(row=6, column=2, padx=10, pady=10)
        self.p_cantidad_string_var.set(self.cantidad_ped)
        

        self.pedidos_pendientes_bot.config(state='normal')
        self.pedidos_recibidos_bot.config(state='normal')
        self.nuevo_pedido_bot.config(state='normal')
        self.perfil_bot.config(state='disabled')







    #en esta funcion cuyo nombre quedo de la puta mrda va el codigo para crear un nuevo pedido en la tabla pedidos
    #el codigo para el producto_pedido  o algo asi va en la de registrar_producto_fun
    def productos_fun(self):
        self.pedidos_pendientes_bot.config(state='normal')
        self.pedidos_recibidos_bot.config(state='normal')
        self.nuevo_pedido_bot.config(state='disabled')
        self.perfil_bot.config(state='normal')

        self.limpiarventana()

        self.datos.crear_pedido(self.ID_usuario_g,self.DIRECCION_g)

        #self.pedidos_pendientes_tabla.grid(row=1, column=0, columnspan=4, sticky='nse')
        self.productos_tabla.grid(row=1, column=0, columnspan=4, sticky='nse')
        self.scroll_productos.grid(row=1, column=4, sticky='nse')
        self.entry_cantidad.config(state='normal')
        self.label_cantidad.grid(row=8, column=0)
        self.entry_cantidad.grid(row=8, column=1)
        self.registrar_producto_bot.grid(row=8,column=2)
        self.finalizar_pedido.grid(row=8, column=3)

        c , prod_1 = self.datos.ver_productos_1()
        for i in range(0,c):
            eval ("self.productos_tabla.insert('', 0 , text=" + str(prod_1[i][0]) +", values =('"+ str(prod_1[i][1]) +"', '"+ str(prod_1[i][2]) +"' ))")
        
        c , prod_2 = self.datos.ver_productos_2()
        for i in range(0,c):
            eval ("self.productos_tabla.insert('', 0 , text=" + str(prod_2[i][0]) +", values =('"+ str(prod_2[i][1]) +"', '"+ str(prod_2[i][2]) +"' ))")

        c , prod_3 = self.datos.ver_productos_3()
        for i in range(0,c):
            eval ("self.productos_tabla.insert('', 0 , text=" + str(prod_3[i][0]) +", values =('"+ str(prod_3[i][1]) +"', '"+ str(prod_3[i][2]) +"' ))")



    #en esta funcion va el codigo para registrar un nuevo producto en un nuevo pedido
    def registrar_producto_fun(self):
        if(self.entry_cantidad.get()!=''):
            try:
                self.id_producto = self.productos_tabla.item(self.productos_tabla.selection())['text']
                self.nombre_producto = self.productos_tabla.item(self.productos_tabla.selection())['values'][0]
                self.precio_producto = self.productos_tabla.item(self.productos_tabla.selection())['values'][1]

            except:
                pass
            self.datos.agregar_pedido_producto(self.id_producto,self.nombre_producto,self.precio_producto,self.entry_cantidad.get())
            print('product agregado')


    def agregar_pedido_fun(self):
        self.datos.terminar_pedido()
        print('pedido agregado')




    def limpiartablas(self):
        for item in self.pedidos_pendientes_tabla .get_children():
            self.pedidos_pendientes_tabla.delete(item)

        for item in self.pedidos_recibidos_tabla .get_children():
            self.pedidos_recibidos_tabla.delete(item)

        for item in self.pedido_producto_tabla .get_children():
            self.pedido_producto_tabla.delete(item)
        
        for item in self.recibido_producto_tabla .get_children():
            self.recibido_producto_tabla.delete(item)

        for item in self.productos_tabla.get_children():
            self.productos_tabla.delete(item)

    def limpiarventana(self):
        self.limpiartablas()
        self.finalizar_pedido.grid_forget()
        self.pedidos_pendientes_tabla.grid_forget()
        self.scroll_pendientes.grid_forget()
        self.pedidos_recibidos_tabla.grid_forget()
        self.scroll_recibidos.grid_forget()
        self.pedido_producto_tabla.grid_forget()
        self.scroll_pedido_producto.grid_forget()
        self.recibido_producto_tabla.grid_forget()
        self.scroll_recibido_producto.grid_forget()
        #self.productos_tabla.grid_forget()
        #self.scroll_productos.grid_forget()
        self.ver_pedido_bot.grid_forget()
        self.ver_recibido_bot.grid_forget()
        self.cancelar_pedido_bot.grid_forget()
        self.label_id_pedido.grid_forget()
        self.lab_id_pedido.grid_forget()
        self.label_costo.grid_forget()
        self.lab_costo.grid_forget()
        self.label_productos.grid_forget()
        #self.lab_productos.grid_forget()
        self.label_direccion.grid_forget()
        self.lab_direccion.grid_forget()
        self.label_fecha_entrega.grid_forget()
        self.lab_fecha_entrega.grid_forget()
        #self.lab_cantidad.grid_forget()
        self.continuar_bot.grid_forget()
        self.registrar_producto_bot.grid_forget()
        self.entry_fecha_entrega.grid_forget()
        self.entry_direccion.grid_forget()

        self.label_perfil_nombre.grid_forget()
        self.label_perfil_numero.grid_forget()
        self.label_perfil_dir.grid_forget()
        self.label_perfil_correo.grid_forget()
        self.label_perfil_id.grid_forget()

        self.p_lab_id.grid_forget()
        self.p_lab_nombre.grid_forget()
        self.p_lab_numero.grid_forget()
        self.p_lab_correo.grid_forget()
        self.p_lab_direccion.grid_forget()

        self.label_cantidad.grid_forget()
        self.entry_cantidad.grid_forget()
        self.productos_tabla.grid_forget()
        self.scroll_productos.grid_forget()

        self.label_perfil_cantidad.grid_forget()
        self.p_lab_cantidad.grid_forget()
