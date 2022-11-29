from tkinter import  Tk, Button, Entry, Label, ttk, PhotoImage
from tkinter import  StringVar,END,HORIZONTAL,Frame,Toplevel
import time
import conexion, main_menu, login

doc_entry = 0

class Login(Frame):
	def __init__(self, master, *args):
		super().__init__( master,*args)
		self.user_marcar = "Ingrese su correo"
		self.contra_marcar = "Ingrese su contraseña"
		self.telefono_marcar = "Ingrese su telefono"
		self.direccion_marcar = "Ingrese su dirección"
		self.nombre_marcar = "Ingrese su nombre"
		self.documento_marcar = "Ingrese su documento"
		self.datos = conexion.Registro_datos(conexion.usr, conexion.psswrd)
		self.widgets()

	def entry_out(self, event, event_text):
		if event['fg'] == 'black' and len(event.get()) == 0:
			event.delete(0, END)
			event['fg'] = 'grey'
			event.insert(0, event_text)
		if self.entry2.get() != 'Ingrese su contraseña':
			self.entry2['show'] =""
		if self.entry2.get() != 'Ingrese su correo':
			self.entry2['show'] ="*"

	def entry_in(self, event):
		if event['fg'] == 'grey':
			event['fg'] = 'black'
			event.delete(0, END)
		if self.entry2.get() != 'Ingrese su contraseña':
			self.entry2['show'] = "*"
		
		if self.entry2.get() == 'Ingrese su contraseña':
			self.entry2['show'] = ""
			
	def salir(self):
		self.master.destroy()
		self.master.quit()

	def acceder_main(self):
		self.master.withdraw()
		self.salir()

		root = Tk()
		root.title('Maria Camila Pasteleria')
		# p5 = PhotoImage(file = 'Client/logo.png')
		# root.iconphoto(False, p5)
		root.config(bg='#FFDDDD')
		hight = (root.winfo_screenheight())/2
		width = (root.winfo_screenwidth())/2
		root.geometry('1100x650+{}+{}'.format(int(width-550),int(hight-325)))
		root.resizable(0,0)		
		main_menu.Frame(root = root)		
		root.mainloop()	

	def agregar_datos(self):
		self.indica1['text'] = ''
		self.indica2['text'] = ''
		self.indica3['text'] = ''
		self.indica4['text'] = ''
		self.indica5['text'] = ''
		self.indica6['text'] = ''
		users_entry = self.entry1.get()
		password_entry = self.entry2.get()
		name_entry = self.entry3.get()
		doc_entry = self.entry4.get()
		phone_entry = self.entry5.get()
		dir_entry = self.entry6.get()

		if '@' not in users_entry:
			self.indica1['text'] = ' Correo  invalido'
		
		if doc_entry.isdigit() == False:
			self.indica4['text'] = ' Documento  invalido'

		if phone_entry.isdigit() == False:
			self.indica5['text'] = ' Telefono  invalido'
			
		if '@' in users_entry and doc_entry.isdigit() == True  and  phone_entry.isdigit() == True :
			self.datos.crear_cliente(users_entry, name_entry, phone_entry, dir_entry, doc_entry)
			self.datos.crear_login(doc_entry,users_entry,password_entry)

			self.acceder_main()
			return doc_entry

	



	def widgets(self):
		# label blanco
		self.label_blanco = Label(self.master, text= '', bg='#FFDDDD', fg= 'black', 
			font= ('Lucida Sans', 16, 'bold', 'italic')).grid(row=0, column=0, padx=100, pady=10)


		# usuario y entry
		self.label_usuario = Label(self.master, text= 'Usuario', bg='#FFDDDD', fg= 'black', 
			font= ('Lucida Sans', 16, 'bold', 'italic'))
		self.entry1 = Entry(self.master, font=('Comic Sans MS', 12),justify = 'center', fg='grey',highlightbackground = "#B88BAD", 
			highlightcolor= "#A5F8CE", highlightthickness=3)
		self.entry1.insert(0, self.user_marcar)
		self.entry1.bind("<FocusIn>", lambda args: self.entry_in(self.entry1))
		self.entry1.bind("<FocusOut>", lambda args: self.entry_out(self.entry1, self.user_marcar))

		self.label_usuario.grid(row=1, column=0, padx=100, pady=10)
		self.entry1.grid(row=2, column=0, padx=100, pady=0)
		
		self.indica1 = Label(self.master, bg='#FFDDDD', fg= 'red', font= ('Arial', 12, 'bold'))
		self.indica1.grid(row=3, column=0, padx=100, pady=10)


		# contraseña y entry
		self.label_password = Label(self.master, text= 'Contraseña', bg='#FFDDDD', fg= 'black', 
			font= ('Lucida Sans', 16, 'bold', 'italic'))
		self.entry2 = Entry(self.master,font=('Comic Sans MS', 12),justify = 'center',  fg='grey',highlightbackground = "#B88BAD", 
			highlightcolor= "#A5F8CE", highlightthickness=3)
		self.entry2.insert(0, self.contra_marcar)
		self.entry2.bind("<FocusIn>", lambda args: self.entry_in(self.entry2))
		self.entry2.bind("<FocusOut>", lambda args: self.entry_out(self.entry2, self.contra_marcar))
		
		self.label_password.grid(row=1, column=1, padx=30, pady=10)
		self.entry2.grid(row=2, column=1, padx=30, pady=0)

		self.indica2 = Label(self.master, bg='#FFDDDD', fg= 'red', font= ('Arial', 12, 'bold'))
		self.indica2.grid(row=3, column=1, padx=30, pady=10)


		#ingrese nombre
		self.label_nombre = Label(self.master, text= 'Nombre', bg='#FFDDDD', fg= 'black', 
			font= ('Lucida Sans', 16, 'bold', 'italic'))
		self.entry3 = Entry(self.master, font=('Comic Sans MS', 12),justify = 'center', fg='grey',highlightbackground = "#B88BAD", 
			highlightcolor= "#A5F8CE", highlightthickness=3)
		self.entry3.insert(0, self.nombre_marcar)
		self.entry3.bind("<FocusIn>", lambda args: self.entry_in(self.entry3))
		self.entry3.bind("<FocusOut>", lambda args: self.entry_out(self.entry3, self.nombre_marcar))

		self.label_nombre.grid(row=4, column=0, padx=100, pady=10)
		self.entry3.grid(row=5, column=0, padx=100, pady=0)
		
		self.indica3 = Label(self.master, bg='#FFDDDD', fg= 'red', font= ('Arial', 12, 'bold'))
		self.indica3.grid(row=6, column=0, padx=100, pady=10) 
		

		#ingrese docuemnto
		self.label_documento = Label(self.master, text= 'Documento', bg='#FFDDDD', fg= 'black', 
			font= ('Lucida Sans', 16, 'bold', 'italic'))
		self.entry4 = Entry(self.master, font=('Comic Sans MS', 12),justify = 'center', fg='grey',highlightbackground = "#B88BAD", 
			highlightcolor= "#A5F8CE", highlightthickness=3)
		self.entry4.insert(0, self.documento_marcar)
		self.entry4.bind("<FocusIn>", lambda args: self.entry_in(self.entry4))
		self.entry4.bind("<FocusOut>", lambda args: self.entry_out(self.entry4, self.documento_marcar))

		self.label_documento.grid(row=4, column=1, padx=30, pady=10)
		self.entry4.grid(row=5, column=1, padx=30, pady=0)
		
		self.indica4 = Label(self.master, bg='#FFDDDD', fg= 'red', font= ('Arial', 12, 'bold'))
		self.indica4.grid(row=6, column=1, padx=30, pady=10)
		

		#ingrese telefono
		self.label_telefono = Label(self.master, text= 'Teléfono', bg='#FFDDDD', fg= 'black', 
			font= ('Lucida Sans', 16, 'bold', 'italic'))
		self.entry5 = Entry(self.master, font=('Comic Sans MS', 12),justify = 'center', fg='grey',highlightbackground = "#B88BAD", 
			highlightcolor= "#A5F8CE", highlightthickness=3)
		self.entry5.insert(0, self.telefono_marcar)
		self.entry5.bind("<FocusIn>", lambda args: self.entry_in(self.entry5))
		self.entry5.bind("<FocusOut>", lambda args: self.entry_out(self.entry5, self.telefono_marcar))

		self.label_telefono.grid(row=7, column=0, padx=100, pady=10)
		self.entry5.grid(row=8, column=0, padx=100, pady=0)
	

		self.indica5 = Label(self.master, bg='#FFDDDD', fg= 'red', font= ('Arial', 12, 'bold'))
		self.indica5.grid(row=9, column=0, padx=100, pady=10) 
		

		#ingrese direccion
		self.label_direccion = Label(self.master, text= 'Dirección', bg='#FFDDDD', fg= 'black', 
			font= ('Lucida Sans', 16, 'bold', 'italic'))
		self.entry6 = Entry(self.master, font=('Comic Sans MS', 12),justify = 'center', fg='grey',highlightbackground = "#B88BAD", 
			highlightcolor= "#A5F8CE", highlightthickness=3)
		self.entry6.insert(0, self.direccion_marcar)
		self.entry6.bind("<FocusIn>", lambda args: self.entry_in(self.entry6))
		self.entry6.bind("<FocusOut>", lambda args: self.entry_out(self.entry6, self.direccion_marcar))

		self.label_direccion.grid(row=7, column=1, padx=30, pady=10)
		self.entry6.grid(row=8, column=1, padx=30, pady=0)

		self.indica6 = Label(self.master, bg='#FFDDDD', fg= 'red', font= ('Arial', 12, 'bold'))
		self.indica6.grid(row=9, column=1, padx=30, pady=10)


		# label blanco
		self.label_blanco4 = Label(self.master, text= '', bg='#FFDDDD', fg= 'black', 
			font= ('Lucida Sans', 16, 'bold', 'italic')).grid(row=9, column=0, padx=100, pady=0)


		#boton singup
		Button(self.master, text= 'Registrarse',  command = self.agregar_datos, activebackground='green2', bg='#85DE77',
			font=('Lucida Sans', 12,'italic','bold'),justify = 'right').grid(row=10, column=0, padx=100, pady=50)

		#boton login
		Button(self.master, text= 'Devolverse', bg='#FF756D',activebackground='red', bd=2, fg = 'black', font=('Lucida Sans', 12,'italic','bold'),
			command=self.acceder_login).grid(row=10, column=1, padx=30, pady=50)


	def acceder_login(self):
		self.master.withdraw()
		self.salir()

		ventana = Tk()
		ventana.title('Maria Camila Pasteleria')
		# p3 = PhotoImage(file = 'Client/logo.png')
		# ventana.iconphoto(False, p3)
		ventana.config(bg='#FFDDDD')
		hight = (ventana.winfo_screenheight())/2
		width = (ventana.winfo_screenwidth())/2
		ventana.geometry('400x650+{}+{}'.format(int(width-200),int(hight-325)))
		ventana.resizable(0,0)

		app = login.Login(ventana)
		app.mainloop()
	
doc_entry = Login.agregar_datos