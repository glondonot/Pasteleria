import tkinter as tk
from tkinter import ttk

class Frame(tk.Frame):
    def __init__(self, root = None):
        super().__init__(root)
        self.root = root
        self.pack()
        self.config(bg = '#FFDDDD')

        #creacion y configuracion de la tabla de pedidos pendientes
        self.pedidos_pendientes_tabla = ttk.Treeview(self, columns = ('Id','Direccion', 'Fecha_de_entrega', 'Costo'))
        self.scroll_pendientes = ttk.Scrollbar(self, orient = 'vertical', command = self.pedidos_pendientes_tabla.yview)
        self.pedidos_pendientes_tabla.heading('#0', text = 'ID')
        self.pedidos_pendientes_tabla.heading('#1', text = 'DIRECCION')
        self.pedidos_pendientes_tabla.heading('#2', text = 'FECHA DE ENTREGA')
        self.pedidos_pendientes_tabla.heading('#3', text = 'COSTO')
        self.pedidos_pendientes_tabla.config(height = 20, yscrollcommand = self.scroll_pendientes.set)


        #datos de ejemplo para la tabla de pedidos pendientes
        self.pedidos_pendientes_tabla.insert('', 0, text='6', values=('calle 7a #4-52', '25/12/2022', '100000'))
        self.pedidos_pendientes_tabla.insert('', 0, text='5', values=('calle 7a #4-52', '25/8/2022', '100000'))
        self.pedidos_pendientes_tabla.insert('', 0, text='4', values=('calle 7a #4-52', '25/7/2022', '100000'))
        self.pedidos_pendientes_tabla.insert('', 0, text='3', values=('calle 7a #4-52', '25/4/2022', '100000'))
        self.pedidos_pendientes_tabla.insert('', 0, text='2', values=('calle 7a #4-52', '21/4/2022', '100000'))
        self.pedidos_pendientes_tabla.insert('', 0, text='1', values=('calle 7a #4-52', '12/11/2022', '100000'))
        self.pedidos_pendientes_tabla.insert('', 0, text='0', values=('calle 7a #4-52', '22/11/2022', '100000'))


        #creacion y configuracion de la tabla pedidos recibidos
        self.pedidos_recibidos_tabla = ttk.Treeview(self, columns=('Id','Direccion', 'Fecha_de_entrega', 'Costo'))
        self.scroll_recibidos = ttk.Scrollbar(self, orient='vertical', command=self.pedidos_recibidos_tabla.yview)
        self.pedidos_recibidos_tabla.heading('#0', text='ID')
        self.pedidos_recibidos_tabla.heading('#1', text='DIRECCION')
        self.pedidos_recibidos_tabla.heading('#2', text='FECHA DE ENTREGA')
        self.pedidos_recibidos_tabla.heading('#3', text='COSTO')
        self.pedidos_recibidos_tabla.config(height=20, yscrollcommand= self.scroll_pendientes.set)
        # datos de ejemplo para la tabla de pedidos recibidos
        self.pedidos_recibidos_tabla.insert('', 0, text='6', values=('calle 7a #4-52', '25/12/2022', '20000'))
        self.pedidos_recibidos_tabla.insert('', 0, text='5', values=('calle 7a #4-52', '25/8/2022', '20000'))
        self.pedidos_recibidos_tabla.insert('', 0, text='4', values=('calle 7a #4-52', '25/7/2022', '20000'))
        self.pedidos_recibidos_tabla.insert('', 0, text='3', values=('calle 7a #4-52', '25/4/2022', '20000'))
        self.pedidos_recibidos_tabla.insert('', 0, text='2', values=('calle 7a #4-52', '21/4/2022', '20000'))
        self.pedidos_recibidos_tabla.insert('', 0, text='1', values=('calle 7a #4-52', '12/11/2022', '20000'))
        self.pedidos_recibidos_tabla.insert('', 0, text='0', values=('calle 7a #4-52', '22/11/2022', '20000'))

       
       
       
       
       
        # creacion y configuracion de la tabla de productos de un pedido
        self.pedido_producto_tabla = ttk.Treeview(self, columns=('Nombre', 'Precio', 'Cantidad', 'total'))
        self.scroll_pedido_producto = ttk.Scrollbar(self, orient='vertical', command=self.pedido_producto_tabla.yview)
        self.pedido_producto_tabla.heading('#0', text='ID')
        self.pedido_producto_tabla.heading('#1', text='NOMBRE')
        self.pedido_producto_tabla.heading('#2', text='PRECIO')
        self.pedido_producto_tabla.heading('#3', text='CANTIDAD')
        self.pedido_producto_tabla.heading('#4', text='TOTAL')
        self.pedido_producto_tabla.config(height=6, yscrollcommand=self.scroll_pedido_producto.set)

        # datos de ejemplo para la tabla de pedidos pendientes
        self.pedido_producto_tabla.insert('', 0, text='1', values=('cupcake', '25000', '6', '123123'))


        # creacion y configuracion de la tabla de productos de un recibido
        self.recibido_producto_tabla = ttk.Treeview(self, columns=('Nombre', 'Precio', 'Cantidad', 'total'))
        self.scroll_recibido_producto = ttk.Scrollbar(self,
                                                    orient='vertical', command=self.recibido_producto_tabla.yview)
        self.recibido_producto_tabla.heading('#0', text='ID')
        self.recibido_producto_tabla.heading('#1', text='NOMBRE')
        self.recibido_producto_tabla.heading('#2', text='PRECIO')
        self.recibido_producto_tabla.heading('#3', text='CANTIDAD')
        self.recibido_producto_tabla.heading('#4', text='TOTAL')
        self.recibido_producto_tabla.config(height=6, yscrollcommand=self.scroll_recibido_producto.set)

        # datos de ejemplo para la tabla de pedidos pendientes
        self.recibido_producto_tabla.insert('', 0, text='1', values=('torta', '25234', '10', '27361'))






        # creacion y configuracion de la tabla pedidos recibidos
        self.productos_tabla = ttk.Treeview(self, columns=('id_producto', 'nombre', 'precio'))
        self.scroll_productos = ttk.Scrollbar(self,
                                              orient='vertical', command=self.productos_tabla.yview)
        self.productos_tabla.heading('#0', text='ID')
        self.productos_tabla.heading('#1', text='ID PRODUCTO')
        self.productos_tabla.heading('#2', text='NOMBRE')
        self.productos_tabla.heading('#3', text='PRECIO')
        self.productos_tabla.config(height=20, yscrollcommand=self.scroll_pendientes.set)
        # datos de ejemplo para la tabla de pedidos recibidos
        self.productos_tabla.insert('', 0, text='6', values=('100', 'pene', 'ayuda dios'))
        self.productos_tabla.insert('', 0, text='5', values=('101', 'superpene', 'porfa'))


        #creacion y configuracion boton ver pedido xd
        self.ver_pedido_bot = tk.Button(self, text="VER PEDIDO", command=self.ver_pendientes_fun)
        self.ver_pedido_bot.config(width=20, font=('Arial', 12, 'bold'), fg='#DAD5D6')

        # creacion y configuracion boton ver pedido xd
        self.ver_recibido_bot = tk.Button(self, text="VER PEDIDO", command=self.ver_recibidos_fun)
        self.ver_recibido_bot.config(width=20, font=('Arial', 12, 'bold'), fg='#DAD5D6')

        # creacion y configuracion boton cancelar pedido
        self.cancelar_pedido_bot = tk.Button(self, text="CANCELAR PEDIDO", command=self.cancelar_pedido_fun)
        self.cancelar_pedido_bot.config(width=20, font=('Arial', 12, 'bold'), fg='#DAD5D6')

        # creacion y configuracion boton CONTINUAR para nuevo pedido
        self.continuar_bot = tk.Button(self, text="CONTINUAR", command=self.continuar_fun)
        self.continuar_bot.config(width=20, font=('Arial', 12, 'bold'), fg='#DAD5D6')

        # creacion y configuracion boton registrar producto para nuevo pedido
        self.registrar_producto_bot = tk.Button(self, text="REGISTRAR PRODUCTO", command=self.registrar_producto_fun)
        self.continuar_bot.config(width=20, font=('Arial', 12, 'bold'), fg='#DAD5D6')

        # creacion y configuracion boton finalizar pedido para nuevo pedido
        self.finalizar_pedido = tk.Button(self, text="FINALIZAR", command=self.pedidos_pendientes_fun)
        self.finalizar_pedido.config(width=20, font=('Arial', 12, 'bold'), fg='#DAD5D6')

        self.label_id_pedido = tk.Label(self, text= 'Id pedido:')
        self.label_id_pedido.config(font=('Arial', 12, 'bold'), bg='#FFFFFF')
        self.mi_Id_pedido = tk.StringVar()
        self.entry_id_pedido = tk.Entry(self, textvariable=self.mi_Id_pedido)
        self.entry_id_pedido.config(width=50, state='disable', font=('Arial', 12))



        self.label_direccion = tk.Label(self, text='Direccion:')
        self.label_direccion.config(font=('Arial', 12, 'bold'), bg='#FFFFFF')
        self.mi_direccion = tk.StringVar()
        self.entry_direccion = tk.Entry(self, textvariable=self.mi_direccion)
        self.entry_direccion.config(width=50, state='disable', font=('Arial', 12))

        self.label_fecha_entrega = tk.Label(self, text='Fecha de entrega:')
        self.label_fecha_entrega.config(font=('Arial', 12, 'bold'), bg='#FFFFFF')
        self.mi_fecha = tk.StringVar()
        self.entry_fecha_entrega = tk.Entry(self, textvariable=self.mi_fecha)
        self.entry_fecha_entrega.config(width=50, state='disable', font=('Arial', 12))

        self.label_costo = tk.Label(self, text='Costo:')
        self.label_costo.config(font=('Arial', 12, 'bold'), bg='#FFFFFF')
        self.mi_costo = tk.StringVar()
        self.entry_costo = tk.Entry(self, textvariable=self.mi_costo)
        self.entry_costo.config(width=50, state='disable', font=('Arial', 12))

        self.label_productos = tk.Label(self, text='Productos')
        self.label_productos.config(font=('Arial', 12, 'bold'), bg='#FFFFFF')
        self.entry_productos = tk.Entry(self)
        self.entry_productos.config(width=50, state='disable', font=('Arial', 12))

        self.label_cantidad = tk.Label(self, text='Cantidad')
        self.label_cantidad.config(font=('Arial', 12, 'bold'), bg='#FFFFFF')
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
        self.pedidos_pendientes_bot.config(width=20, font=('Arial', 12, 'bold'),fg='#DAD5D6')
        self.pedidos_pendientes_bot.grid(row=0, column=0, padx=10, pady=10)

        self.pedidos_recibidos_bot = tk.Button(self, text="PEDIDOS RECIBIDOS", command=self.pedidos_recibidos_fun)
        self.pedidos_recibidos_bot.config(width=20, font=('Arial', 12, 'bold'),fg='#DAD5D6')
        self.pedidos_recibidos_bot.grid(row=0, column=1, padx=10, pady=10)

        self.nuevo_pedido_bot = tk.Button(self, text="PEDIDO NUEVO", command=self.nuevo_pedido_fun)
        self.nuevo_pedido_bot.config(width=20, font=('Arial', 12, 'bold'),fg='#DAD5D6')
        self.nuevo_pedido_bot.grid(row=0, column=2, padx=10, pady=10)

        self.perfil_bot = tk.Button(self, text="PERFIL", command=self.perfil_fun)
        self.perfil_bot.config(width=20, font=('Arial', 12, 'bold'),fg='#DAD5D6')
        self.perfil_bot.grid(row=0, column=3, padx=10, pady=10)

    def pedidos_pendientes_fun(self):
        self.limpiarventana()
        self.pedidos_pendientes_bot.config(state='disabled')
        self.pedidos_recibidos_bot.config(state='normal')
        self.nuevo_pedido_bot.config(state='normal')
        self.perfil_bot.config(state='normal')

        #mostrar lo necesario para la interfaz de pedidos pendientes
        self.pedidos_pendientes_tabla.grid(row=1, column=0, columnspan=4, sticky='nse')
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
        self.scroll_recibidos.grid(row=1, column=4, sticky='nse')
        self.ver_recibido_bot.grid(row=9,column=1,columnspan=2)
        print("mostrando pedidos recibidos")

    def nuevo_pedido_fun(self):

        self.limpiarventana()
        self.entry_direccion.config(state='normal')
        self.label_direccion.grid(row=1, column=0, padx=10, pady=10)
        self.entry_direccion.grid(row=1, column=1, padx=10, pady=10, columnspan=2)
#########
        self.entry_fecha_entrega.config(state='normal')
        self.label_fecha_entrega.grid(row=2, column=0, padx=10, pady=10)
        self.entry_fecha_entrega.grid(row=2, column=1, padx=10, pady=10, columnspan=2)

        self.direccion = self.entry_direccion.get()
        self.fecha = self.entry_fecha_entrega.get()

        self.continuar_bot.grid(row=3,column=1,columnspan=2)

        self.pedidos_pendientes_bot.config(state='normal')
        self.pedidos_recibidos_bot.config(state='normal')
        self.nuevo_pedido_bot.config(state='disabled')
        self.perfil_bot.config(state='normal')
        print("mostrando nuevo pedido")

    def perfil_fun(self):
        self.pedidos_pendientes_bot.config(state='normal')
        self.pedidos_recibidos_bot.config(state='normal')
        self.nuevo_pedido_bot.config(state='normal')
        self.perfil_bot.config(state='disabled')
        print("mostrando perfil")


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
            self.entry_id_pedido.grid(row=1, column=1, padx=10, pady=10,columnspan=2)

            self.label_direccion.grid(row=2, column=0, padx=10, pady=10)
            self.entry_direccion.grid(row=2, column=1, padx=10, pady=10, columnspan=2)

            self.label_fecha_entrega.grid(row=3, column=0, padx=10, pady=10)
            self.entry_fecha_entrega.grid(row=3, column=1, padx=10, pady=10, columnspan=2)

            self.label_costo.grid(row=4, column=0, padx=10, pady=10)
            self.entry_costo.grid(row=4, column=1, padx=10, pady=10, columnspan=2)

            # mostrar lo necesario para la interfaz de pedidos recibidos
            self.pedido_producto_tabla.grid(row=5, column=0, columnspan=4, sticky='nse')
            self.scroll_pedido_producto.grid(row=5, column=4, sticky='nse')
            self.cancelar_pedido_bot.grid(row=7, column=1, columnspan=2)

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
            self.entry_id_pedido.grid(row=1, column=1, padx=10, pady=10,columnspan=2)

            self.label_direccion.grid(row=2, column=0, padx=10, pady=10)
            self.entry_direccion.grid(row=2, column=1, padx=10, pady=10, columnspan=2)

            self.label_fecha_entrega.grid(row=3, column=0, padx=10, pady=10)
            self.entry_fecha_entrega.grid(row=3, column=1, padx=10, pady=10, columnspan=2)

            self.label_costo.grid(row=4, column=0, padx=10, pady=10)
            self.entry_costo.grid(row=4, column=1, padx=10, pady=10, columnspan=2)

            # mostrar lo necesario para la interfaz de pedidos recibidos
            self.recibido_producto_tabla.grid(row=5, column=0, columnspan=4, sticky='nse')
            self.scroll_recibido_producto.grid(row=5, column=4, sticky='nse')
            #self.cancelar_pedido_bot.grid(row=7, column=1, columnspan=2)

    def cancelar_pedido_fun(self):
        self.pedidos_pendientes_fun()

    #en esta funcion cuyo nombre quedo de la puta mrda va el codigo para crear un nuevo pedido en la tabla pedidos
    #el codigo para el producto_pedido  o algo asi va en la de registrar_producto_fun
    def continuar_fun(self):
        if(self.entry_direccion.get()!= '' and self.entry_fecha_entrega.get()!=''):
            self.limpiarventana()

            self.productos_tabla.grid(row=1, column=0, columnspan=4, sticky='nse')
            self.scroll_productos.grid(row=1, column=4, sticky='nse')
            self.entry_cantidad.config(state='normal')
            self.label_cantidad.grid(row=8, column=0)
            self.entry_cantidad.grid(row=8, column=1)
            self.registrar_producto_bot.grid(row=8,column=2)
            self.finalizar_pedido.grid(row=8, column=3)

    #en esta funcion va el codigo para registrar un nuevo producto en un nuevo pedido
    def registrar_producto_fun(self):
        if(self.entry_cantidad.get()!=''):
            try:
                self.id_pedido = self.productos_tabla.item(self.productos_tabla.selection())['text']
                self.direccion_pedido = \
                self.productos_tabla.item(self.productos_tabla.selection())['values'][0]
                self.fecha_pedido = \
                self.productos_tabla.item(self.productos_tabla.selection())['values'][1]
                self.costo_pedido = \
                self.productos_tabla.item(self.productos_tabla.selection())['values'][2]

            except:
                pass

            if (self.id_pedido != ''):
                #create del producto con tales y tales
                self.mi_cantidad.set('')
                pass



    def limpiarventana(self):
        self.finalizar_pedido.grid_forget()
        self.pedidos_pendientes_tabla.grid_forget()
        self.scroll_pendientes.grid_forget()
        self.pedidos_recibidos_tabla.grid_forget()
        self.scroll_recibidos.grid_forget()
        self.pedido_producto_tabla.grid_forget()
        self.scroll_pedido_producto.grid_forget()
        self.recibido_producto_tabla.grid_forget()
        self.scroll_recibido_producto.grid_forget()
        self.productos_tabla.grid_forget()
        self.scroll_productos.grid_forget()
        self.ver_pedido_bot.grid_forget()
        self.ver_recibido_bot.grid_forget()
        self.cancelar_pedido_bot.grid_forget()
        self.label_id_pedido.grid_forget()
        self.entry_id_pedido.grid_forget()
        self.label_costo.grid_forget()
        self.entry_costo.grid_forget()
        self.label_productos.grid_forget()
        self.entry_productos.grid_forget()
        self.label_direccion.grid_forget()
        self.entry_direccion.grid_forget()
        self.label_fecha_entrega.grid_forget()
        self.entry_fecha_entrega.grid_forget()
        self.label_cantidad.grid_forget()
        self.entry_cantidad.grid_forget()
        self.continuar_bot.grid_forget()
        self.registrar_producto_bot.grid_forget()
        self.mi_costo.set('')
        self.mi_direccion.set('')
        self.mi_fecha.set('')
        self.mi_Id_pedido.set('')
        self.mi_cantidad.set('')

