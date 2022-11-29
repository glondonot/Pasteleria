from tkinter import  Tk, PhotoImage

import login


if __name__ == "__main__":
	ventana = Tk()
	ventana.title('Maria Camila Pasteleria')
	hight = (ventana.winfo_screenheight())/2
	width = (ventana.winfo_screenwidth())/2
	#icono de la ventana
	# p1 = PhotoImage(file = 'Client/logo.png')
	# ventana.iconphoto(False, p1)
	ventana.config(bg='#FFDDDD')
	ventana.geometry('400x650+{}+{}'.format(int(width-200),int(hight-325)))
	ventana.resizable(0,0)

	app = login.Login(ventana)
	app.mainloop()