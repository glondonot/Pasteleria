from tkinter import  Tk, Button, Entry, Label, ttk, PhotoImage
from tkinter import  StringVar,END,HORIZONTAL,Frame,Toplevel
import time
import conexion, main_menu, singup

class Login(Frame):
	def __init__(self, master, *args):
		super().__init__( master,*args)
		self.user_marcar = "Ingrese su correo"
		self.contra_marcar = "Ingrese su contraseña"
		self.fila1 = ''
		self.fila2 = ''
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
		for i in  range(101):
			self.barra['value'] +=1
			self.master.update()
			time.sleep(0.02)

		self.master.withdraw()
		self.salir()

		root = Tk()
		root.title('Maria Camila Pasteleria')
		p4 = PhotoImage(file = 'Client/logo.png')
		root.iconphoto(False, p4)
		root.config(bg='#FFDDDD')
		root.geometry('1100x650+450+200')
		root.resizable(0,0)		
		main_menu.Frame(root)		
		root.mainloop()	

	def verificacion_users(self):
		self.indica1['text'] = ''
		self.indica2['text'] = ''		
		users_entry = self.entry1.get()
		password_entry = self.entry2.get()

		if users_entry!= self.user_marcar or self.contra_marcar != password_entry:
			users_entry = str("'" + users_entry + "'")
			password_entry = str("'" + password_entry + "'")

			dato1 = self.datos.busca_users(users_entry)
			dato2 = self.datos.busca_password(password_entry)

			self.fila1 = dato1
			self.fila2 = dato2 

			if self.fila1 == self.fila2:	
				if dato1 == [] and dato2 == []:
					self.indica2['text'] = 'Contraseña incorrecta'
					self.indica1['text'] = 'Usuario incorrecto'
				else:

					if dato1 == []:
						self.indica1['text'] = 'Usuario incorrecto'
					else:
						dato1 = dato1[0][1]

					if dato2 == []:
						self.indica2['text'] = 'Contraseña incorrecta'
					else:
						dato2 = dato2[0][2]

					if dato1 != [] and dato2 != []:
						self.acceder_main()

			else:
				self.indica1['text'] = 'Usuario incorrecto'
				self.indica2['text'] = 'Contraseña incorrecta'

	def widgets(self):
		self.logo = PhotoImage(file ='Client/logo.png')
		Label(self.master, image= self.logo, bg='#FFDDDD',height=210, width=210).pack()

		# usuario y entry
		Label(self.master, text= 'Usuario', bg='#FFDDDD', fg= 'black', font= ('Lucida Sans', 16, 'bold', 'italic')).pack(pady=5)
		self.entry1 = Entry(self.master, font=('Comic Sans MS', 12),justify = 'center', fg='grey',highlightbackground = "#B88BAD", 
			highlightcolor= "#A5F8CE", highlightthickness=3)
		self.entry1.insert(0, self.user_marcar)
		self.entry1.bind("<FocusIn>", lambda args: self.entry_in(self.entry1))
		self.entry1.bind("<FocusOut>", lambda args: self.entry_out(self.entry1, self.user_marcar))
		self.entry1.pack(pady=4)   

		self.indica1 = Label(self.master, bg='#FFDDDD', fg= 'red', font= ('Arial', 10, 'bold'))
		self.indica1.pack(pady=5)                             

		# contraseña y entry
		Label(self.master, text= 'Contraseña', bg='#FFDDDD', fg= 'black', font= ('Lucida Sans', 16, 'bold', 'italic')).pack(pady=5)
		self.entry2 = Entry(self.master,font=('Comic Sans MS', 12),justify = 'center',  fg='grey',highlightbackground = "#B88BAD", 
			highlightcolor= "#A5F8CE", highlightthickness=3)
		self.entry2.insert(0, self.contra_marcar)
		self.entry2.bind("<FocusIn>", lambda args: self.entry_in(self.entry2))
		self.entry2.bind("<FocusOut>", lambda args: self.entry_out(self.entry2, self.contra_marcar))
		self.entry2.pack(pady=4)

		self.indica2 = Label(self.master, bg='#FFDDDD', fg= 'red', font= ('Arial', 10, 'bold'))
		self.indica2.pack(pady=5)

		#boton login
		Button(self.master, text= 'Iniciar Sesion',  command = self.verificacion_users, activebackground='green2', bg='#85DE77', font=('Lucida Sans', 12,'italic','bold')).pack(pady=3)

		#boton singup
		Button(self.master, text= 'Registrarse', bg='#FFDDDD',activebackground='#FEC8D8', bd=0, font=('Lucida Sans', 12,'italic','bold','underline'),command= self.acceder_singup).pack(pady=1)

		#barra de carga
		estilo = ttk.Style()
		estilo.theme_use('clam')
		estilo.configure("TProgressbar", foreground='red', background='#B88BAD',troughcolor='#FFDDDD', bordercolor='#B88BAD',lightcolor='#B88BAD', darkcolor='#B88BAD')
		self.barra = ttk.Progressbar(self.master, orient= HORIZONTAL, length=300, mode='determinate', maximum=100, style="TProgressbar")
		self.barra.pack(pady=20)
		

		#boton salir
		Button(self.master, text= 'Salir', bg='#FF756D',activebackground='red', bd=2, fg = 'black', font=('Lucida Sans', 15,'italic','bold'),command= self.salir).pack(pady=10)


	def acceder_singup(self):
		self.master.withdraw()
		self.salir()

		ventana2 = Tk()
		ventana2.title('Maria Camila Pasteleria')
		p2 = PhotoImage(file = 'Client/logo.png')
		ventana2.iconphoto(False, p2)
		ventana2.config(bg='#FFDDDD')
		ventana2.geometry('800x650+600+200')
		ventana2.resizable(0,0)		
		singup.Login(ventana2)		
		ventana2.mainloop()

