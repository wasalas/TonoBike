*!*	lunes 30 de abril de 2007
*!*	 Trucos - Visual FoxPro 
*!*	LOS TRUCOS AQUI MOSTRADOS HAN SIDO RECOPILADOS DE VARIAS PAGINAS Y NO SON PROPIEDAD INTELECTUAL DEL AUTOR DE ESTE BLOG, HAN SIDO RECOPILADOS CON EL FIN DE QUE SIRVAN COMO AYUDA A MUCHOS PROGRAMADORES.

*!*	Mostrar un reporte dentro de un formulario
*!*	Excelente truco con el cual podrás mostrar tu reporte en un formulario. 
*!*	oRep =Createobject("Form")
*!*	With oRep
*!*	 .Caption= "Titulo del Reporte"
*!*	 .WindowState= 2
*!*	 .Show()
*!*	Endwith
*!*	Report Form MiReporte.frx Preview Window (oRep.Name)

*!*	Hacer que hable el PC
*!*	Excelente truco que utiliza el objeto COM SAPI que viene con WinXP el cual "pronuncia" lo que le escribas.
*!*	oVoz = CreateObject("SAPI.SpVoice") 
*!*	oVoz.Speak("Visual fox Pro") 
*!*	oVoz.Speak("Lo mejor")

*!*	Extraer información de los MP3
*!*	Quieres conocer la información de los archivos MP3 ?? ... autor, titulo, álbum, año ...
*!*	lnFile = Fopen(Getfile())
*!*	Fseek(lnFile, -128,2)
*!*	lcTag = Fread(lnFile, 128)
*!*	? "Titulo: ", Strtran(Substr(lcTag,4,30), Chr(0))
*!*	? "Artista: ", Strtran(Substr(lcTag,34,30), Chr(0))
*!*	? "Album: ", Strtran(Substr(lcTag,64,30), Chr(0))
*!*	? "Año: ", Val(Substr(lcTag,94,4))
*!*	Fclose(lnFile)

*!*	Suprimir ventana "Imprimiendo" en VFP 8
*!*	Uno de las nuevas características incorporadas en VFP 8, si deseas puedes impedir que se vea la ventana "Imprimiendo" que se muestra cuando ejecutas un reporte.
*!*	Report Form NombreReporte To Printer Prompt NODIALOG Preview

*!*	Nombre del dominio en que se logeo el PC
*!*	p align="justify">Un pequeño truco para cuando quieras determinar en que dominio se logeo un determinado PC.
*!*	? GetEnv("USERDOMAIN")

*!*	Determinar si una unidad de red esta disponible
*!*	Esta es la forma más sencilla para determinar si un equipo de la red esta encendido o si esta disponible una determinada unidad de red. 
*!*	Si la unidad esta disponible se devolverá -1 y si la unidad no existe o esta apagado el PC entonces devolverá -1
*!*	? DISKSPACE("\\NombreServidor\C\")

*!*	Compactar base de datos de Access desde VFP
*!*	Muy buen truco que permite compactar una base de datos de Access desde VFP.
*!*	oJE = CreateObject("JRO.JetEngine")
*!*	oJE.CompactDatabase("Data Source=" + "d:articulos.mdb", "Data Source=" + "d:articulos1.mdb")
*!*	Los parámetros para el método CompacDatabase son los siguientes 
*!*	Primer parámetro
*!*	 "Data Source=" + "ruta de la base de datos a compactar" 
*!*	Segundo parámetro
*!*	 "Data Source=" + "ruta de la nueva base de datos compactada" 

*!*	Insertando registros en Access desde VFP
*!*	Este es un ejemplo básico pero bueno de como interactuar con una base de datos de Access desde VFP.
*!*	cStrConn = "DRIVER={Microsoft Access Driver (*.mdb)};" +;
*!*	"Dbq=C:somedata.mdb;" +;
*!*	"Uid=usuario;" +;
*!*	"Pwd=password;"
*!*	lnAccess = SQLSTRINGCONNECT(cStrConn)
*!*	If lnAccess > 0
*!*	 SQLEXEC(lnAccess, "INSERT INTO NombreTabla (campo1, campo2) VALUES(00001, 485745)")
*!*	Else
*!*	 =MessageBox("No fue posible conectarse a la Base de Datos")
*!*	EndIf

*!*	Imprimir el contenido de un RTF
*!*	El RTF es un control ActiveX que permite dar características al texto al estilo de Word. En el ejemplo se muestra como imprimir el contenido de este ActiveX.
*!*	Para imprimir el contenido debes utilizar el método SelPrint del control RTF ...
*!*	With Thisform.Rtf
*!*	 .selstart=1
*!*	 .sellength=len(.textrtf)
*!*	 .selprint 

*!*	Desplegar el Contenido de un Combo
*!*	En ocasiones queremos conocer el contenido de un ComboBoX sin hacer click en él, solamente a lo que él recibe el enfoque. Esta es la forma más fácil de hacerlo. 
*!*	KEYBOARD _{F4}_ 
*!*	En este caso agregamos este código al evento GOTFOCUS( ) y cuando el Combo reciba el enfoque entonces este se desplegara mostrando la información contenidas en él. 

*!*	Desplegar un ComboBox al recibir el Enfoque II
*!*	En realidad muchas veces deseamos hacer esto, pero lo pensamos bastante y no encontramos la forma de hacerlo. Por fin aquí esta su implementación.
*!*	Crea un formulario y agrégale un Combo y un Botón. Al hacer click en el botón debe desplegarse automáticamente el Combo.
*!*	Programa lo siguiente en el evento Gotfocus del Combo
*!*	tColumna = THISFORM.Combo1.Left + THISFORM.Combo1.Width - 4
*!*	tFila = THISFORM.Combo1.Top + 2
*!*	MOUSE CLICK AT tFila, tColumna PIXELS WINDOW (THISFORM.Name) 
*!*	En el evento Click del botón que creaste llama al evento Setfocus() del combo, Así:
*!*	Thisform.combo1.Setfocus()

*!*	Quitar acentos de una cadenas de caracteres 
*!*	Algunas veces los acentos son algo molestos y nos causan inconvenientes, sobre todo al momento de realizar búsquedas dentro tablas
*!*	lCadena = "El amor es el perdón más fácil"
*!*	? CHRTRAN(lCadena, "áéíóúáéíóú", "aeiouAEIOU") 

*!*	Agregar imagen al _Screen
*!*	En ocasiones queremos que en el fondo de nuestras aplicaciones, es decir en el _screen se vea el logo de nuestro programa o de la empresa. Este es un buen truco para personalizar las aplicaciones.
*!*	_screen.addobject("oImg", "image")
*!*	_screen.oImg.picture = "c:imagen.jpg"
*!*	_screen.oImg.visible = .T.
*!*	_screen.oImg.stretch = 1
*!*	_screen.oImg.width = 800
*!*	_screen.oImg.height = 600 

*!*	Quitar botones de la barra del Preview
*!*	Truco indispensable si deseas quitar algunos botones de la barra del preview e impedir así que se imprima desde ahí o se seleccione alguna opción.
*!*	Bueno para realizar este truco te recomiendo cierres todo. Ahora ve al menú VER, luego a ToolBars (Barra de herramientas), luego selecciona la barra Print Preview (VISTA PRELIMINAR) 
*!*	y ahora haz click en Customize (PERSONALIZAR). 
*!*	Ahora la barra te aparecerá deshabilitada detrás de ventana de personalización, ve a la barra y con click sostenido quita todos los botones que quieras y listo la configuración se guardara en Foxuser.dbf 
*!*	Si deseas que el usuario final no pueda acceder 

*!*	Solucionar problemas de Memoria con WinXP
*!*	Evitar el error de Memoria en XP al ejecutar comandos de D.O.S
*!*	Edita el archivo SYSTEM.INI, en la sección 386ENH agrega la siguiente linea:
*!*	PerVMFiles = 80 

*!*	Invocar cuadros de dialogo de Windows
*!*	Existe una forma sencilla de invocar cuadros de dialogo de Windows, tales como: Guardar, Abrir, Fuentes, Color, Impresoras, Ayuda.
*!*	loComDialog = newobject( "mscomdlg.commondialog" )
*!*	locomdialog.ShowFont && Mostrar Fuente
*!*	locomdialog.ShowPrinter() && Mostrar Impresora
*!*	locomdialog.ShowColor() && Mostrar Colores
*!*	locomdialog.ShowSave() && Mostrar Guardar 
*!*	loComDialog.ShowOpen && Mostrar Abrir

*!*	Unidad y serial lógico de las unidades de disco
*!*	De una unidad de disco es posible obtener 2 seriales: el de fabrica y el que le asigna el sistema operativo; en este ejemplo se devuelve el serial del sistema operativo.
*!*	objWMI = Getobject("winmgmts:\\")
*!*	cCadWMI = "Select * from Win32_LogicalDisk"
*!*	oSistema = objWMI.ExecQuery(cCadWMI)

*!*	For Each Disco In oSistema
*!*	 ? "Unidad: " + Disco.Name + " Serial: " + Disco.VolumeSerialNumber
*!*	Next

*!*	Cancelar todos los trabajos en impresión
*!*	Aquí tienes un ejemplo de como cancelar los trabajos que se esten imprimiendo utilizando WMI.
*!*	objWMI = GetObject("winmgmts:\\")
*!*	cCadWMI = "Select * from Win32_Printer Where Name = 'Canon S200'"
*!*	objImp = objWMI.ExecQuery(cCadWMI)

*!*	For Each objPrinter in objImp
*!*	objPrinter.CancelAllJobs()
*!*	Next

*!*	Información del tiempo local
*!*	Utilizando WMI para conocer el día, mes, año, día del mes, número de semana en el mes, minutos, segundos.... etc.
*!*	objWMI = GetObject("winmgmts:\\")
*!*	cCadWMI = "Select * from Win32_LocalTime"
*!*	oTime = objWMI.ExecQuery(cCadWMI)

*!*	For Each oLocal in oTime
*!*	 ? "Día: " + Transform(oLocal.Day)
*!*	 ? "Día de la semana: " + Transform(oLocal.DayOfWeek)
*!*	 ? "Hora: " + Transform(oLocal.Hour)
*!*	 ? "Minutos: " + Transform(oLocal.Minute)
*!*	 ? "Mes: " + Transform(oLocal.Month)
*!*	 ? "Segunds: " + Transform(oLocal.Second)
*!*	 ? "Semana en el mes: " + Transform(oLocal.WeekInMonth)
*!*	 ? "Año: " + Transform(oLocal.Year)
*!*	Next

*!*	Mandar un reporte a una impresora especifica
*!*	* Beginning of program for Example 1 * ******************************************************* 
*!*	* This program assumes a report called Test which has been 
*!*	* saved with the default printer in the Print Setup dialog. 
*!*	* LOCAL lcPrinter 
*!*	lcPrinter = '' 
*!*	lcPrinter = GETPRINTER() 
*!*	IF !EMPTY(lcPrinter) 
*!*	SET PRINTER TO NAME (lcPrinter) 
*!*	REPORT FORM Test TO PRINTER NOCONSOLE 
*!*	ELSE 
*!*	WAIT WINDOW 'Print Job Cancelled' TIME 1 
*!*	ENDIF *

*!*	IMPRIMIR EN UN PUERTO USB
*!*	Printing to USB Printers from FoxPro 2.6
*!*	There are several solutions, depending on your configuration.
*!*	1. If you are using a shared printer on another computer, you shouldn't have a problem. Share it from the other computer, and point to it from the FoxPro 2.6 computer.
*!*	2. To print to a USB printer on the FoxPro 2.6 computer. On Windows XP and 2000, you can share the printer, then use a NET USE command to redirect LPT1 to the shared printer. This is like the Novell capture sequences.
*!*	Install the printer and share it. You may need to set permissions to allow Authenticated Users to use the printer. 
*!*	Add NET USE LPT1: \\CRAIG\USBPRINTER to the logon script for the user's profile. 
*!*	For help on logon scripts, look up "To assign a logon script to a profile" in XP Help. 
*!*	3. To print to a USB printer on the FoxPro 2.6 computer. On Windows XP, you can use printer pooling. 
*!*	Install the USB printer on the computer. 
*!*	Install a local printer on LPT1 (works best, or LPT2). Don't have XP search, but pick the printer by brand. Let it be similar or common printer you recognize. 
*!*	Now select printer properties for the new LPT1 (virtual) printer. On the ports tab, put checks for the LPT1 (for the virtual printer) and the USB for the real printer. Now choose Enable printer pooling. The DOS drivers will print to LPT1. Since XP pools the ports, the output will then be directed to the USB printer. 
*!*	Good luck!
*!*	If this was helpful, send me ( craigr@computer-u.com ) an email. 
*!*	Joost Dekker of the Netherlands says "It works."
*!*	Comprimir con WinZIP
*!*	Puedes utilizar WinZIP para comprimir archivos desde VFP. 
*!*	oZip = CreateObject("WScript.Shell")
*!*	oZip.Run("Winzip -a -r -p -ex c:\archivo.zip c:\Dir_a_Comprimir\*.*", 0,.T.)
*!*	Release oZip
*!*	oZip = Null

*!*	Leer archivo INI
*!*	Una alternativa muy frecuente para almacenar algunos datos de tu aplicación son los archivo INIs ... aquí tienes la forma de leer las entradas de estos archivos. 
*!*	Para el ejemplo crea un archivo INI llamado "archivo.ini" en c: y agrégale los siguientes datos:
*!*	[RUTADB]
*!*	Directorio =C:MiProgramaDB
*!*	Ahora si desde VFP quisiéramos conocer el valor almacenado en la entrada Directorio deberíamos hacerlo así:
*!*	? LeerIni("RutaDB","Directorio","c:archivo.ini")
*!*	Function LeerIni(cSection, cEntry, cINIFile)
*!*	LOCAL cDefault, cRetVal, nRetLen
*!*	cDefault = ""
*!*	cRetVal = Space(255)
*!*	nRetLen = LEN(cRetVal)
*!*	DECLARE integer GetPrivateProfileString IN WIN32API ;
*!*	STRING cSection, String cEntry, ;
*!*	STRING cDefault, STRING @cRetVal, ;
*!*	INTEGER nRetLen, STRING cINIFile
*!*	nRet = GetPrivateProfileString(cSection, cEntry, cDefault, ;
*!*	@cRetVal, nRetLen, cINIFile)
*!*	Return Left(cRetVal, nRetLen)
*!*	EndFunc

*!*	Desplazamiento con "ENTER" en grid
*!*	Por defecto cuando presionamos "Enter" en un grid este se desplaza a la siguiente columna, pero podemos hacer que se desplace al siguiente registro. 
*!*	Lo que debes hacer es ir al evento KeyPress del TextBox vinculado a la columna y escribir el siguiente código
*!*	If nKeyCode = 13
*!*	Nodefault
*!*	Keyboard "{DNARROW}"
*!*	EndIf

*!*	Devolver número con 2 decimales sin aproximarlo
*!*	En muchas ocasiones tenemos un número con más de 2 decimales y queremos que solo nos devuelva 2, pero al hacerlo el número es aproximado, lo cual queremos evitar. 
*!*	nNum1 = 9874.6935
*!*	nNum2 = 1235.05685
*!*	? Round(Floor(nNum1 * 100) / 100, 2)
*!*	? Round(Floor(nNum2 * 100) / 100, 2)

*!*	Abrir un documento de Word e impedir que lo editen
*!*	En este ejemplo se abre un documento de Word a través de automatización y se impide que el usuario pueda realizar cambios sobre él. Gracias a Gorka. 
*!*	Local loWord As Object
*!*	loWord = Createobject("word.application")
*!*	loWord.Documents.Open(Getfile(),,1)
*!*	loWord.ActiveDocument.Protect(1)
*!*	loWord.ActiveDocument.PrintPreview
*!*	loWord.Visible= .T.
*!*	loWord.ActiveDocument.Close(.F.)
*!*	loWord.Quit
*!*	Release loWord

*!*	Mostrar un reporte dentro de un formulario
*!*	Excelente truco con el cual podrás mostrar tu reporte en un formulario. 
*!*	oRep =Createobject("Form")
*!*	With oRep
*!*	 .Caption= "Titulo del Reporte"
*!*	 .WindowState= 2
*!*	 .Show()
*!*	Endwith
*!*	Report Form MiReporte.frx Preview Window (oRep.Name)

*!*	Deshabilitar algunas combinaciones de teclas
*!*	Interesante truco con el cual podrás deshabilitar algunas combinaciones de teclas y hasta funciones de VFP. 
*!*	El asterisco ( * ) permite inhabilitar algunas cositas de VFP.... en este caso, no funcionaran las combinaciones de teclas para copiar (CTRL+C), Pegar (CTRL+V).
*!*	ON KEY LABEL CTRL+V *
*!*	ON KEY LABEL CTRL+C *
*!*	Cuando el usuario presione dichas combinaciones de teclas no harán nada. y de igual forma puedes hacer con todas las teclas.
*!*	Quieres que tu programa nunca mande un error... mejor dicho ¿quieres esconder tus errores? ... Interesante no?
*!*	On Error *
*!*	Y si deseas evitar que el usuario salga del programa ..
*!*	On Shutdown *
*!*	Prueba con otras opciones y comprobaras lo útil que es el asterisco ( * )

*!*	Anclar barra del preview de los reportes
*!*	Si deseas que cuando hacer un report form la barra del preview se ancle puedes utilizar este código. 
*!*	Coloca el siguiente código en el Init del Dataenvironment

*!*	If wexist("Print Preview") && O WEXIST(_Vista Preliminar_) si utilizas VFPXESN.DLL
*!*	 Move Window _Print Preview_ to 10,10 
*!*	 Mouse Dblclick at 11,11 
*!*	Endif 

*!*	Anclar la Barra del Preview de Reportes
*!*	Cuando ejecutamos un reporte y este muestra la barra de Preview, muchas veces deseamos colocarla anclada al resto de barras.
*!*	Primero ejecutamos el reporte con la cláusula tradicional:
*!*	Report Form nombrereporte.frx preview nowait
*!*	If wexist("Print Preview") 
*!*	 move window _Print Preview_ to 10,10 
*!*	 mouse dblclick at 11,11 
*!*	Endif 

*!*	Preview de los reportes a un zoom especifico
*!*	Nuestro clientes piden muchas cosas (por no decir otra cosa); a unos les gusta el preview al 100% a otros les gusta verlo al 50% ..... aquí esta la forma de hacerlo.
*!*	Agrega el siguiente código en el método BeforeOPenTable del dataenvironment (entorno de datos) del reporte

*!*	ZOOM WINDOW "Report Designer" MAX
*!*	KEYBOARD "{F3}" &&75%
*!*	*KEYBOARD "{F3}{F3}" &&50%
*!*	*KEYBOARD "{F3}{F3}{F3}" &&25%
*!*	*KEYBOARD "{F3}{F3}{F3}{F3}" &&10% 
*!*	Lo que debes hacer es enviarle pulsaciones de la tabla F3 con la función Keyboard; cada F3 que envíes hará que el zoom del preview sea más pequeño 

*!*	Comprimir y descomprimir con WinXP
*!*	Puede incorporar dentro de sus aplicaciones rutinas para comprimir y descomprimir archivos a través de WinXP o WinME. 
*!*	************************************
*!*	* COMPRIMIR
*!*	************************************
*!*	cNuevoZip = "C:MiArchivo.Zip"
*!*	cOrigen = "c:Directorio"
*!*	Strtofile(Chr(0x50)+Chr(0x4B)+Chr(0x05)+Chr(0x06)+Replicate(Chr(0),18),cNuevoZip) 
*!*	oShell = Createobject("Shell.Application")
*!*	For Each oArchi In oShell.NameSpace(cOrigen).Items
*!*	 oShell.NameSpace(cNuevoZip).CopyHere(oArchi)
*!*	Endfor

*!*	************************************
*!*	* DESCOMPRIMIR
*!*	************************************
*!*	cMiZip = "C:MiArchivo.Zip"
*!*	cDirDesti = "c:Directorio"
*!*	oShell = Createobject("Shell.Application")
*!*	For Each oArchi In oShell.NameSpace(cMiZip).Items
*!*	 oShell.NameSpace(cDirDesti).CopyHere(oArchi)
*!*	EndFor

*!*	Devolver número con 2 decimales sin aproximarlo
*!*	En muchas ocasiones tenemos un número con más de 2 decimales y queremos que solo nos devuelva 2, pero al hacerlo el número es aproximado, lo cual queremos evitar. 
*!*	nNum1 = 9874.6935
*!*	nNum2 = 1235.05685
*!*	? Round(Floor(nNum1 * 100) / 100, 2)
*!*	? Round(Floor(nNum2 * 100) / 100, 2)

*!*	Cerrar el Botón inicio de Windows
*!*	En ocasiones no queremos que el usuario tenga acceso al botón inicio de Windows; lo que hacemos entonces es cerrarlo. 
*!*	Declare Long FindWindow In "user32" ;
*!*	 String lpClassName, String lpWindowName

*!*	Declare Long SendMessage In "user32" ;
*!*	 Long HWnd,Long wMsg, Long wParam, Long Lparam

*!*	Declare Long FindWindowEx In "user32" ;
*!*	 Long hWnd1, Long hWnd2, String lpsz1, String lpsz2

*!*	#Define WM_CLOSE 0x10
*!*	SendMessage(FindWindowEx(FindWindow("Shell_TrayWnd",""), 0x0, "Button", .Null.), WM_CLOSE, 0, 0)

*!*	Calcular el número del día en el año
*!*	Función que te devuelve cuantos días han pasando en el año hasta una fecha determinada. 
*!*	?DiaDelAño(Date())
*!*	?DiaDelAño(Date()-10)
*!*	?DiaDelAño(Date()-60)
*!*	Function DiaDelAño(dDate)
*!*	 nDia = dDate - Date(Year(Date()), 1, 1) + 1
*!*	 Return(nDia)
*!*	Endfunc

*!*	Determinar si un año es bisiesto
*!*	No hace falta explicar.... je, je, je... 
*!*	Existen diversas formas de terminarlo ... la primera:
*!*	nAño = 2004
*!*	? !Empty(Date(nAño, 02, 29))
*!*	nAño = 2005
*!*	? !Empty(Date(nAño, 02, 29))

*!*	Otra forma utilizando MOD
*!*	?Mod(2004, 4)
*!*	?Mod(2005, 4)

*!*	Grid y DynamicBackColor
*!*	Un excelente ejemplo de como podemos utilizar DynamicBackColor para establecer un color a la celda dependiendo de una condición. 
*!*	Localo
*!*	o = Createobject("myform")
*!*	o.Show(1)

*!*	Define Class myform As Form
*!*	 DoCreate = .T.
*!*	 DataSession = 2
*!*	 AutoCenter = .T.
*!*	 Caption = "Trabajando con DyamicBackGround"
*!*	 Width = 600
*!*	 Height = 400
*!*	 MinHeight = 300
*!*	 MinWidth = 300
*!*	 Add Object grid1 As Grid With ;
*!*	 HEIGHT = This.Height, ;
*!*	 WIDTH = This.Width, ;
*!*	 DELETEMARK = .F. 

*!*	 Procedure Load
*!*	 Select * From (_samples+"datacustomer") ;
*!*	 Order By MaxOrdAmt Desc;
*!*	 Into Cursor TmpCust
*!*	 Use In "customer"
*!*	 EndProc

*!*	 Procedure Init
*!*	 This.grid1.SetAll("dynamicbackcolor",;
*!*	 "Thisform.GetBackColor(allt(country))")
*!*	 EndProc 

*!*	 Procedure Resize
*!*	 This.grid1.Width= This.Width
*!*	 This.grid1.Height= This.Height
*!*	 EndProc 

*!*	 Function GetBackColor(cCountry)
*!*	 Local nColor
*!*	 Do Case
*!*	 Case cCountry == "Germany"
*!*	 nColor = Rgb(255,255,255)
*!*	 Case cCountry == "UK"
*!*	 nColor = Rgb(224,224,0)
*!*	 Case cCountry == "Sweden"
*!*	 nColor = Rgb(224,224,160)
*!*	 Case cCountry == "France"
*!*	 nColor = Rgb(100,224,160)
*!*	 Case cCountry == "Spain"
*!*	 nColor = Rgb(100,224,160)
*!*	 Otherwise
*!*	 nColor = Rgb(224,100,224)
*!*	 EndCase 
*!*	 Return nColor
*!*	 EndFunc 
*!*	EndDefine 


*!*	Ejecutar comandos de MS-DOS sin que se muestre la ventana
*!*	Excelente ... Podrás ejecutar tus comando de MS-DOS sin que se muestre la ventana negra del DOS. 
*!*	En la variable cComando puedes colocar cualquier instrucción válida de MS-DOS que luego será ejecutada; Si deseas que la ventana sea visible solo cambia el último parámetro de a función ShellExecute y colócalo en 1
*!*	Declare Integer ShellExecute In shell32.Dll;
*!*	 Integer hndWin, String cAction, String cFile,;
*!*	 String cParams, String cDir, Integer nShow

*!*	cComando = "Dir c:*.*"
*!*	cArchivo = GetEnv("TEMP") + "" + Sys(2015) + ".bat"

*!*	=StrToFile(cComando, cArchivo)
*!*	=ShellExecute(0,"Open",cArchivo,"","",0)


*!*	Determinar el número de líneas de un EditBox
*!*	MUY BUENO ... Con este truco podrás determinar le número de líneas que ocupa una determinada cadena de texto en un EditBox. 
*!*	nActSetMemo = Set("MemoWidth")

*!*	With Thisform.Edit1 
*!*	 Set Memowidth To Floor(.Width/(Fontmetric(6,.FontName,.FontSize)+1))
*!*	 nLines = Memlines(.Value)
*!*	EndWith

*!*	? "Número de líneas... " + Transform(nLines)
*!*	Set Memowidth To nActSetMemo

*!*	Convertir segundos a días - horas - minutos - segundos
*!*	Código bastante útil .... podemos convertir un número determinado de segundos en días, horas, minutos... 
*!*	nSeg = 276786
*!*	? Padl(Int( nSeg / 86400),3) + " Días "; 
*!*	 + Padl(Int((nSeg % 86400)/3600),2,"0") + " Hrs "; 
*!*	 + Padl(Int((nSeg % 3600)/60), 2, "0") + " Min "; 
*!*	 + Padl(Int(nSeg % 60),2,"0") + " Seg"

*!*	Wait window centrado en la pantalla
*!*	Truquito sencillo pero bueno.
*!*	lcMess = "Mesaje centrado en la pantalla" 
*!*	Wait lcMess Window At Srows()/2,(Scols()/2 - (Len(lcMess)/2))Nowait

*!*	Dejar fija primera columna de un grid
*!*	Este es un truco bastante solicitado .... Con VFP 8 o superior ya es posible hacerlo más fácilmente. Aquí tienes 2 formas de hacerlo.
*!*	En el AfteRowColchange del Grid digita lo siguiente:
*!*	Lparameters nColIndex
*!*	Thisform. LockScreen = .T. 
*!*	This.Columns(1).ColumnOrder =This. LeftColumn 
*!*	Thisform.LockScreen = .T.
*!*	** Y en el Scrolled del Grid esto :
*!*	Lparameters nDirection
*!*	Thisform. LockScreen= .T. 
*!*	If nDirection > 3 
*!*	This .Columns(1). ColumnOrder = This.LeftColumn 
*!*	Endif 
*!*	Thisform.LockScreen= .F.
*!*	OTRA FORMA
*!*	** En el AfteRowColchange del Grid digita lo siguiente:
*!*	nPos =This. ActiveColumn-This.RelativeColumn
*!*	If nPos>0 
*!*	This.COlumn1.ColumnOrder=nPos+1 
*!*	Else 
*!*	This.COlumn1.ColumnOrder=1 
*!*	Endif

*!*	Diferencia entre dos DateTime - Horas - Minutos - Segundos
*!*	Este truco es bastante útil ... Calcular el número de horas, minutos y segundos entre dos valor DateTime.
*!*	?HMSDif(Datetime(), Dtot(Date()-10))
*!*	Function HMSDif (tDateTime1, tDateTime2)
*!*	 Local cRet, nS 
*!*	 cRet = "" 

*!*	 If! Vartype(tDateTime1)= "T" Or !Vartype(tDateTime2)= "T" 
*!*	 cRet = "E" 
*!*	 Endif 

*!*	 If Empty(cRet) 
*!*	 If tDateTime2 > tDateTime1 
*!*	 nS = tDateTime2 - tDateTime1 
*!*	 Else 
*!*	 nS = tDateTime1 - tDateTime2 
*!*	 Endif 

*!*	 nS = Int(nS) 
*!*	 cTime = Transform(Int(nS/3600),"9999")+":"+ ; 
*!*	 Transform(Mod(Int(nS/60),60),"99")+":"+ ; 
*!*	 Transform(Mod(nS,60)," 99") 
*!*	 Return cTime 
*!*	 Else 
*!*	 =Messagebox("Los valores deben ser DateTime") 
*!*	 Return "" 
*!*	 Endif 
*!*	Endfunc

*!*	Sistema operativo que utilizas
*!*	Existen diversas formas de conocer que sistema operativo utilizas; está es una forma sencilla pero bastante buena.
*!*	cOsx = Os(1)
*!*	cSistema = ""
*!*	Do Case 
*!*	 Case "6.00" $ cOsx 
*!*	 cSistema = "LongHorn" 
*!*	 Case "5.02" $ cOsx 
*!*	 cSistema = "2003" 
*!*	 Case "5.01" $ cOsx 
*!*	 cSistema = "XP" 
*!*	 Case "5.0" $ cOsx 
*!*	 cSistema = "2000" 
*!*	 Case "NT" $ cOsx 
*!*	 cSistema = "NT" 
*!*	 Case "4.1" $ cOsx 
*!*	 cSistema = "98" 
*!*	 Case"4.9" $ cOsx 
*!*	 cSistema = "ME" 
*!*	 Case "4.0" $ cOsx Or "3.9" $ cOsx 
*!*	 cSistema = "95" 
*!*	 Case "3." $ cOsx 
*!*	 cSistema = "3.1" 
*!*	Endcase
*!*	? "Windows " + cSistema

*!*	Obtener la parte fraccionaria de un numero
*!*	Un truco EXCELENTEEEE .... de como determinar la parte decimal o fraccionaria de un número.
*!*	? ABS(78.53) % 1
*!*	? ABS(329.12) % 1

*!*	Seleccionar el texto de un control
*!*	Una forma sencilla de seleccionar el texto de un control ... 
*!*	En el evento GotFocus() del control colocas lo siguiente:
*!*	Keyboard '{END}'
*!*	Keyboard '{SHIFT+HOME}'

*!*	Apagar rápidamente con WinXP
*!*	Puedes hacer que tu PC se apague con doble clic, para ello deberás crear un icono que te permita hacer esta función, para realizar este truco sigue estos pasos:

*!*	Haz clic con el ratón derecho en una zona libre del Escritorio y luego selecciona Nuevo y Acceso directo.
*!*	En la ventana del acceso directo debes escribir shutdown -s -t 00 y pulsa el botón Siguiente, después le pones el nombre que quieras al acceso directo y pinchas el botón Finalizar.

*!*	Si quieres dejar algo de tiempo para cerrar las aplicaciones debes poner esto shutdown.exe -s -t 12 de esta forma dejarás un margen prudencial de 12 segundos para apagar el PC.

*!*	Calcular tiempo que tarda realizar una Operación
*!*	Un simple pero muy interesante ejemplo de como y donde implementar estas útiles funciones. 
*!*	lnInicio = SECONDS() 

*!*	 for i = 1 to 10000 && en este ejemplo cuanto tarda realizar
*!*	 && el ciclo for de 1 hasta 10000
*!*	 endfor

*!*	? SECONDS() - lnInicio 

*!*	Texto parpadeante
*!*	Para realizar el efecto debemos crear un formulario, una etiqueta y un control timer; la propiedad Interval de este se la establecemos a 700 (milisegundos). 
*!*	Cambiamos la propiedad caption de la etiqueta a al texto que deseamos, luego ejecutamos.

*!*	En el evento Timer del Control Timer escribimos: 
*!*	THISFORM.Label1.Visible =! THISFORM.Label1.Visible 

*!*	Impedir que cambien la configuración del Preview de Reportes
*!*	Si no quieres que te modifiquen la configuración del Preview de reportes desde abrir la tabla de recursos de VFP (Foxuser.dbf) y cambiar a verdadero (.t.) el campo solo lectura (ReadOnly) de la barra.
*!*	Use SYS(2005) Again
*!*	Locate For Id=_TTOOLBAR_ and name=_Print Preview_
*!*	 Replace readonly with .T.
*!*	Use 

*!*	Determinar la Impresora predeterminada
*!*	En VFP la impresión causa algunos malestares y debemos conocer cual es la impresora predeterminada tanto en Windows como en VFP.
*!*	? SET("PRINTER", 2) && Impresora predeterminada de Windows

*!*	? SET("PRINTER", 3) && Impresora predeterminada de VFP 

*!*	Imprimir paginas determinadas de un Reporte
*!*	Cuando tenemos un reporte y queremos imprimir una pagina determinada o desde una pagina a otra podemos utilizar el argumento RANGE. Después de él indicamos la pagina de inicio y final del reporte a imprimir. 
*!*	Supongamos que tenemos un reporte de 20 paginas, yo puedo mandar a imprimir de la pagina 10 a la 15 de la siguiente manera
*!*	REPORT FORM nombreinforme RANGE 10,15 

*!*	Crystal Report y VFP
*!*	Uno de los grandes problemas de VFP son los reportes; pero podemos realizar los reportes en Cristal Report 
*!*	y luego llamarlos desde VFP. No quiero decir con esto que sea mejor, más fácil o más cómodo; simplemente es otra forma de hacerlo y tiene muchas ventajas.
*!*	En los ejemplos que demuestro estoy utilizando la versión 8 del Cristal Report de Seagate pero considero que se debe comportar igual con las demás versiones.
*!*	Primero veamos como puedo exportar un reporte a extensión .DOC (Word)
*!*	oCristalReport = createobject("crystal.crpe.application")
*!*	oRepx = oCristalReport.OpenReport("C: eporteventas.RPT")
*!*	oRepx.ExportOptions.FormatType = 14 && Formato de Word
*!*	oRepx.ExportOptions.DiskFileName = "c: eporteventasdelmes.doc"
*!*	oRepx.ExportOptions.DestinationType = 1 && Tipo de Destino a guardar
*!*	oRepx.Export(.F.) && No muestra ningun cuadro de Dialogo 
*!*	release oRepx
*!*	release oCristalReport 
*!*	Los otros formatos en que podemos guardar los reportes son:
*!*	Extensión FormatType
*!*	 RTF 4
*!*	EXCEL 7 27 o 28
*!*	EXCEL 8 29 o 30 

*!*	Para ver en vista previa un reporte: 
*!*	oCristalreport = createobject("crystal.crpe.application")
*!*	oRep = oCristalreport.OpenReport("C: eporteventas.RPT")
*!*	oRep.Preview 

*!*	Para mandarlo a imprimir 
*!*	oCristalreport = createobject("crystal.crpe.application")
*!*	oRep = oCristalreport.OpenReport("C: eporteventas.RPT")
*!*	oRep.Printout(.F.) && .F. no muestra cuadro para configurar impresora 

*!*	Crystal Report y VFP
*!*	Uno de los grandes problemas de VFP son los reportes; pero podemos realizar los reportes en Cristal Report y luego llamarlos desde VFP. 
*!*	No quiero decir con esto que sea mejor, más fácil o más cómodo; simplemente es otra forma de hacerlo y tiene muchas ventajas.
*!*	En los ejemplos que demuestro estoy utilizando la versión 8 del Cristal Report de Seagate pero considero que se debe comportar igual con las demás versiones.
*!*	Primero veamos como puedo exportar un reporte a extensión .DOC (Word)
*!*	oCristalReport = createobject("crystal.crpe.application")
*!*	oRepx = oCristalReport.OpenReport("C: eporteventas.RPT")
*!*	oRepx.ExportOptions.FormatType = 14 && Formato de Word
*!*	oRepx.ExportOptions.DiskFileName = "c: eporteventasdelmes.doc"
*!*	oRepx.ExportOptions.DestinationType = 1 && Tipo de Destino a guardar
*!*	oRepx.Export(.F.) && No muestra ningun cuadro de Dialogo 
*!*	release oRepx
*!*	release oCristalReport 
*!*	Los otros formatos en que podemos guardar los reportes son:
*!*	Extensión FormatType
*!*	 RTF 4
*!*	EXCEL 7 27 o 28
*!*	EXCEL 8 29 o 30 

*!*	Para ver en vista previa un reporte: 
*!*	oCristalreport = createobject("crystal.crpe.application")
*!*	oRep = oCristalreport.OpenReport("C: eporteventas.RPT")
*!*	oRep.Preview 

*!*	Para mandarlo a imprimir 
*!*	oCristalreport = createobject("crystal.crpe.application")
*!*	oRep = oCristalreport.OpenReport("C: eporteventas.RPT")
*!*	oRep.Printout(.F.) && .F. no muestra cuadro para configurar impresora 

*!*	Wait Window centrado en la pantalla
*!*	Por defecto el mensaje mostrado por Wait Window se muestra en la parte superior derecha de la pantalla, con este truco se muestra centrado en la pantalla.
*!*	cMensage = "Este es un ejemplo del mensaje"
*!*	_Screen.Scalemode = 0
*!*	Wait Window cMensage At Int(_Screen.Height/2), Int(_Screen.Width/2 - Len(cMensage) / 2) 

*!*	Cambiar propiedades de los reportes desde código
*!*	Podemos manipular las propiedades de un formulario desde código.
*!*	Como sabemos un reporte no es más que una tabla donde se almacenan los objetos y las propiedades de estos que luego son invocados por el Dataenvironment.
*!*	Bueno para cambiar las propiedades de los reportes desde código debemos abrir el reporte como una tabla:
*!*	USE nombrereporte.frx 
*!*	REPLACE fontface with "Verdana", fontsize WITH 10, fontstyle WITH 1 FOR objtype = 1

*!*	Con esto ponemos como predeterminado la fuente Verdana a 10 puntos y negrilla, si en fontstyle ponemos 0 tendremos letra normal. 

*!*	Quitar botones de la barra del Preview
*!*	Truco indispensable si deseas quitar algunos botones de la barra del preview e impedir así que se imprima desde ahí o se seleccione alguna opción.
*!*	Bueno para realizar este truco te recomiendo cierres todo. Ahora ve al menú VER, luego a ToolBars (Barra de herramientas), luego selecciona la barra Print Preview (VISTA PRELIMINAR) y ahora haz click en Customize (PERSONALIZAR). Ahora la barra te aparecerá deshabilitada detrás de ventana de personalización, ve a la barra y con click sostenido quita todos los botones que quieras y listo la configuración se guardara en Foxuser.dbf 
*!*	Si deseas que el usuario final no pueda acceder a los botones debes distribuir el archivo Foxuser.dbf con tu proyecto. 

*!*	Solucionar problemas de Memoria con WinXP
*!*	Evitar el error de Memoria en XP al ejecutar comandos de D.O.S
*!*	Edita el archivo SYSTEM.INI, en la sección 386ENH agrega la siguiente linea:

*!*	PerVMFiles = 80 

*!*	Impedir que cambien el tamaño de las Columnas de un Grid
*!*	Si quiere que nadie cambie el tamaño de las columnas de un grid, puede utilizar esta forma.
*!*	THISFORM.Grid1.SetAll("Resizable", .F., "Column")

*!*	Determinar el Serial del Disco con WSH
*!*	Otro de los temas de bastante consulta es como obtener el Serial de un Disco, esta forma es súper sencilla y con poco código.
*!*	oFS=CreateObject("scripting.filesystemobject")
*!*	? oFS.Drives("c").SerialNumber 

*!*	Invocar cuadros de dialogo de Windows
*!*	Existe una forma sencilla de invocar cuadros de dialogo de Windows, tales como: Guardar, Abrir, Fuentes, Color, Impresoras, Ayuda.
*!*	loComDialog = newobject( "mscomdlg.commondialog" )

*!*	locomdialog.ShowFont && Mostrar Fuente

*!*	locomdialog.ShowPrinter() && Mostrar Impresora

*!*	locomdialog.ShowColor() && Mostrar Colores

*!*	locomdialog.ShowSave() && Mostrar Guardar 
*!*	loComDialog.ShowOpen && Mostrar Abrir

*!*	Suprimir cuadro de diálogo "Imprimiendo" con el API
*!*	Cuando mandamos reportes a la Impresora algunas veces queremos personalizar esta operación; pero siempre nos muestras la ventanita "Imprimiendo". Esta es la forma de omitir esa ventana
*!*	DECLARE INTEGER GetDesktopWindow IN WIN32API
*!*	DECLARE INTEGER LockWindowUpdate IN WIN32API INTEGER lnHandle

*!*	hWin = GetDeskTopWindow()

*!*	LockWindowUpdate(hWin) && Bloquea actualización de la pantalla
*!*	 REPORT FORM NombreReporte.frx TO PRINTER
*!*	LockWindowUpdate(0) && No actualiza la pantalla 

*!*	Unidad y serial lógico de las unidades de disco
*!*	De una unidad de disco es posible obtener 2 seriales: el de fabrica y el que le asigna el sistema operativo; en este ejemplo se devuelve el serial del sistema operativo.
*!*	objWMI = Getobject("winmgmts:\\")
*!*	cCadWMI = "Select * from Win32_LogicalDisk"
*!*	oSistema = objWMI.ExecQuery(cCadWMI)

*!*	For Each Disco In oSistema
*!*	 ? "Unidad: " + Disco.Name + " Serial: " + Disco.VolumeSerialNumber
*!*	Next

*!*	Numero de serie del disco duro
*!*	Una de las formas más sencillas de obtener el serial de fabrica de las unidades de disco. 
*!*	objWMI = Getobject("winmgmts:\\")
*!*	cCadWMI = "Select * from Win32_PhysicalMedia"
*!*	oSistema = objWMI.ExecQuery(cCadWMI)

*!*	For Each Disco In oSistema
*!*	 ? "Serial de fabrica :" + Disco.SerialNumber
*!*	Next

*!*	Fecha de instalación del sistema operativo
*!*	Utilizando WMI desde VFP para conocer la fecha de instalación del sistema operativo.
*!*	objWMI = Getobject("winmgmts:\\")
*!*	cCadWMI = "Select * from Win32_OperatingSystem"
*!*	objOper = objWMI.ExecQuery(cCadWMI)

*!*	For Each oSys In objOper
*!*	 ? oSys.InstallDate
*!*	Next

*!*	Establecer una impresora por defecto
*!*	Otra forma de establecer la impresora por defecto de Windows... esta vez utilizando WMI.
*!*	objWMI = GetObject("winmgmts:\\")
*!*	cCadWMI = "Select * from Win32_Printer Where Name = 'Canon S200'"
*!*	objImp = objWMI.ExecQuery(cCadWMI)

*!*	For Each objPrinter in objImp
*!*	 objPrinter.SetDefaultPrinter()
*!*	Next

*!*	Cancelar todos los trabajos en impresión
*!*	Aquí tienes un ejemplo de como cancelar los trabajos que se esten imprimiendo utilizando WMI.
*!*	objWMI = GetObject("winmgmts:\\")
*!*	cCadWMI = "Select * from Win32_Printer Where Name = 'Canon S200'"
*!*	objImp = objWMI.ExecQuery(cCadWMI)

*!*	For Each objPrinter in objImp
*!*	objPrinter.CancelAllJobs()
*!*	Next

*!*	Velocidad y tipo de procesador
*!*	Utilizar WMI desde VFP para obtener la velocidad y tipo de procesador del PC.
*!*	objWMI = GETOBJECT("winmgmts:\\")
*!*	colItems = objWMI.ExecQuery("Select * from Win32_Processor",,48)
*!*	For Each objItem In colItems
*!*	 ? objItem.Name 
*!*	 ?objItem.CurrentClockSpeed
*!*	NEXT

*!*	P./ ¿Hay alguna forma de imprimir las páginas 10 y 11 de un Report especificando sólo 10-11?
*!*	R./ Usa la clausula PROMPT de la orden REPORT FORM para mostrar el diálogo de impresión. Aquí se puede señalar el rango de páginas para ser impresos
*!*	P./ De qué forma puedo usar la tecla ESC para salir de un Formulario?
*!*	R./ La mejor forma es poner la propieda Cancel del botón de comandos a .T.. Esto sería la forma más correcta de trabajar en perfecta consonancia con el diseño de Interfaces de windows. 
*!*	En el evento Click() de el botón de comandos escribe:
*!*	Thisform.Release()
*!*	También se podría usar el evento KeyPress del formulario con:
*!*	PROCEDURE KeyPress 
*!*	LPARAMETERS nKeyCode, nShiftAltCtrl
*!*	IF nKeyCode = 27 
*!*	RELEASE THISFORM 
*!*	ENDIF 
*!*	ENDPROC

*!*	Grid multiselección
*!*	Una de las preguntas habilítales es como podemos hacer para poder seleccionar múltiples registros en un grid. 
*!*	En este caso utilizamos un checkbox para hacer la selección de los registros....
*!*	Public oForm
*!*	oForm = Createobject("FrmGrid")
*!*	oForm.AddObject("Grid1","Grid")
*!*	With oForm.Grid1
*!*	 .ColumnCount = 3
*!*	 .Height = 288
*!*	 .Width = 320
*!*	 .Left = 24
*!*	 .Top = 24
*!*	 .Column1.Width= 17
*!*	 .Column1.Header1.Caption= ""
*!*	 .Column1.AddObject("Check1","CheckBox")
*!*	 .Column1.Check1.Visible = .T.
*!*	 .Column1.CurrentControl= "Check1"
*!*	 .Column1.Sparse= .F.
*!*	 .Column2.Width= 50
*!*	 .Column2.Header1.Caption= "Código"
*!*	 .Column3.Width= 194
*!*	 .Column3.Header1.Caption= "Nombre"
*!*	 .SetAll("DynamicBackColor","IIF(Ok, RGB(0,220,210), RGB(255,255,255))", "COLUMN")
*!*	 .Visible = .T.
*!*	Endwith
*!*	oForm.Visible = .T.
*!*	Define Class FrmGrid As Form
*!*	 Top = 0
*!*	 Left = 0
*!*	 Height = 334
*!*	 Width = 376
*!*	 DoCreate = .T.
*!*	 Caption = "Grid multiselección"
*!*	 WindowType = 1
*!*	 WindowState = 0
*!*	 Name = "FrmGrid"
*!*	 Procedure Load
*!*	 Use Home() + "SamplesDataemployee.dbf"
*!*	 Select .F. As OK, Emp_ID, Trim(Last_Name)+" " + Trim(First_Name) ;
*!*	 From Employee Into Cursor Empleados Readwrite
*!*	 EndProc 
*!*	 Procedure Unload
*!*	 Use In Employee
*!*	 EndProc 
*!*	EndDefine 

*!*	Si bien con la tecla [Esc] sales del browse, debes de tener cuidado, debido a que dicha tecla cancela la opcion que puedas estar ejecutando. 
*!*	te recomiendo por cuestion didactica que utilices mejor los siguiente ritina: 

*!*	On Key Label Enter Keyboard "Ctrl+W" 
*!*	* Rutinas de tu browse 
*!*	Browse 
*!*	On Key Label Enter 
*!*	Nota: 
*!*	es importante que luego de la rutina de tu browse retornes la tecla enter a su estado natural

*!*	Para poder salir del browse usando la tecla ENTER, puedes utilizar el siguiente código: 

*!*	************************* 
*!*	* ---- Primero desconectamos la tecla escape. 
*!*	SET ESCAPE OFF 

*!*	USE 
*!*	* ---- Ahora cada vez que presiones ENTER, será como presionar escape. 
*!*	ON KEY LABEL ENTER KEYBOARD "{ESC}" 
*!*	BROWSE 

*!*	* ----- Desconectamos la tecla ENTER, para que funcione como tal. 
*!*	ON KEY LABEL ENTER 
*!*	**************************** 

*!*	Es muy importante que "desconectes", el ENTER, pues de lo contrario cada vez que presiones enter, FOX "entiende" que has presionado ESCAPE.

*!*	Mostrar barra de Progreso en un Select SQL
*!*	A muchos les gustaría mostrar una barra de progreso en sus consultas Select SQL; no es muy bueno hacerlo puesto que al estar activo el Set Talk las consultas tardaría mucho más; pero si aún así quieres utilizarla.... 
*!*	Para poder ver la barra la tabla debe tener bastantes registros....
*!*	Define Window WinSQL From 12,30 To 16,70;
*!*	 SHADOW Color Scheme5 Double Name loWind
*!*	Active Window WinSQL Noshow
*!*	Set Talk Window WinSQL
*!*	Set Talk On
*!*	Set Notify On
*!*	Select * From Tabla
*!*	Release Window WinSQL

*!*	Llenar formularios en paginas desde VFP
*!*	A través de automatización puedes los formularios de captura de datos de las paginas webs ... 
*!*	En este ejemplo se muestra como logearse en mi sitio web a través de VFP; la sesión como usuario debe estar cerrada para poder probar el ejemplo.
*!*	oIE = Createobject("InternetExplorer.Application")
*!*	oIE.Navigate("http://www.davphantom.net")
*!*	Do While(oIE.Busy)
*!*	 DoEvents
*!*	EndDo
*!*	oIE.Visible = .T.
*!*	oDoc = oIE.Document
*!*	oForm = oDoc.forms[0]
*!*	oForm.item[0].value = "USUARIO"
*!*	oForm.item[1].value= "CLAVE"
*!*	oForm.submit()

*!*	Quitar el menú de VFP
*!*	Si quieres quitar el menú de VFP puedes hacerlo de la siguiente forma ... 
*!*	SET SYSMENU TO

*!*	Cerrar el Botón inicio de Windows
*!*	En ocasiones no queremos que el usuario tenga acceso al botón inicio de Windows; lo que hacemos entonces es cerrarlo. 
*!*	Declare Long FindWindow In "user32" ;
*!*	 String lpClassName, String lpWindowName

*!*	Declare Long SendMessage In "user32" ;
*!*	 Long HWnd,Long wMsg, Long wParam, Long Lparam

*!*	Declare Long FindWindowEx In "user32" ;
*!*	 Long hWnd1, Long hWnd2, String lpsz1, String lpsz2

*!*	#Define WM_CLOSE 0x10
*!*	SendMessage(FindWindowEx(FindWindow("Shell_TrayWnd",""), 0x0, "Button", .Null.), WM_CLOSE, 0, 0)

*!*	Abrir un documento de Word e impedir que lo editen
*!*	En este ejemplo se abre un documento de Word a través de automatización y se impide que el usuario pueda realizar cambios sobre él. Gracias a Gorka. 
*!*	Local loWord As Object
*!*	loWord = Createobject("word.application")
*!*	loWord.Documents.Open(Getfile(),,1)
*!*	loWord.ActiveDocument.Protect(1)
*!*	loWord.ActiveDocument.PrintPreview
*!*	loWord.Visible= .T.
*!*	loWord.ActiveDocument.Close(.F.)
*!*	loWord.Quit
*!*	Release loWord

*!*	Generar grafica en Excel a través de automatización
*!*	Muy bueno y sencillo ejemplo de como generar gráficos de áreas en Excel a través de automatización. 
*!*	oExcel = Createobject("Excel.Application")
*!*	oExcel.Workbooks.Add
*!*	For i=1 To 3
*!*	 For x=1 To 13
*!*	 oExcel.Cells(i,x).Value = Ceil(Rand()*1000)
*!*	 Next
*!*	Next

*!*	oExcel.Range("A1:M1;A2:M2;A3:M3").Select
*!*	oGraph = oExcel.Charts.Add()

*!*	With oGraph
*!*	 .Type = -4101
*!*	 .Legend.Clear
*!*	 .Perspective=100
*!*	 .Elevation=0
*!*	EndWith

*!*	oExcel.Visible = .T.

*!*	Buscar registros duplicados en una tabla
*!*	Truco básico pero bastante útil. 
*!*	En este caso determinados los registros duplicados por un campo especifico
*!*	Select Campo From Tabla Group By Campo Having Count(Campo)> 1

*!*	En este caso determinados los registros duplicados por todo el registro
*!*	Select Campo1 + Campo2 + Campo3 + Campo4 As X From Tabla;
*!*	 Group By X;
*!*	 Having Count(Campo1+Campo2+Campo3+Campo4) > 1

*!*	Mostrar un reporte dentro de un formulario
*!*	Excelente truco con el cual podrás mostrar tu reporte en un formulario. 
*!*	oRep =Createobject("Form")
*!*	With oRep
*!*	 .Caption= "Titulo del Reporte"
*!*	 .WindowState= 2
*!*	 .Show()
*!*	Endwith
*!*	Report Form MiReporte.frx Preview Window (oRep.Name)

*!*	PCs conectados a la Red
*!*	Últimamente se a convertido en una pregunta frecuente ... Puedes conocer los nombres de los equipos e impresoras compartidas. 
*!*	Esto te devolverá los nombres de todos los equipos que se encuentran en la RED con el nombre que le pases..


*!*	ANetResources(APcs, "NOMBRE-RED",1)

*!*	For i = 1 to Alen(APcs)
*!*	 ? APcs(i)
*!*	Next


*!*	Justificar textos en reportes
*!*	Truquito muy bueno que permite poder justificar textos en los reportes utilizando el control RTF. 
*!*	Para probar el ejemplo crea un reporte llamado rtfdemo.frx y agrégale un control RTF, le colocas como control source ctext.gText y le marcas la opción que dice
*!*	 "Campo general de una tabla"
*!*	Local cStr
*!*	cStr="Note that there is a limit of 32 characters "+;
*!*	 "total for the sum of text before and text "+;
*!*	 "after for simple numbering. Multilevel numbering "+;
*!*	 "has a limit of 64 characters total for the sum "+;
*!*	 "of all levels.NOTE: The file must have a"+;
*!*	 ".RTF extension to work properly."+;
*!*	 "Note that there is a limit of 32 characters "+;
*!*	 "total for the sum of text before and text "+;
*!*	 "after for simple numbering. Multilevel numbering "+;
*!*	 "has a limit of 64 characters total for the sum "+;
*!*	 "of all levels.NOTE: The file must have a"+;
*!*	 ".RTF extension to work properly."

*!*	Create Cursor ctext (lctext m,gText g)
*!*	Insert Into ctext (lctext) Values (cStr)

*!*	_rtfFile = "c:"+Sys(3)+".rtf"

*!*	Scan
*!*	 Set Textmerge To &_rtfFile Noshow
*!*	 Set Textmerge On
*!*	 \{ tf1ansiqj <>}
*!*	 Set Textmerge To
*!*	 Append General gText From &_rtfFile Class "RICHTEXT.RICHTEXTCTRL.1"
*!*	EndScan

*!*	Report Form rtfdemo.frx Preview Noconsole


*!*	Rellenar con ceros a la izquierda
*!*	Otra forma de rellenar con ceros a la izquierda una cadena. En el ejemplo quiero rellenar con ceros el número 80...
*!*	? TRANSFORM(80,"@L 99999999")
*!*	El resultado sería 00000080

*!*	Determinar el número de líneas de un EditBox
*!*	MUY BUENO ... Con este truco podrás determinar le número de líneas que ocupa una determinada cadena de texto en un EditBox. 
*!*	nActSetMemo = Set("MemoWidth")

*!*	With Thisform.Edit1 
*!*	 Set Memowidth To Floor(.Width/(Fontmetric(6,.FontName,.FontSize)+1))
*!*	 nLines = Memlines(.Value)
*!*	EndWith

*!*	? "Número de líneas... " + Transform(nLines)
*!*	Set Memowidth To nActSetMemo

*!*	Messagebox por encima de todas las ventanas de Windows
*!*	Generalmente los Messagebox solo se muestran dentro del _Screen de VFP pero existe un valor no documentado que hace que el Messagebox se muestre encima de todas las ventanas de Windows. 
*!*	nEstilo = 4 + 32 + 4096 && el valor no documentado es 4096 
*!*	MESSAGEBOX("ESTE ES UN MESSAGEBOX", nEstilo , "DIEFERNTE" )

*!*	Código ESC para cortar el papel en impresoras Epson
*!*	Este truco te explica cual es la secuencia escape que debes enviar a la impresora Epson (TMU) para que corte el papel.
*!*	Set Console Off 
*!*	Set Device To Printer 
*!*	Set Printer To Name NombreDeImpresora 
*!*	Set Print On
*!*	??? Chr(27)+"m"&& Corta el Papel
*!*	Set Print Off 
*!*	Set Device To Screen 
*!*	Set Printer To 
*!*	Set Console On

*!*	Dejar fija primera columna de un grid
*!*	Este es un truco bastante solicitado .... Con VFP 8 o superior ya es posible hacerlo más fácilmente. Aquí tienes 2 formas de hacerlo.
*!*	En el AfteRowColchange del Grid digita lo siguiente:
*!*	Lparameters nColIndex
*!*	Thisform. LockScreen = .T. 
*!*	This.Columns(1).ColumnOrder =This. LeftColumn 
*!*	Thisform.LockScreen = .T.
*!*	** Y en el Scrolled del Grid esto :
*!*	Lparameters nDirection
*!*	Thisform. LockScreen= .T. 
*!*	If nDirection > 3 
*!*	This .Columns(1). ColumnOrder = This.LeftColumn 
*!*	Endif 
*!*	Thisform.LockScreen= .F.
*!*	OTRA FORMA
*!*	** En el AfteRowColchange del Grid digita lo siguiente:
*!*	nPos =This. ActiveColumn-This.RelativeColumn
*!*	If nPos>0 
*!*	This.COlumn1.ColumnOrder=nPos+1 
*!*	Else 
*!*	This.COlumn1.ColumnOrder=1 
*!*	Endif

*!*	Imprimir un archivo PDF
*!*	En muchas ocasiones se necesita imprimir un archivo PDF (Acrobat Reader) y pensamos diferentes formas de hacerlo.... esta es una de las más sencillas.
*!*	Para eso utilizamos la función ShellExecute del API de Windows.
*!*	Declare Integer ShellExecute In shell32. Dll; 
*!*	 long HWnd,String cOperation, ; 
*!*	 string cFile, String t cParam, ; 
*!*	 string cDir, Integer nShow
*!*	cRutaPDF = "C:Rutaarchivo.pdf"
*!*	ShellExecute(0, "print", cRutaPDF,"", Fullpath(""),0)

*!*	Nombre del dominio en que se logeo el PC
*!*	p align="justify">Un pequeño truco para cuando quieras determinar en que dominio se logeo un determinado PC.
*!*	? GetEnv("USERDOMAIN")

*!*	Conectarse a una base de datos de SQL Server
*!*	Esta es otra de las preguntas frecuentes .... aquí tienes varios ejemplos de como hacerlo.

*!*	cCadConnDSN = "driver = SQL Server;server=tu_server;uid=sa;pwd=sa_pw"

*!*	O 

*!*	cCadConnDSN = "driver = {SQL Server};server=tu_server;uid=sa;pwd=sa_pw"

*!*	O 

*!*	cCadConnDSN = "DRIVER = {SQL Server};" ;
*!*	 + "SERVER=tu_server;" ;
*!*	 + "UID=nombre_usuario;" ;
*!*	 + "PWD=clave_pw;" ;
*!*	 + "DATABASE=PUBS;" ; && Nombre de la base de datos
*!*	 + "WSID=nombre_usuario;" ;
*!*	 + "APP=__"

*!*	nHanConn = Sqlstringconnect(m.cCadConnDSN)

*!*	If nHanConn > 0
*!*	 =MessageBox("Conectado a la base de datos de SQl Server")
*!*	Else
*!*	 =MessageBox("Error al conectarse a la base de datos de SQl Server")
*!*	EndIf 

*!*	Agregar imagen al Screen centrada
*!*	Este es un antiguo truco que te permite agregar una imagen al screen de VFP centrada. Viejo pero bueno.
*!*	@ 2.000,2.000 Say "c:imagen.jpg" Bitmap STYLE "T" Center 

*!*	Devolver el nombre físico del formulario actual
*!*	En muchas ocasiones se necesario conocer el nombre del formulario que se esta ejecutando. La función Sys(1271) hace exactamente esto. 
*!*	Crea un formulario y un botón y coloca este código en el evento click del botón.
*!*	cForm = SYS(1271,Thisform)
*!*	Wait window cForm

*!*	Imprimir el contenido de un RTF
*!*	El RTF es un control ActiveX que permite dar características al texto al estilo de Word. En el ejemplo se muestra como imprimir el contenido de este ActiveX.
*!*	Para imprimir el contenido debes utilizar el método SelPrint del control RTF ...
*!*	With Thisform.Rtf
*!*	 .selstart=1
*!*	 .sellength=len(.textrtf)
*!*	 .selprint 

*!*	Exportar a HTML de forma sencilla
*!*	Esta es una de las formas más sencillas de exportar una tabla a HTML ... En este ejemplo se recorre numero de campos que tenga la tabla y luego el total de registros...
*!*	Scan

*!*	 For lnField = 1 To Afields(laFields)
*!*	 \<>
*!*	 Endfor

*!*	Endscan



*!*	Set Textmerge Off
*!*	Set Textmerge To
*!*	Strtofile(lcHTML,"c:TablaExportada.htm") 

*!*	Determinar la Dirección IP del Equipo
*!*	Una forma de conocer la dirección IP del equipo es invocando una función API, pero comentare otra forma de hacerlo y es pasándole el parámetro al programa RUN del DOS, el único inconveniente es que se mostrara la ventana del DOS, pero eso también tiene solución y será explicada en la sección de APIS
*!*	Local F, X, Y, U, K

*!*	F = Sys(2023) + "" + SubStr(Sys(2015),1,8) + ".txt" 
*!*	X = SubStr(sys(0),1, At(" ", Sys(0))-1) 
*!*	Run PING &X > &F
*!*	Y = FileToStr(F)
*!*	Delete File &F
*!*	U = At("[", Y) + 1 
*!*	K = At("]", Y)
*!*	? SubStr(Y,U,K-U)
*!*	Lo primero que realiza este código es definir algunas variables, luego obtiene el directorio de archivo temporales y genera un archivo único. A continuación se obtiene información sobre la unidad de red y estas valores se le pasan como parámetro al programa PING. 

*!*	Crystal Report y VFP
*!*	Uno de los grandes problemas de VFP son los reportes; pero podemos realizar los reportes en Cristal Report y luego llamarlos desde VFP. No quiero decir con esto que sea mejor, más fácil o más cómodo; simplemente es otra forma de hacerlo y tiene muchas ventajas.
*!*	En los ejemplos que demuestro estoy utilizando la versión 8 del Cristal Report de Seagate pero considero que se debe comportar igual con las demás versiones.
*!*	Primero veamos como puedo exportar un reporte a extensión .DOC (Word)
*!*	oCristalReport = createobject("crystal.crpe.application")
*!*	oRepx = oCristalReport.OpenReport("C: eporteventas.RPT")
*!*	oRepx.ExportOptions.FormatType = 14 && Formato de Word
*!*	oRepx.ExportOptions.DiskFileName = "c: eporteventasdelmes.doc"
*!*	oRepx.ExportOptions.DestinationType = 1 && Tipo de Destino a guardar
*!*	oRepx.Export(.F.) && No muestra ningun cuadro de Dialogo 
*!*	release oRepx
*!*	release oCristalReport 
*!*	Los otros formatos en que podemos guardar los reportes son:
*!*	Extensión FormatType
*!*	 RTF 4
*!*	EXCEL 7 27 o 28
*!*	EXCEL 8 29 o 30 

*!*	Para ver en vista previa un reporte: 
*!*	oCristalreport = createobject("crystal.crpe.application")
*!*	oRep = oCristalreport.OpenReport("C: eporteventas.RPT")
*!*	oRep.Preview 

*!*	Para mandarlo a imprimir 
*!*	oCristalreport = createobject("crystal.crpe.application")
*!*	oRep = oCristalreport.OpenReport("C: eporteventas.RPT")
*!*	oRep.Printout(.F.) && .F. no muestra cuadro para configurar impresora 

*!*	Quitar acentos de una cadenas de caracteres 
*!*	Algunas veces los acentos son algo molestos y nos causan inconvenientes, sobre todo al momento de realizar búsquedas dentro tablas
*!*	lCadena = "El amor es el perdón más fácil"
*!*	? CHRTRAN(lCadena, "áéíóúáéíóú", "aeiouAEIOU") 

*!*	Agregar ceros ( 0 ) a la izquierda de un número
*!*	Si deseas agregar 0 a un número a la izquierda de este, puedes hacer esto. Se utiliza mucho en la generación de Factura.
*!*	LnVar = 350 && Variable a agregar 0 

*!*	?PADL(lnVar,5,_0_) 

*!*	&& el número 5 especifica el ancho de la cadena de números 

*!*	Resultado 
*!*	00350 

*!*	Invocar cuadros de dialogo de Windows
*!*	Existe una forma sencilla de invocar cuadros de dialogo de Windows, tales como: Guardar, Abrir, Fuentes, Color, Impresoras, Ayuda.
*!*	loComDialog = newobject( "mscomdlg.commondialog" )

*!*	locomdialog.ShowFont && Mostrar Fuente

*!*	locomdialog.ShowPrinter() && Mostrar Impresora

*!*	locomdialog.ShowColor() && Mostrar Colores

*!*	locomdialog.ShowSave() && Mostrar Guardar 
*!*	loComDialog.ShowOpen && Mostrar Abrir

*!*	diferencia entre horas 
*!*	FUNTION DifHoras 
*!*	Lparameters ttIni,ttFin 
*!*	Local ln, lnDia, lnHor, lnMin, lnSeg 
*!*	If Empty(ttFin) 
*!*	ttFin = Datetime() 
*!*	Endif 
*!*	ln = ttFin - ttIni 
*!*	lnSeg = Mod(ln,60) 
*!*	ln = Int(ln/60) 
*!*	lnMin = Mod(ln,60) 
*!*	ln = Int(ln/60) 
*!*	lnHor = Mod(ln,24) 
*!*	lnDia = Int(ln/24) 
*!*	Return ; 
*!*	Transform(lnHor, "@L 99")+ ":"+ ; 
*!*	Transform(lnMin, "@L 99")
*!*	Hola Amigos: 

*!*	Les escribo porque tengo el siguiente problema y quizás Conozcan la solución 

*!*	Tengo una aplicación compilada con Vfp8 hice un instalador y anda muy bien en todas las redes en donde la he instalado 
*!*	salvo en una condición 

*!*	Cuando el cliente es un Win XP con SP2 me da el siguiente error 

*!*	R:\AdmCons\AdmCons.exe 
*!*	No se pudo iniciar la aplicación porque su configuración es incorrecta. Reinstalar la aplicación puede solucionar el problema. 


*!*	Por supuesto que ya la reinstale 1000 veces de 80 maneras distintas 

*!*	Me pasa con cualquier servidor Win Me Win XP etc pero siempre cuando el cliente es un XP con SP2 

*!*	Si el cliente es otra cosa o Win XP sin SP2 anda fenómeno 

*!*	Tengo todas las Dll registradas esta todo perfecto 

*!*	En la misma situación he hecho para probar EXE compilado con VFP6 y anda sin problema 

*!*	También he descubierto que ejecutando Do R:\Admcons\Admcons.exe desde la ventana de comando de VFP8 anda perfectamente
*!*	En la empresa tenemos la aplicación compilada en Vfp8 y funcionando en varios equipos con XP SP2 y funciona sin problemas.... 
*!*	Solo que como son muchos los puestos que conectan al servidor, en vez de instalar los Runtime de Vfox a cada puesto los colocamos en el Directorio Raiz de la aplicación, de esta forma no tuvimos que registrarlos en cada equipo. 

*!*	Los ficheros que copiamos en el directorio de la aplicación son: 

*!*	gdiplus.dll 
*!*	msvcr70.dll 
*!*	vfp8r.dll 
*!*	vfp8resn.dll 
*!*	vfp8t.dll
*!*	Re: RESALTAR UNA CELDA DE UN GRID ....
*!*	Por sotero (#866) a las 20:40 del 14-02-2006 

*!*	*Metodo iluminar, a llamar desde el AFTERROWCOLCHANGE del grid.
*!*	*Hay que pasarle donde esta la ubicación del grid.
*!*	*Ejemplo: Thisform.Iluminar("Thisform.pgfPiso.Page6.grdVisitas", "clientes")
*!*	*En el formulario hay que crear la PROPIEDAD "HITROW"
*!*	LPARAMETERS tcGrid , tcTabla

*!*	Thisform.HitRow = RECNO(tcTabla)

*!*	ThisForm.LockScreen = .T.
*!*	cDynamic = 'IIF(RECNO() = Thisform.HitRow , RGB(255,255,0), RGB(255,255,255))'
*!*	&tcGrid..SetAll('DynamicBackColor', cDynamic, 'Column')
*!*	&tcGrid..Refresh
*!*	ThisForm.LockScreen = .F.
*!*	***********************************************
*!*	Si estás en VFP 9 esto lo puedes suprimir y poner en el GRID la propiedad 
*!*	HighlightStyle a 2 (Enable highlighting for current row and persist when grid is
*!*	 not the current active control.)

*!*	Re: Problema con la "Ñ"
*!*	Por Ramón Rodríguez (#5229) a las 04:50 del 18-01-2006 

*!*	El problema es que son códigos de página diferentes entre los archivos dos y Windows, prueba esto 

*!*	x="Espero que tengas el más feliz de los cumpleaños" 
*!*	@1,1 say cpconvert(1252, 850,Allt(x)) 
*!*	Re: Problema con la "Ñ"
*!*	Por Christian (#4698) a las 15:17 del 19-01-2006 

*!*	Hola, Al momento de imprimir, hace un chrtransc de la descripcion, cambiando un caracter por otro 

*!*	EJECUTAR OUTLOOK EXPRESS DESDE VFP

*!*	DECLARE INTEGER ShellExecute ;
*!*	 IN SHELL32.DLL ;
*!*	 INTEGER nWinHandle,;
*!*	 STRING cOperation,;
*!*	 STRING cFileName,;
*!*	 STRING cParameters,;
*!*	 STRING cDirectory,;
*!*	 INTEGER nShowWindow

*!*	ShellExecute(0, "Open", "msimn.exe", "", "C:\Program Files\Outlook Express", 1)


*!*	CAMBIAR RESOLUCION DE LA PANTALLA

*!*	Cuando diseñamos nuestra aplicacion tenemos como base una resolucion para nuestra aplicacion, normalmente yo la diseño en 800 x 600, 
*!*	para garantizar el buen funcionamiento yo le indico a los usuarios si estan usando la configuración básica aceptable. 
*!*	Espero les pueda ayudar: 
*!*	IF dimensiones()=.T.
*!*	 =cambiar_resolucion(800,600)
*!*	ENDIF
*!*	FUNCTION dimensiones
*!*	 #DEFINE h_screenwidth 0 && Screen width
*!*	 #DEFINE h_screenheight 1 && Screen HEIGHT
*!*	 LOCAL lnalto_screen, lnancho_screen
*!*	 DECLARE INTEGER GetSystemMetrics IN Win32API;
*!*	 INTEGER nIndex
*!*	 lnalto_screen = getsystemmetrics(h_screenheight)
*!*	 lnancho_screen = getsystemmetrics(h_screenwidth)
*!*	 IF ( lnalto_screen < 600 OR lnancho_screen < 800 )
*!*	 IF MESSAGEBOX("Es recomendable que la resolución "+CHR(13)+;
*!*	 "de su monitor sea de 800 x 600"+CHR(13)+"Para que el sistema se ejecute adecuadamente"+CHR(13)+CHR(13)+;
*!*	 "¿ Desea cambiarla ?",4+32+0,"Verifique pregunta" ) = 6
*!*	 RETURN .T.
*!*	 ELSE
*!*	 RETURN .F.
*!*	 ENDIF
*!*	 ELSE
*!*	 RETURN .F.
*!*	 ENDIF
*!*	 #undefine h_screenwidth
*!*	 #undefine h_screenheight
*!*	ENDFUNC
*!*	FUNCTION cambiar_resolucion
*!*	 LPARAMETERS tnwidth, tnheight
*!*	 LOCAL lnwidth, lnheight, lnmodenum, lcdevmode, lnresp
*!*	 lnmodenum = 0
*!*	 lcdevmode = REPLICATE(CHR(0), 156)
*!*	 lnwidth = IIF(EMPTY(tnwidth), 800, tnwidth)
*!*	 lnheight = IIF(EMPTY(tnheight), 600, tnheight)
*!*	 DECLARE INTEGER EnumDisplaySettings IN Win32API STRING lpszDeviceName, INTEGER iModeNum, STRING @lpDevMode
*!*	 DECLARE INTEGER ChangeDisplaySettings IN Win32API STRING @lpDevMode , INTEGER dwFlags
*!*	 *!* Se usa obtener todos los modos disponibles
*!*	 DO WHILE enumdisplaysettings(NULL, lnmodenum, @lcdevmode) <> 0
*!*	 lnmodenum = lnmodenum + 1
*!*	 ENDDO
*!*	 lcdevmode = STUFF(lcdevmode, 41, 4, long2str(1572864))
*!*	 lcdevmode = STUFF(lcdevmode, 109, 4, long2str(tnwidth)) && Ancho
*!*	 lcdevmode = STUFF(lcdevmode, 113, 4, long2str(tnheight)) && Alto
*!*	 lnresp = changedisplaysettings(@lcdevmode, 1)
*!*	 IF lnresp = 0
*!*	 MESSAGEBOX("La resolución de su monitor ha sido cambiada"+CHR(13)+;
*!*	 "Ahora podra trabajar adecuamente",0+48+0,"atención" )
*!*	 ELSE
*!*	 MESSAGEBOX("No se pudo cambiar la resolución de su monitor",0+48+0,"atención" )
*!*	 ENDIF
*!*	ENDFUNC

*!*	FUNCTION long2str
*!*	 LPARAMETERS lnlongval
*!*	 *!* Convierte un long integer a un 4-byte character string
*!*	 *!* Sintaxis: LongToStr(lnLongVal)
*!*	 *!* Valor devuelto: lcRetStr
*!*	 *!* Argumentos: lnLongVal
*!*	 *!* lnLongVal especifica el long integer a convertir
*!*	 LOCAL lncnt, lcretstr
*!*	 lcretstr = ''
*!*	 FOR lncnt = 24 TO 0 STEP -8
*!*	 lcretstr = CHR(INT(lnlongval/(2^lncnt))) + lcretstr
*!*	 lnlongval = MOD(lnlongval, (2^lncnt))
*!*	 NEXT
*!*	 RETURN lcretstr
*!*	ENDFUNC
*!*	*****
*!*	Les explico, si ud hace diseñado una aplicación en una resolución de 800x600 (en este caso); podra advertir a los usuarios que su monitor no esta configurado adecuademente y este por si solo podra sin salir del sistema cambiar la resolución.

*!*	INFORMACION DE DRIVES
*!*	¿Quieres conocer toda la información de todas las unidades o drives instalados en tu sistema? Bueno pues esta función relizada con WSH lo hace para ti.
*!*	Function WSHListDrives
*!*	 LOCAL loFSO, loDrivesCol, loDrive, ;
*!*	 llIsReadyDrive, lnDriveType, lcDriveType, lnWait
*!*	 loFSO = CREATEOBJECT('Scripting.FileSystemObject')

*!*	 loDrivesCol = loFSO.Drives

*!*	 ? "El numero de drives en el sistema son: " + ALLTRIM(STR(loDrivesCol.Count))

*!*	 FOR EACH loDrive IN loDrivesCol
*!*	 ? "Drive : " + loDrive.DriveLetter
*!*	 lnDriveType = loDrive.DriveType
*!*	 DO CASE
*!*	 CASE lnDriveType=1
*!*	 lcDriveType = [removible]
*!*	 CASE lnDriveType=2
*!*	 lcDriveType = [fijo]
*!*	 CASE lnDriveType=3
*!*	 lcDriveType = [network]
*!*	 CASE lnDriveType=4
*!*	 lcDriveType = [CD-ROM]
*!*	 CASE lnDriveType=5
*!*	 lcDriveType = [RAM-disk]
*!*	 ENDCASE
*!*	 ? "El tipo de drive es: " + lcDriveType

*!*	 llIsReadyDrive = loDrive.IsReady
*!*	 ? IIF( llIsReadyDrive=.T., [El Drive esta listo.],[El drive no esta listo.])

*!*	 IF llIsReadyDrive
*!*	 ? "Espacio disponible: " + ALLTRIM(STR(loDrive.AvailableSpace)) + [ bytes.]
*!*	 ? "Espacio Libre: " + ALLTRIM(STR(loDrive.FreeSpace)) + [ bytes.]
*!*	 ? "Tamaño total: " + ALLTRIM(STR(loDrive.TotalSize)) + [ bytes.]
*!*	 ? "Ruta: " + loDrive.Path
*!*	 ? "Nombre del volumen: " + loDrive.VolumeName
*!*	 ENDIF

*!*	 IF INLIST(lnDriveType,1,2,4) AND llIsReadyDrive
*!*	 ? "Número de serie: " + ALLTRIM(STR(loDrive.SerialNumber))
*!*	 ENDIF

*!*	 IF lnDriveType=3
*!*	 ? "Nombre compartido: " + loDrive.ShareName
*!*	 ELSE
*!*	 IF lnDriveType=2
*!*	 ? "Nombre compartido: " + RTRIM(LEFT(SYS(0),15))
*!*	 ENDIF
*!*	 ENDIF
*!*	 WAIT
*!*	 CLEAR
*!*	 NEXT
*!*	Endfunc

*!*	CREAR ARCHIVO DE TEXTO CON FILESYSTEMS
*!*	Function crearArchivo()

*!*	 Local fso, fldr

*!*	 fso = CreateObject("Scripting.FileSystemObject")

*!*	 fldr = fso.CreateTextFile("C:prueba.txt")

*!*	Endfunc

*!*	BORRAR CARPETA CON FILESYSTEM
*!*	Function Borrarcarpeta()
*!*	 Local fso as object
*!*	 fso = CreateObject("Scripting.FileSystemObject")
*!*	 fldr = fso.DeleteFolder("C:\borrame")
*!*	Endfunc

*!*	ABRIR CUADRO DE DIALOGO CONECTAR A RED O IMPRESORA
*!*	Esta función permite abrir el cuadro de diálogo conectar a unidad de red o impresora 
*!*	#DEFINE RESOURCETYPE_DISK 1
*!*	#DEFINE RESOURCETYPE_PRINT 2

*!*	Declare Integer WNetConnectionDialog In Win32Api;
*!*	Integer Handle, Integer ResourceType

*!*	Declare Integer FindWindow In Win32Api;
*!*	Integer Handle, String cTitle

*!*	*-- Para conectar a una unidad de red
*!*	WNetConnectionDialog(FindWindow(0,_Screen.Caption), RESOURCETYPE_DISK)

*!*	*-- Para conectar a una impresora
*!*	WNetConnectionDialog(FindWindow(0,_Screen.Caption), RESOURCETYPE_PRINT)

*!*	HACER PARPADEAR UNA VENTANA TIPO MSN
*!*	Este Ejemplo permite hacer Parpadear un Form de la misma manera que lo hace el Microsoft Messenger, cuando llega un nuevo mensaje, y no esta activa la ventana en ese momento, y que para cuando se Activa. 
*!*	*** Opciones De Parpadeo
*!*	#Define FlashW_Stop 0 &&Para el Parpadeo de una ventana.
*!*	#Define FlashW_Caption 0x1 &&Hace Parpadear El Titulo de Una Ventana
*!*	#Define FlashW_Tray 0x2 &&Hace Parpadear la Ventana en la TaskBar
*!*	#Define FlashW_All 3&&Parpadea El Titulo de la ventana y en la Taskbar
*!*	#Define FlashW_Timer 0x4 &&Parpadea Infinitamente, o hasta Enviar Un FlashW_Stop
*!*	#Define FlashW_TimerNoFg 0xC &&Parpadea hasta que Se Active la Ventana
*!*	*** Declaracion de Las Apis
*!*	Declare Long FlashWindowEx In "user32" String @CFlashWInfo
*!*	Declare Long FindWindow In User32 String cClass, String cCaption
*!*	*** Inicia El Codigo
*!*	Local cFlashInfo
*!*	cFlashInfo =Space(20)
*!*	*** Creamos La Estructura
*!*	cFlashInfo = Num2dWord(20)+; &&Longitud de la Estructura 
*!*	 Num2dWord(FindWindow(.Null.,'Calculadora'))+; &&Handle de la Ventana a "Flashear"
*!*	 Num2dWord(FlashW_All+FlashW_TimerNoFg)+; &&Opciones
*!*	 Num2dWord(5)+; && Cantidad de Veces que Parpadeara (0 =Infinito)
*!*	 Num2dWord(0) && Tiempo entre Parpadeo (en Milisegundos, 0=Default)
*!*	*** Hacemos Parpadear la Ventana. 
*!*	FlashWindowEx(@cFlashInfo)

*!*	Procedure Num2dWord
*!*	Lparameter tnNum
*!*	Local c0,c1,c2,c3
*!*	lcresult = Chr(0)+Chr(0)+Chr(0)+Chr(0)
*!*	If tnNum < (2^31 - 1) then
*!*	 c3 = Chr(Int(tnNum/(256^3)))
*!*	 tnNum = Mod(tnNum,256^3)
*!*	 c2 = Chr(Int(tnNum/(256^2)))
*!*	 tnNum = Mod(tnNum,256^2)
*!*	 c1 = Chr(Int(tnNum/256))
*!*	 c0 = Chr(Mod(tnNum,256))
*!*	 lcresult = c0+c1+c2+c3
*!*	Endif
*!*	Return lcresult
*!*	Endproc

*!*	CONOCER EL TAMAÑO DE UN ARCHIVO
*!*	Esta funcion permite saber el tamaño de un archivo en especifico (en bytes), por medio de api. 
*!*	#Define OF_READ 0x0
*!*	?GetInfoF("c:config.sys")
*!*	?? " Bytes"

*!*	Function GetInfoF(cFile)
*!*	 Declare Long _lopen In "kernel32" As lOpen String lpPathName, Long iReadWrite
*!*	 Declare Long _lclose In "kernel32" As lclose Long hFile
*!*	 Declare Long GetFileSize In "kernel32" Long hFile, Long @lpFileSizeHigh
*!*	 Local nArchivo As Long, nLongitud As Long
*!*	 Local lpMax As Long
*!*	 lpMax =1
*!*	 nArchivo= lOpen(cFile, OF_READ)
*!*	 nLongitud = GetFileSize(nArchivo, @lpMax )
*!*	 lclose(nArchivo)
*!*	 Return nLongitud
*!*	Endfunc

*!*	HACER CONEXIÓN ODBC DESDE VFP
*!*	 Aqui esta el código para hacerlo mediante API.
*!*	DECLARE Integer SQLConfigDataSource IN odbccp32.dll ; 

*!*	Integer, Short, String @, String @ 



*!*	ODBC_ADD_SYS_DSN = 1



*!*	lc_driver = "Microsoft Visual FoxPro Driver" + CHR(0) 

*!*	lc_dsn = "dsn=Bases Bodega1" + CHR(0) + ; 

*!*	"BackgroundFetch=Yes" + CHR(0) + ; 

*!*	"Description=descripcion de la conexion" + CHR(0) + "Exclusive=No" + CHR(0) +;

*!*	"SourceDb=

*!*	uta.dbc" + CHR(0) +;

*!*	"Sourcetype=DBC" 

*!*	IF SQLConfigDataSource(0, ODBC_ADD_SYS_DSN, @lc_driver, @lc_dsn) = 1 

*!*	RETURN .T. && OK 

*!*	ENDIF 

*!*	RETURN .F. && error


*!*	*.- lc_driver = Drive de Visual FoxPro
*!*	*.- lc_dsn = dsn = Nombre de la Conexion
*!*	*.- BackgroudFetch = Busqueda de datos secundarios Valores Yes o No
*!*	*.- Description = Descripcion de de la conexion
*!*	*.- SourceDb = Mapeo o direccion de la tabla o base de datos a conectar
*!*	*.- SourceType = tipo de conexion valores DBC o DBF si fuera tabla libre

*!*	HACER PARPADEAR LA BARRA DE TITULO DE NUESTRA APLICACIÓN

*!*	Este efecto es muy comun en las aplicaciones hoy en dia tal, como MSN. que cuando nos escriben un mensaje, parpadea el titulo de una ventana en la barra de tareas. 
*!*	Desde VFP podemos hacerlo. La función que nos permite hacerlo la declaramos asi: 
*!*	Declare FlashWindow IN user32.dll ;
*!*	LONG hwnd,;
*!*	Long bInvert
*!*	Cuando querramos que nuestra aplicacion parpadee ejecutamos lo siguiente: Si queremos que el _screen Parpadee 
*!*	FlashWindow(application.hWnd,.t.)
*!*	Si queremos que el form lo haga 
*!*	FlashWindow(thisform.HWnd,.t.)
*!*	NOTA: FlashWindow solo hará que la ventana parpadee una sola vez, si queremos que el parpadeo persista, deberemos colocar el código en un Timer, y en el evento Activate del Form, desactivar el Timer, o que el Timer lo ejecute X veces. El segundo parámetro nos permite decirle si queremos que parpadee si esta activada o no. Al pasarle .T. la ventana parpadeara una sola vez, este o no activada, si le pasamos .F. parpadeara solo si la ventana esta inactiva y quedara de otro color el boton en la barra de tareas. Este código esta en VFP 7. Si quieren ejecutarla desde VFP 6 deberan obtener el handle de la ventana a la que le quieran aplicar el efecto. En PortalFox esta la función para hacerlo. Creo que son estas APIs: 
*!*	GetWindow
*!*	FindWindow

*!*	OBTENER DIRECCION IP CON WINSOCK
*!*	Una manera de conseguir la dirección IP local con Winsock. 
*!*	************************************************************
*!*	*
*!*	* Clase: GET_IPADDRESS
*!*	*
*!*	* Devuelve la dirección IP local
*!*	*
*!*	* Parametros:
*!*	*
*!*	* ninguno
*!*	*
*!*	* Ejemplos:
*!*	*
*!*	* ipdir=get_ipaddress()
*!*	*
*!*	* Retorno
*!*	*
*!*	* dirección IP o cadena vacia si no está instalado el WinSock
*!*	*
*!*	* Nota
*!*	*
*!*	* Adaptado de John Harvey
*!*	*
*!*	* Fecha de Creación : 29/01/2001 Pablo Roca
*!*	* Ultima Modificacion: 29/01/2001 Pablo Roca
*!*	*
*!*	************************************************************
*!*	LOCAL lcret
*!*	IPSocket = CreateObject("MSWinsock.Winsock")
*!*	IF TYPE('IPSocket')='O'
*!*	 lcret = IPSocket.LocalIP
*!*	ELSE
*!*	 MESSAGEBOX("Winsock no está instalado!")
*!*	 lcret = ""
*!*	ENDIF
*!*	RETURN lcret

*!*	CAMBIAR RESOLUCION DE LA PANTALLA
*!*	*!* Cambia la resolución de la pantalla
*!*	*!* Sintaxis: ChangeRes(tnWidth, tnHeight)
*!*	*!* Valor devuelto: llRetVal
*!*	*!* Argumentos: tnWidth, tnHeight
*!*	*!* tnWidth especifica la nueva anchura de la pantalla en pixels
*!*	*!* tnHeight especifica la nueva altura de la pantalla en pixels

*!*	FUNCTION ChangeRes
*!*	 LPARAMETERS tnWidth, tnHeight
*!*	 LOCAL lnWidth, lnHeight, lnModeNum, lcDevMode
*!*	 *!* Valores
*!*	 lnModeNum = 0
*!*	 lcDevMode = REPLICATE(CHR(0), 156)
*!*	 lnWidth = IIF(EMPTY(tnWidth), 800, tnWidth)
*!*	 lnHeight = IIF(EMPTY(tnHeight), 600, tnHeight)
*!*	 *!* Instrucciones DECLARE DLL para cambiar resolución
*!*	 DECLARE INTEGER EnumDisplaySettings IN Win32API STRING lpszDeviceName,;
*!*	 INTEGER iModeNum, STRING @lpDevMode
*!*	 DECLARE INTEGER ChangeDisplaySettings IN Win32API STRING @lpDevMode ,;
*!*	 INTEGER dwFlags
*!*	 *!* Bucle para obtener todos los modos disponibles
*!*	 DO WHILE EnumDisplaySettings(NULL, lnModeNum, @lcDevMode) <> 0
*!*	 lnModeNum = lnModeNum +1
*!*	 ENDDO
*!*	 *!* Configurar la structura DevMode
*!*	 lcDevMode = STUFF(lcDevMode, 41, 4, LongToStr(1572864))
*!*	 lcDevMode = STUFF(lcDevMode, 109, 4, LongToStr(tnWidth)) && Ancho
*!*	 lcDevMode = STUFF(lcDevMode, 113, 4, LongToStr(tnHeight)) && Alto
*!*	 *!* Cambiar resolucion
*!*	 ChangeDisplaySettings(@lcDevMode, 1)
*!*	ENDFUNC

*!*	*!* Convierte un long integer a un 4-byte character string
*!*	*!* Sintaxis: LongToStr(lnLongVal)
*!*	*!* Valor devuelto: lcRetStr
*!*	*!* Argumentos: lnLongVal
*!*	*!* lnLongVal especifica el long integer a convertir
*!*	FUNCTION LongToStr
*!*	 LPARAMETERS lnLongVal
*!*	 LOCAL lnCnt, lcRetStr
*!*	 lcRetStr = ''
*!*	 FOR lnCnt = 24 TO 0 STEP -8
*!*	 lcRetStr = CHR(INT(lnLongVal/(2^lnCnt))) + lcRetStr
*!*	 lnLongVal = MOD(lnLongVal, (2^lnCnt))
*!*	 NEXT
*!*	 RETURN lcRetStr
*!*	ENDFUNC

*!*	OCULTA BARRA DE TAREAS DE WINDOWS
*!*	*!* Oculta la barra de tareas de windows
*!*	*!* Sintaxis: HideTaskBar()
*!*	*!* Valor devuelto:
*!*	*!* Argumentos:
*!*	FUNCTION HideTaskBar

*!*	*!* Constantes para ocultar o mostrar la barra de tareas de windows
*!*	* Sgte linea notificada por Hugo Ranea 20/06/2001
*!*	 #DEFINE TOGGLE_HIDEWINDOW 128
*!*	 LOCAL lnHwnd
*!*	 *!* Valores
*!*	 lnHwnd = 0
*!*	 *!* Instrucciones DECLARE DLL para manipular la barra de tareas
*!*	 DECLARE INTEGER FindWindowA IN Win32API STRING lpClassName,;
*!*	 STRING lpWindowName
*!*	 DECLARE INTEGER SetWindowPos IN Win32API INTEGER hwnd,;
*!*	 INTEGER hwndInsertAfter, INTEGER x, INTEGER y, INTEGER cx,;
*!*	 INTEGER cy, INTEGER wFlags
*!*	 *!* Valores
*!*	 lnHwnd = FindWindowA('Shell_traywnd', '')
*!*	 *!* Ocultar la barra de tareas
*!*	 IF lnHwnd <> 0
*!*	 SetWindowPos(lnHwnd, 0, 0, 0, 0, 0, TOGGLE_HIDEWINDOW)
*!*	 ENDIF
*!*	ENDFUNC

*!*	MOSTRAR BARRA DE TAREAS DE WINDOWS
*!*	*!* Muestra la barra de tareas de windows
*!*	*!* Sintaxis: ShowTaskBar()
*!*	*!* Valor devuelto:
*!*	*!* Argumentos:FUNCTION ShowTaskBar
*!*	*!* Constantes para ocultar o mostrar la barra de tareas de windows
*!*	* Sgte linea notificada por Hugo Ranea 20/06/2001
*!*	 #DEFINE TOGGLE_UNHIDEWINDOW 64
*!*	 LOCAL lnHwnd
*!*	 *!* Valores
*!*	 lnHwnd = 0
*!*	 *!* Instrucciones DECLARE DLL para manipular la barra de tareas
*!*	 DECLARE INTEGER FindWindowA IN Win32API STRING lpClassName,STRING lpWindowName
*!*	 DECLARE INTEGER SetWindowPos IN Win32API INTEGER hwnd,;
*!*	 INTEGER hwndInsertAfter, INTEGER x, INTEGER y, INTEGER cx,;
*!*	 INTEGER cy, INTEGER wFlags
*!*	 *!* Valores
*!*	 lnHwnd = FindWindowA('Shell_traywnd', '')
*!*	 *!* Mostrar la barra de tareas
*!*	 IF lnHwnd <> 0
*!*	 SetWindowPos(lnHwnd, 0, 0, 0, 0, 0, TOGGLE_UNHIDEWINDOW)
*!*	 ENDIF
*!*	ENDFUNC

*!*	EVITAR QUE UNA APLICACION SE CARGUE DOS VECES
*!*	La misma función que hemos visto en el caso anterior puede ser
*!*	usada para evitar que un programa externo se cargue mós de una vez.
*!*	Un ejemplo sencillo es el de la calculadora de Windows.

*!*	Imaginemos que en nuestra aplicación demos la posibilidad de utilizar
*!*	la calculadora. Pondríamos una línea come esta:

*!*	RUN /N CALC.EXE

*!*	Pero si esta línea la ejecutamos más de una vez, se cargarás la
*!*	calcuadora una y otra vez.

*!*	* Antes de activar la calculadora:
*!*	IF NOT F_ActivaWin("Calculadora")
*!*	 * La calculadora no está cargada:
*!*	 RUN /N CALC.EXE
*!*	ENDIF

*!*	* Y ESTA ES LA FUNCION QUE LO HACE TODO:
*!*	*-----------------------------
*!*	FUNCTION F_ActivaWin(cCaption)
*!*	*-----------------------------
*!*	LOCAL nHWD
*!*	DECLARE INTEGER FindWindow IN WIN32API ;
*!*	STRING cNULL, ;
*!*	STRING cWinName

*!*	DECLARE SetForegroundWindow IN WIN32API ;
*!*	INTEGER nHandle

*!*	DECLARE SetActiveWindow IN WIN32API ;
*!*	INTEGER nHandle

*!*	DECLARE ShowWindow IN WIN32API ;
*!*	INTEGER nHandle, ;
*!*	INTEGER nState

*!*	nHWD = FindWindow(0, cCaption)
*!*	IF nHWD > 0
*!*	 * VENTANA YA ACTIVA
*!*	 * LA "LLAMAMOS":
*!*	 ShowWindow(nHWD,9)

*!*	 * LA PONEMOS ENCIMA
*!*	 SetForegroundWindow(nHWD)

*!*	 * LA ACTIVAMOS
*!*	 SetActiveWindow(nHWD)
*!*	 RETURN .T.
*!*	ELSE
*!*	 * VENTANA NO ACTIVA
*!*	 RETURN .F.
*!*	ENDIF

*!*	Como saber el nombre del PC y el recurso compartido de una conexión de red. 
*!*	*-----------------------------------------
*!*	FUNCTION _GetConnec(lcDrive)
*!*	*-----------------------------------------
*!*	* Retorna el nombre de la PC y recurso compartido
*!*	* de una coneccion de red
*!*	* PARAMETROS: lcDrive 
*!*	* USO: _GetConnec("K:")
*!*	*-----------------------------------------
*!*	 DECLARE INTEGER WNetGetConnection IN WIN32API ;
*!*	 STRING lpLocalName, ;
*!*	 STRING @lpRemoteName, ;
*!*	 INTEGER @lpnLength
*!*	 LOCAL cRemoteName, nLength, lcRet, llRet
*!*	 cRemoteName=SPACE(100)
*!*	 nLength=100
*!*	 llRet = WNetGetConnection(lcDrive,@cRemoteName,@nLength)
*!*	 lcRet = LEFT(cRemoteName,AT(CHR(0),cRemoteName)-1)
*!*	 RETURN lcRet
*!*	ENDFUNC

*!*	Ejemplo de como agregar un menú en un formulario SDI (Interfaz de un solo documento - Single Document Interface). 

*!*	Agregar un menú en un formulario SDI
*!*	Introducción
*!*	Continuando con el tema de formularios SDI (Interfaz de un solo documento - Single Document Interface), esta vez mostraré como agregar un menú en un formulario de nivel superior.
*!*	Crear el formulario de nivel superior
*!*	Como ya vimos en un artículo anterior, para crear un formulario SDI en Visual FoxPro, debemos crear un Formulario de nivel superior, 
*!*	configurando la propiedad ShowWindow = 2 (Como formulario de nivel superior). 
*!*	Un formulario de nivel superior aparece como una ventana independiente sobre el escritorio de Windows y se muestra en la barra de tareas de Windows.
*!*	Crear el menú
*!*	La creación de un menú SDI para agregar en un formulario de nivel superior, es igual que la creación de cualquier otro menú, 
*!*	solo debemos marcar la casilla de verificación Formulario de nivel superior en el cuadro de dialogo Opciones generales que se muestra 
*!*	al seleccionar la opción Ver -> Opciones generales desde el diseñador de menú, como lo muestra la figura siguiente:

*!*	Cuando generamos el menú con esta opción activada, se deberá llamar al menú desde el método Init del formulario de nivel superior con una sentencia como la siguiente
*!*	DO MiMenu.mpr WITH THISFORM,.T.
*!*	Editando el archivo MiMenu.mpr podemos ver en las primeras líneas comentadas, una ayuda con las distintas formas de llamar al menú generado.
*!*	Código de ejemplo
*!*	El siguiente código es un ejemplo para mostrar un formulario de nivel superior con un menú incorporado. Para ejecutarlo con un menú personalizado, se debe habilitar la línea DO MiMenu.mpr WITH Thisform, .T. en el método Init del formulario, y quitar la llamada al procedimiento MiMenuEjemplo.
*!*	PUBLIC goMiForm
*!*	goMiForm=CREATEOBJECT("MiForm")
*!*	goMiForm.SHOW(1)
*!*	RETURN
*!*	*---
*!*	*--- Definición de MiForm
*!*	*---
*!*	DEFINE CLASS MiForm AS FORM
*!*	 SHOWWINDOW = 2
*!*	 DOCREATE = .T.
*!*	 AUTOCENTER = .T.
*!*	 CAPTION = "Ejemplo de menú en un formulario SDI"
*!*	 NAME = "MiForm"

*!*	 PROCEDURE INIT
*!*	 *DO MiMenu.mpr WITH Thisform, .T.
*!*	 DO MiMenuEjemplo WITH THISFORM, .T.
*!*	 ENDPROC

*!*	 PROCEDURE DESTROY
*!*	 RELEASE MENU (THIS.NAME) EXTENDED
*!*	 ENDPROC
*!*	ENDDEFINE
*!*	*---
*!*	*--- MiMenuEjemplo.spr
*!*	*---
*!*	PROCEDURE MiMenuEjemplo
*!*	 LPARAMETERS oFormRef, getMenuName, lUniquePopups
*!*	 LOCAL cMenuName, nTotPops, a_menupops, cTypeParm2, cSaveFormName
*!*	 IF TYPE("m.oFormRef") # "O" OR ;
*!*	 LOWER(m.oFormRef.BASECLASS) # 'form' OR ;
*!*	 m.oFormRef.SHOWWINDOW # 2
*!*	 MESSAGEBOX([Este menú solo puede ser llamado en un formulario de nivel superior])
*!*	 RETURN
*!*	 ENDIF
*!*	 m.cTypeParm2 = TYPE("m.getMenuName")
*!*	 m.cMenuName = SYS(2015)
*!*	 m.cSaveFormName = m.oFormRef.NAME
*!*	 IF m.cTypeParm2 = "C" OR (m.cTypeParm2 = "L" AND m.getMenuName)
*!*	 m.oFormRef.NAME = m.cMenuName
*!*	 ENDIF
*!*	 IF m.cTypeParm2 = "C" AND !EMPTY(m.getMenuName)
*!*	 m.cMenuName = m.getMenuName
*!*	 ENDIF
*!*	 DIMENSION a_menupops[3]
*!*	 IF TYPE("m.lUniquePopups")="L" AND m.lUniquePopups
*!*	 FOR nTotPops = 1 TO ALEN(a_menupops)
*!*	 a_menupops[m.nTotPops]= SYS(2015)
*!*	 ENDFOR
*!*	 ELSE
*!*	 a_menupops[1]="archivo"
*!*	 a_menupops[2]="edición"
*!*	 a_menupops[3]="ayuda"
*!*	 ENDIF
*!*	 *---
*!*	 *--- Definición del menú
*!*	 *---
*!*	 DEFINE MENU (m.cMenuName) IN (m.oFormRef.NAME) BAR
*!*	 DEFINE PAD _1mv0kg6re OF (m.cMenuName) PROMPT "\ DEFINE PAD _1mv0kg6rf OF (m.cMenuName) PROMPT "\ DEFINE PAD _1mv0kg6rg OF (m.cMenuName) PROMPT "A\ ON PAD _1mv0kg6re OF (m.cMenuName) ACTIVATE POPUP (a_menupops[1])
*!*	 ON PAD _1mv0kg6rf OF (m.cMenuName) ACTIVATE POPUP (a_menupops[2])
*!*	 ON PAD _1mv0kg6rg OF (m.cMenuName) ACTIVATE POPUP (a_menupops[3])

*!*	 DEFINE POPUP (a_menupops[1]) MARGIN RELATIVE SHADOW COLOR SCHEME 4
*!*	 DEFINE BAR 1 OF (a_menupops[1]) PROMPT "\ DEFINE BAR 2 OF (a_menupops[1]) PROMPT "\ DEFINE BAR 3 OF (a_menupops[1]) PROMPT "\-"
*!*	 DEFINE BAR 4 OF (a_menupops[1]) PROMPT "\ DEFINE BAR 5 OF (a_menupops[1]) PROMPT "\ DEFINE BAR 6 OF (a_menupops[1]) PROMPT "\ DEFINE BAR 7 OF (a_menupops[1]) PROMPT "\-"
*!*	 DEFINE BAR 8 OF (a_menupops[1]) PROMPT "\ ON SELECTION BAR 8 OF (a_menupops[1]) DO _Salir

*!*	 DEFINE POPUP (a_menupops[2]) MARGIN RELATIVE SHADOW COLOR SCHEME 4
*!*	 DEFINE BAR 1 OF (a_menupops[2]) PROMPT "\ DEFINE BAR 2 OF (a_menupops[2]) PROMPT "\-"
*!*	 DEFINE BAR 3 OF (a_menupops[2]) PROMPT "Cor\ DEFINE BAR 4 OF (a_menupops[2]) PROMPT "\ DEFINE BAR 5 OF (a_menupops[2]) PROMPT "\
*!*	 DEFINE POPUP (a_menupops[3]) MARGIN RELATIVE SHADOW COLOR SCHEME 4
*!*	 DEFINE BAR 1 OF (a_menupops[3]) PROMPT "\ DEFINE BAR 2 OF (a_menupops[3]) PROMPT "\-"
*!*	 DEFINE BAR 3 OF (a_menupops[3]) PROMPT "Acerca \
*!*	 ACTIVATE MENU (m.cMenuName) NOWAIT

*!*	 IF m.cTypeParm2 = "C"
*!*	 m.getMenuName = m.cMenuName
*!*	 m.oFormRef.NAME = m.cSaveFormName
*!*	 ENDIF
*!*	ENDPROC

*!*	PROCEDURE _Salir
*!*	 _SCREEN.ACTIVEFORM.RELEASE
*!*	ENDPROC
*!*	Al ejecutar el código anterior, veremos el formulario SDI con el menú como lo muestra la siguiente figura:

*!*	Comentarios
*!*	Recordar que Visual FoxPro trae en la aplicación "Solution" un ejemplo similar donde se muestra un formulario SDI, en el cual se agrega un menú, una barra de herramientas, y se crean ventanas secundarias. Para ver la aplicación "Solution" ejecute:
*!*	DO (HOME(2) + "Solution\Solution")
*!*	O directamente corra el ejemplo del formulario SDI ejecutando:
*!*	DO FORM (HOME(2) + "\Solution\Forms\SDIForm.scx")
*!*	Buscar texto en un Cuadro de Edicion
*!*	Para ver el ejemplo ejecute el siguiente código: 
*!*	*-- Creo un archivo de texto
*!*	SET SAFETY OFF
*!*	LOCAL lc
*!*	TEXT TO lc NOSHOW
*!*	Este es un texto tomado de un archivo de
*!*	texto, para buscar una palabra y remarcarla
*!*	si la encuentra.

*!*	Escriba en el cuadro de texto una palabra
*!*	que se encuentre aquí y haga click en el
*!*	botón Buscar.

*!*	Visual FoxPro. Nada corre como un zorro.
*!*	ENDTEXT
*!*	STRTOFILE(lc,"MiTxt.txt")
*!*	*-- Creo el formulario
*!*	PUBLIC goForm
*!*	goForm = CREATEOBJECT("Form1")
*!*	goForm.SHOW

*!*	DEFINE CLASS Form1 AS FORM
*!*	 CAPTION = "Ejemplo de búsqueda en un EditBox"
*!*	 NAME = "Form1"
*!*	 ADD OBJECT Text1 AS TEXTBOX WITH ;
*!*	 HEIGHT = 24, ;
*!*	 LEFT = 24, ;
*!*	 TOP = 12, ;
*!*	 NAME = "Text1"
*!*	 ADD OBJECT Command1 AS COMMANDBUTTON WITH ;
*!*	 HEIGHT = 24, ;
*!*	 TOP = 12, ;
*!*	 LEFT = 144, ;
*!*	 CAPTION = "Buscar", ;
*!*	 NAME = "Command1"
*!*	 ADD OBJECT Edit1 AS EDITBOX WITH ;
*!*	 HEIGHT = 180, ;
*!*	 LEFT = 24, ;
*!*	 TOP = 48, ;
*!*	 WIDTH = 300, ;
*!*	 NAME = "Edit1"
*!*	 PROCEDURE INIT
*!*	 THISFORM.Edit1.VALUE = FILETOSTR("MiTxt.txt")
*!*	 ENDPROC
*!*	 PROCEDURE Command1.CLICK
*!*	 LOCAL lcBusca, lnPos, lnLen
*!*	 lcBusca = ALLTRIM(THISFORM.Text1.VALUE)
*!*	 lnLen = LEN(lcBusca)
*!*	 lnPos = AT(lcBusca,THISFORM.Edit1.VALUE)
*!*	 IF lnPos > 0
*!*	 THISFORM.Edit1.SELSTART = lnPos - 1
*!*	 THISFORM.Edit1.SELLENGTH = lnLen
*!*	 THISFORM.Edit1.SETFOCUS
*!*	 ELSE
*!*	 MESSAGEBOX("No se encuentra",64,"Aviso")
*!*	 ENDIF
*!*	 ENDPROC
*!*	ENDDEFINE

*!*	EVITAR RETORNO DE CARRO EN UN EDITBOX
*!*	public oForm
*!*	oForm = CREATEOBJECT("MyForm")
*!*	oForm.Show()
*!*	DEFINE CLASS MyForm AS Form
*!*	 Caption = "No-Retorno de Carro"
*!*	 ADD OBJECT MyLabel AS Label ;
*!*	 WITH AutoSize=.T.,;
*!*	 Caption="Introduzca su texto, no se permite tecla ENTER"
*!*	 ADD OBJECT myEditBox AS EditBox ;
*!*	 WITH Top = 20, Width=300, Height=200
*!*	 PROCEDURE MyEditBox.KeyPress
*!*	 LPARAMETERS nKeyCode, nShiftAltCtrl
*!*	 **** Si se introduce la tecla ENTER ***
*!*	 IF nKeyCode=13
*!*	 NODEFAULT &&No hacer nada (Inhibir)
*!*	 ENDIF
*!*	 ENDPROC
*!*	ENDDEFINE

*!*	BUSQUEDA INCREMENTAL EN UN FORMULARIO
*!*	Una forma de hacer una busqueda incremental en un formulario, ingresando un texto en un TextBox y visualizando el resultado en un Grid
*!*	En este ejemplo de BUSQUEDA INCREMENTAL en un Formulario, debemos poner un TextBox (Text1) y una Grilla (Grid1).
*!*	En el Entorno de datos insertaremos la tabla (MiTabla)
*!*	En el método InteractiveChange del TextBox debemos escribir el siguiente código:
*!*	*--- InteractiveChange ---
*!*	LOCAL lc, lnRecno
*!*	SELECT MiTabla
*!*	lc = ALLT(THIS.VALUE)
*!*	lnRecno = RECNO()
*!*	IF MiTabla.Nombre >= lc
*!*	 IF NOT BOF()
*!*	 SKIP -1
*!*	 ENDIF
*!*	 IF MiTabla.Nombre < lc && debe quedar donde estaba
*!*	 IF lnRecno <= RECC()
*!*	 GO RECNO()
*!*	 ELSE
*!*	 GO BOTT
*!*	 ENDIF
*!*	 RETURN
*!*	 ENDIF
*!*	 IF NOT EMPTY(ORDER()) && busqueda con indice
*!*	 SEEK lc
*!*	 ELSE
*!*	 GO TOP
*!*	 LOCATE REST FOR MiTabla.Nombre=lc WHILE MiTabla.Nombre <= lc NOOPTIMIZE
*!*	 ENDIF
*!*	ELSE
*!*	 LOCATE REST FOR MiTabla.Nombre=lc WHILE MiTabla.Nombre <= lc NOOPTIMIZE
*!*	ENDIF

*!*	IF lnRecno # RECNO()
*!*	 THISFORM.Grid1.SETFOCUS && el nombre del TextBox
*!*	 THISFORM.Text1.SETFOCUS && el nombre del Grid
*!*	ENDIF
*!*	RETURN
*!*	*--- END InteractiveChange ---
*!*	NOTA: SE DEBE TENER LAS SIGUIENTES CONSIDERACIONES:
*!*	La tabla debe estar ordenada ASCENDENTEMENTE o existir un indice por Nombre y estar seleccionado (el método busca si hay un SET ORDER establecido) 
*!*	Fijarse bien el nombre del TextBox y del Grid para invocar el método SetFocus (en el ejemplo Grid1 y Text1) 
*!*	Fijarse el alias de la tabla del grid (en el ejemplo MiTabla) 
*!*	Conviene que los nombres estén en mayúsculas y añadir en la propiedad Format del TextBox = ! para que sean ingresados en mayúsculas 
*!*	Conviene que la propiedad del Grid RecordMark = .T. para que se vea el registro marcado, o manejar el color del registro seleccionado 

*!*	LIMITAR UN CAMPO MEMO
*!*	Como limitar la entrada de un campo memo a X lineas. De Ken Weber. 
*!*	Simplemente hay que poner en el keypress lo siguiente: 
*!*	LPARAMETERS nKeyCode, nShiftAltCtrl
*!*	IF nkeycode = 13
*!*	 IF OCCURS(chr(13),this.value) >=5
*!*	 NODEFAULT
*!*	 ENDIF
*!*	ENDIF
*!*	En este ejemplo se limita a 6 lineas.

*!*	El modelo de objetos de Outlook es muy rico y poderoso. Esta interfaz está disponible como un servidor de automatización, o sea, que todo lo podemos automatizar mediante programación desde Visual FoxPro. 
*!*	Enviar y leer correo con Outlook desde Visual FoxPro
*!*	El modelo de objetos de Outlook es muy rico y poderoso. Esta interfaz está disponible como un servidor de automatización, o sea, que todo lo podemos automatizar mediante programación desde Visual FoxPro.
*!*	Un breve ejemplo
*!*	Una de las tareas más fácil de automatizar en Outlook es el envío de un correo. Veremos un ejemplo de solamente unas pocas líneas.
*!*	Lo primero que debemos hacer para automatizar Outlook, es crear un objeto Outlook. Una vez creado el objeto, debemos acceder al origen de los datos, pero esto no lo logramos en forma directa, debemos crear un objeto "NameSpace" apropiado que actuará como entrada (en este ejemplo MAPI). El objeto NameSpace proporciona entre otros, los métodos Logon y Logoff.
*!*	LOCAL lcPerfil AS CHARACTER, lcContrasenia AS CHARACTER , ;
*!*	lcDestinatario AS CHARACTER, lcTema AS CHARACTER , ;
*!*	lcCuerpo AS CHARACTER
*!*	LOCAL loOutlook AS "Outlook.Application", ;
*!*	loNameSpace AS OBJECT, loMailItem AS OBJECT
*!*	#DEFINE LF_CR CHR(10)+CHR(13)

*!*	*-- Datos del Mail
*!*	lcPerfil = "Prueba"
*!*	lcContrasenia = "prueba"
*!*	lcDestinatario = "prueba@portalfox.com"
*!*	lcTema = "Prueba: " + TTOC(DATETIME())
*!*	lcCuerpo = "Prueba enviando un mail desde Visual FoxPro." + LF_CR
*!*	lcCuerpo = lcCuerpo + "Saludos." + LF_CR

*!*	*-- Creo objetos Outlook y NameSpace
*!*	loOutlook = CREATEOBJECT("Outlook.Application")
*!*	loNameSpace = loOutlook.GetNameSpace("MAPI")

*!*	*-- Ejecuto los métodos
*!*	loNameSpace.Logon(lcPerfil , lcContrasenia)
*!*	loMailItem = loOutlook.CreateItem(0)
*!*	loMailItem.Recipients.ADD(lcDestinatario)
*!*	loMailItem.Subject = lcTema
*!*	loMailItem.Body = lcCuerpo
*!*	loMailItem.Send
*!*	loNameSpace.Logoff

*!*	loNameSpace = .NULL.
*!*	loOutlook = .NULL.
*!*	Problemas de seguridad
*!*	Outlook XP y Outlook 2000 SP2, incluyen los parches de seguridad de Microsoft. Estos parches restringen, entre otras cosas, el acceso a la libreta de direcciones y el envío de correo mediante automatización, con el fin de evitar códigos maliciosos que toman los datos de nuestra libreta de direcciones y envían correo sin nuestro consentimiento.
*!*	Cuando intentamos enviar un correo desde Visual FoxPro, se nos presenta el siguiente cuadro de dialogo, que luego de 5 segundos habilita el botón "Si".

*!*	Cuando intentamos acceder a la libreta de direcciones aparece el cuadro de dialogo el cual nos permitirá un acceso inmediato, o de 1, 2, 5, ó 10 minutos que debemos seleccionar.

*!*	¿Cómo solucionamos este problema?
*!*	Estas son algunas de las opciones que disponemos nosotros para trabajar con estos parches de seguridad:
*!*	Mantener la versión de Office 2000 SR-1 y no actualizarla ni instalarle parches de seguridad, con los peligros que esto significa. 
*!*	Si se tienen Outlook y Exchange instalados, el administrador de Exchange, puede disminuir las alertas o registrar algunas aplicaciones como seguras. 
*!*	Outlook Redemption: Es un objeto COM que se adapta fácilmente a la automatización y utiliza la MAPI extendida. Esta DLL fue escrita por Dmitry Streblechenko (MS Outlook MVP) y esta disponible en http://www.dimastr.com/redemption. Este es un producto comercial con un valor de U$S 200 aproximadamente. Existe para descarga una versión libre con fines de desarrollo. 
*!*	Express ClickYes: Es un pequeño programa residente que se maneja mediante la API de Windows. Este "presionará" el botón "Si" antes de que el dialogo aparezca. Este programa es gratis y esta disponible en http://www.express-soft.com/mailmate/clickyes.html. En el mismo sitio existe un ejemplo para Visual FoxPro. 
*!*	El formulario de ejemplo
*!*	En este ejemplo utilizaremos un formulario con un objeto PageFrame con dos Páginas, una para enviar correo y la otra para leer los correos desde la Bandeja de Entrada.
*!*	La siguiente figura es la página para el envío de un correo.

*!*	Esta otra figura nos muestra la página para la lectura de la bandeja de entrada.

*!*	En el método Init() creamos una instancia de la clase cOutlook con la sentencia:
*!*	THISFORM.oCorreo = NEWOBJECT('cOutlook','cOutlook.prg')
*!*	Creamos el servidor de automatización con:
*!*	THISFORM.oCorreo.CrearServidor()
*!*	El método CrearServidor() establece una referencia a la instancia de Outlook en la propiedad oOutlook. En este método también creamos un objeto NameSpace que nos permitirá acceder a las carpetas especiales de Outlook.
*!*	También en el Init() del formulario, llamamos a otro formulario para el inicio de sesión de Outlook:
*!*	*-- Formulario de inicio de sesión
*!*	DO FORM Inicio WITH THISFORM.oCorreo TO llAceptar
*!*	IF NOT (llAceptar AND THISFORM.oCorreo.IniciarSesion())
*!*	MESSAGEBOX('Falló el inicio sesión', 48, 'Inicio de sesión')
*!*	RETURN .F.
*!*	ENDIF
*!*	Enviar un correo
*!*	Antes de invocar el método EnviarCorreo(), configuramos todas las propiedades necesarias para el envío de correo. Esto lo hacemos en el método Click() del botón "Enviar".
*!*	*-- Armo el mensaje
*!*	WITH THISFORM.oCorreo
*!*	 .CargarVector(THIS.PARENT.txtTo.VALUE, 'aTO')
*!*	 .CargarVector(THIS.PARENT.txtCC.VALUE, 'aCC')
*!*	 .CargarVector(THIS.PARENT.txtAdjunto.VALUE, 'aAdjuntos')
*!*	 .cTema = ALLTRIM(THIS.PARENT.txtTema.VALUE)
*!*	 .cCuerpo = ALLTRIM(THIS.PARENT.edtCuerpo.VALUE)
*!*	 IF .EnviarCorreo()
*!*	 MESSAGEBOX('Mensaje enviado con éxito.', 64, 'Aviso')
*!*	 THISFORM.LimpiarPagina()
*!*	 ELSE
*!*	 MESSAGEBOX('No se pudo enviar el mensaje.', 48, 'Problemas')
*!*	 ENDIF
*!*	ENDWITH
*!*	RETURN
*!*	En el llamado del método EnviarCorreo() de la clase cOutlook es donde se crea un nuevo mensaje y se arma según las propiedades anteriormente configuradas.
*!*	Leer los correos
*!*	Para leer los correos de la bandeja de entrada invocamos el método LeerMensajes() de la clase cOutlook desde el método Click() del botón "Leer".
*!*	ZAP IN curMsg
*!*	IF THISFORM.oCorreo.LeerMensajes(THIS.PARENT.opgTipo.VALUE = 1, 'curMsg')
*!*	 GO TOP IN curMsg
*!*	 THIS.PARENT.grdMensajes.SETFOCUS
*!*	ELSE
*!*	 MESSAGEBOX('No existen mensajes para traer', 64, 'Aviso')
*!*	ENDIF
*!*	THIS.PARENT.edtCuerpo.REFRESH
*!*	En la llamada al método LeerMensajes() creamos un objeto loInbox y traemos todos los mensajes, o solo los mensajes "No leídos" y recorremos uno a uno para cargarlos en un cursor que luego mostraremos en una Cuadrícula y un Cuadro de Edición.
*!*	Definición de la clase cOutlook
*!*	En este ejemplo disponemos de una clase definida por el usuario, llamada cOutlook con los distintos métodos para realizar el envío y la lectura de los correos. La definición de esta clase es la siguiente:
*!*	DEFINE CLASS cOutlook AS CUSTOM
*!*	 *-- Propiedades
*!*	 oOutlook = .NULL.
*!*	 oNameSpace = .NULL.
*!*	 cPerfil = ''
*!*	 cContrasenia = ''
*!*	 cTema = ''
*!*	 cCuerpo = ''
*!*	 DIMENSION aTo(1) AS CHARACTER
*!*	 DIMENSION aCC(1) AS CHARACTER
*!*	 DIMENSION aBCC(1) AS CHARACTER
*!*	 DIMENSION aAdjuntos(1) AS CHARACTER
*!*	 *--------------------------------------------------
*!*	 * Creo el servidor de automatización
*!*	 *--------------------------------------------------
*!*	 PROCEDURE CrearServidor()
*!*	 LOCAL loErr1 AS EXCEPTION, loErr2 AS EXCEPTION, llRet AS Logical
*!*	 WITH THIS
*!*	 *-- Manejo el error con TRY ... CATH ... FINALLY
*!*	 TRY
*!*	 *-- Instancio el objeto
*!*	 .oOutlook = GETOBJECT( , 'Outlook.Application')
*!*	 WAIT WINDOW 'Ya existe una instancia de Outlook...' TIMEOUT 2
*!*	 CATCH TO loErr1
*!*	 TRY
*!*	 *-- Creo el objeto
*!*	 .oOutlook = CREATEOBJECT('Outlook.Application')
*!*	 WAIT WINDOW 'Nueva instancia de Outlook...' TIMEOUT 2
*!*	 CATCH TO loErr2
*!*	 MESSAGEBOX('Microsoft Outlook no está instalado.', 16, 'Problemas!!!')
*!*	 FINALLY
*!*	 ENDTRY
*!*	 FINALLY
*!*	 ENDTRY
*!*	 IF VARTYPE(.oOutlook) = 'O'
*!*	 .oNameSpace = .oOutlook.GetNameSpace('MAPI')
*!*	 IF VARTYPE(.oNameSpace) = 'O'
*!*	 llRet = .T.
*!*	 ENDIF
*!*	 ENDIF
*!*	 ENDWITH
*!*	 RETURN llRet
*!*	 ENDPROC
*!*	 *--------------------------------------------------
*!*	 * Cierro el servidor de automatización
*!*	 *--------------------------------------------------
*!*	 PROCEDURE CerrarServidor()
*!*	 THIS.oOutlook.QUIT()
*!*	 RETURN
*!*	 ENDPROC
*!*	 *--------------------------------------------------
*!*	 * Iniciar sesion
*!*	 *--------------------------------------------------
*!*	 PROCEDURE IniciarSesion()
*!*	 LOCAL llRet AS Logical
*!*	 TRY
*!*	 THIS.oNameSpace.Logon(THIS.cPerfil, THIS.cContrasenia)
*!*	 llRet = .T.
*!*	 CATCH
*!*	 *-- No pudo iniciar sesión
*!*	 llRet = .F.
*!*	 FINALLY
*!*	 ENDTRY
*!*	 RETURN llRet
*!*	 ENDPROC
*!*	 *--------------------------------------------------
*!*	 * Cerrar sesion
*!*	 *--------------------------------------------------
*!*	 PROCEDURE CerrarSesion()
*!*	 THIS.oNameSpace.Logoff()
*!*	 RETURN
*!*	 ENDPROC
*!*	 *--------------------------------------------------
*!*	 * Envio el correo
*!*	 *--------------------------------------------------
*!*	 PROCEDURE EnviarCorreo()
*!*	 LOCAL loMensaje AS OBJECT, llRet AS Logical
*!*	 LOCAL lnI AS INTEGER, lnIndex AS INTEGER
*!*	 *-- Creo un nuevo mensaje
*!*	 WITH THIS
*!*	 loMensaje = .oOutlook.CreateItem(0)
*!*	 IF VARTYPE(loMensaje) = 'O'
*!*	 loMensaje.Subject = .cTema
*!*	 loMensaje.Body = .cCuerpo
*!*	 *-- Recipientes
*!*	 lnIndex = 0
*!*	 *-- TO
*!*	 lnLen = ALEN(.aTO)
*!*	 FOR lnI = 1 TO lnLen
*!*	 IF NOT EMPTY(.aTO(lnI))
*!*	 lnIndex = lnIndex + 1
*!*	 loMensaje.Recipients.ADD(.aTO(lnI))
*!*	 loMensaje.Recipients(lnIndex).TYPE = 1
*!*	 ENDIF
*!*	 ENDFOR
*!*	 *-- CC
*!*	 lnLen = ALEN(.aCC)
*!*	 FOR lnI = 1 TO lnLen
*!*	 IF NOT EMPTY(.aCC(lnI))
*!*	 lnIndex = lnIndex + 1
*!*	 loMensaje.Recipients.ADD(.aCC(lnI))
*!*	 loMensaje.Recipients(lnIndex).TYPE = 2
*!*	 ENDIF
*!*	 ENDFOR
*!*	 *-- BCC
*!*	 lnLen = ALEN(.aBCC)
*!*	 FOR lnI = 1 TO lnLen
*!*	 IF NOT EMPTY(.aBCC(lnI))
*!*	 lnIndex = lnIndex + 1
*!*	 loMensaje.Recipients.ADD(.aBCC(lnI))
*!*	 loMensaje.Recipients(lnIndex).TYPE = 3
*!*	 ENDIF
*!*	 ENDFOR
*!*	 *-- Adjuntos
*!*	 lnLen = ALEN(.aAdjuntos)
*!*	 FOR lnI = 1 TO lnLen
*!*	 IF NOT EMPTY(.aAdjuntos(lnI)) AND FILE(.aAdjuntos(lnI))
*!*	 loMensaje.Attachments.ADD(.aAdjuntos(lnI))

*!*	 ENDIF
*!*	 ENDFOR
*!*	 llRet = loMensaje.SEND
*!*	 ELSE
*!*	 llRet = .F.
*!*	 ENDIF
*!*	 ENDWITH
*!*	 RETURN llRet
*!*	 ENDPROC
*!*	 *--------------------------------------------------
*!*	 * Lee los mensajes según parámetro
*!*	 *--------------------------------------------------
*!*	 PROCEDURE LeerMensajes(tlNoLeidos, tcAlias)
*!*	 LOCAL loInbox AS 'Outlook.MAPIFolder', loMensajes AS 'Outlook.Items'
*!*	 LOCAL loMsg AS OBJECT, lnI AS INTEGER, llRet AS Logical
*!*	 IF EMPTY(tcAlias)
*!*	 tcAlias = 'curMsg'
*!*	 ENDIF
*!*	 *-- Inbox
*!*	 loInbox = THIS.oNameSpace.GetDefaultFolder(6)
*!*	 *-- Mensajes del Inbox
*!*	 IF tlNoLeidos
*!*	 loMensajes = loInbox.Items.RESTRICT("[Unread] = True")
*!*	 ELSE
*!*	 loMensajes = loInbox.Items
*!*	 ENDIF
*!*	 IF VARTYPE(loMensajes) = 'O'
*!*	 WITH loMensajes
*!*	 IF .COUNT > 0
*!*	 *-- Recorro los mensajes
*!*	 FOR lnI = 1 TO .COUNT
*!*	 loMsg = .ITEM(lnI)
*!*	 WITH loMsg
*!*	 INSERT INTO (tcAlias) (EnviadoPor, Tema, Recibido, Cuerpo, NoLeido) ;
*!*	 VALUES (.SenderName, .Subject, .ReceivedTime, .Body, .UnRead)
*!*	 ENDWITH
*!*	 ENDFOR
*!*	 llRet = .T.
*!*	 ELSE
*!*	 llRet = .F.
*!*	 ENDIF
*!*	 ENDWITH
*!*	 ELSE
*!*	 llRet = .F.
*!*	 ENDIF
*!*	 RETURN llRet
*!*	 ENDPROC
*!*	 *--------------------------------------------------
*!*	 * Destroy
*!*	 *--------------------------------------------------
*!*	 PROCEDURE DESTROY()
*!*	 WITH THIS
*!*	 .oNameSpace = .NULL.
*!*	 .oOutlook = .NULL.
*!*	 ENDWITH
*!*	 ENDPROC
*!*	 *--------------------------------------------------
*!*	 * Cargo una Matriz con los destinatarios
*!*	 *--------------------------------------------------
*!*	 PROCEDURE CargarVector(tcTexto, tcVector)
*!*	 LOCAL ln AS INTEGER, lnI AS INTEGER, la(1) AS CHARACTER
*!*	 IF EMPTY(tcTexto)
*!*	 RETURN 0
*!*	 ENDIF
*!*	 tcTexto = CHRTRAN(tcTexto,',',';')
*!*	 ln = ALINES(la, tcTexto, .T., ';')
*!*	 lcV = "This." + tcVector
*!*	 DIMENSION &lcV.(ln)
*!*	 FOR lnI = 1 TO ln
*!*	 &lcV.(lnI) = la(lnI)
*!*	 ENDFOR
*!*	 RETURN ln
*!*	 ENDPROC
*!*	ENDDEFINE && Clase cOutlook
*!*	A la definición de la clase, como así también los formularios, y el ejemplo los podemos descargar del siguiente vínculo: outlook.zip para su evaluación. Los ejemplos están realizados con Visual FoxPro 8 y Outlook 2002 (Outlook XP).
*!*	Una forma fácil de crear un formulario por código como un explorador de internet. 
*!*	PUBLIC oForm
*!*	oForm = NEWOBJECT("MiExplorador")
*!*	oForm.SHOW
*!*	DEFINE CLASS MiExplorador AS FORM
*!*	 TOP = 0
*!*	 LEFT = 0
*!*	 DOCREATE = .T.
*!*	 CAPTION = "PortalFox :: Nada corre como un zorro"
*!*	 WINDOWSTATE = 0
*!*	 NAME = "Form1"
*!*	 WIDTH = 800
*!*	 HEIGHT = 600
*!*	 ADD OBJECT olecontrol1 AS OLECONTROL WITH ;
*!*	 TOP = 10, ;
*!*	 LEFT = 10, ;
*!*	 WIDTH = 780, ;
*!*	 HEIGHT = 580, ;
*!*	 NAME = "Olecontrol1", ;
*!*	 OLECLASS = "Shell.Explorer.2"
*!*	 PROCEDURE RESIZE
*!*	 THIS.olecontrol1.HEIGHT = THIS.HEIGHT - 20
*!*	 THIS.olecontrol1.WIDTH = THIS.WIDTH - 20
*!*	 ENDPROC
*!*	 PROCEDURE olecontrol1.REFRESH
*!*	 NODEFAULT
*!*	 ENDPROC
*!*	 PROCEDURE olecontrol1.INIT
*!*	 THIS.NAVIGATE("http://www.portalfox.com")
*!*	 ENDPROC
*!*	ENDDEFINE

*!*	MOSTRAR UNA PAGINA WEB DESDE TU PROGRAMA DE VFP
*!*	Una mas sobre las Fox Foundation Classes, en esta ocasión, cómo mostrar una pagina Web en un formulario de Visual FoxPro.
*!*	Pueden revisar las Fox Foundation Classes (FFCs) para saber cómo funciona: Utilities -> Component Gallery -> Internet -> Web Broser Control Un ejemplo sencillo sobre esto: 
*!*	loBrowser=NEWOBJECT("_webform",HOME()+"gallery\_webview") 
*!*	loBrowser.olewebBROWSER.Navigate2("http://www.portalfox.com") 
*!*	loBrowser.Show(1)

*!*	NUMERACION DE PAGINAS EN INFORMES CON CAMPOS MEMO
*!*	En la función de Rafael Angel Ponce Yllanes se tiene el detalle de los campos Memo, lo único que modifique es el NOCONSOLE por el NOWAIT, ... 
*!*	...con este cambio aun cuando haya campos memos y estos excedan su longitud (la pagina actual), me sale la numeración correctamente. El único detalle es el parpadeo cuando se lanza el report por primera vez, pero prefiero esto a una numeración incorrecta. 
*!*	************************************************************
*!*	* Función: report_contarpaginas
*!*	* Devuelve el número de paginas de un report
*!*	* Parametros:
*!*	* Nombre del report
*!*	* Ejemplos:
*!*	* lntotpaginas = report_contapaginas("minforme")
*!*	* Retorno:
*!*	* El numero de paginas del informe.
*!*	* Notas:
*!*	* Creación : 08/09/1999 PRR
*!*	* Ultima Modificación: 14/04/2000 RAPY Rafael Angel Ponce Yllanes
*!*	* Ultima Modificación: 28/07/2004 LINCEITZ Pablo Alvarez G.
*!*	************************************************************
*!*	FUNCTION report_contarpaginas(lc_report)
*!*	 LOCAL nPaginas
*!*	 nPaginas = 0
*!*	 DEFINE WINDOW x FROM 1,1 TO 2,2
*!*	 ACTIVATE WINDOW x NOSHOW
*!*	 REPORT FORM (lc_report) NOWAIT
*!*	 nPaginas = _PAGENO
*!*	 RELEASE WINDOW x
*!*	 RETURN npaginas
*!*	ENDFUNC
*!*	************************************************************

*!*	IMPLEMENTAR UN VISOR DE TEXTO
*!*	Si deseas mostrar un buen visor de textos que puedes implementar en tus aplicaciones, te damos la manera mas sencilla y con apariencia bastante profesional...
*!*	Una vez más utilizaremos una clase de las que vienen en las Fox Foundation Classes (FFCs) de Visual FoxPro, en esta ocasión haremos una SubClase basada en _ShowText de la librería de clases _Reports.vcx, para de ésta manera hacerlo mas beneficioso a nuestro propósito. 
*!*	oForm=CREATEOBJECT("MyTextEditor",GETFILE(),"Editando Archivo",2)
*!*	oForm.SHow(1)
*!*	DEFINE CLASS myTextEditor as _showtext OF (HOME(1)+"ffc\_reports.vcx")
*!*	 PROCEDURE INIT
*!*	 LPARAMETERS tcSourceFile,; && Path del archivo a Mostrar
*!*	 tcCaption,; Título de la Venta 
*!*	 tnWindowState && Estado de la ventana, Normal = 0, Minimizado = 1 , Maximizado =2
*!*	 DODEFAULT(tcSourceFile)
*!*	 WITH This
*!*	 .Caption = IIF(VARTYPE(tcCaption)='C' AND !EMPTY(tcCaption),tcCaption,"Visor de Texto")
*!*	 .WindowState=IIF(VARTYPE(tnWindowState)='N' AND INLIST(tnWindowState,0,1,2),tnWindowState,0)
*!*	 .cmdClose.Caption="Cerrar"
*!*	 .cmdSave.Caption="Guardar como"
*!*	 .cmdFonts.Caption="Fuentes"
*!*	 .chkReadOnly.Caption="Sólo lectura"
*!*	 ENDWITH 
*!*	 ENDPROC 
*!*	 PROCEDURE Activate
*!*	 This.Resize() 
*!*	 DODEFAULT()
*!*	 ENDPROC 
*!*	ENDDEFINE 

*!*	Como idea adicional, podrías utilizar tu propio método para generar un reporte o mandar tu reporte a ASCII (REPORT FORM < TuReporte > TO FILE ASCII ) , pasarlo a archivo y mostrarlo.... 
*!*	lcFile = SYS(2015)+".txt"
*!*	OPEN DATABASE HOME(2)+"data\testdata.dbc"
*!*	SET TEXTMERGE ON
*!*	SET TEXTMERGE TO (lcFile) NOSHOW
*!*	lcTitle="Reporte de Clientes"
*!*	IF !USED("Customer")
*!*	 USE Customer IN 0
*!*	ENDIF 
*!*	SELECT Customer
*!*	\< < PADC(lcTitle,80," ") > >

*!*	\Clave < < PADC("Compañia",40," ") > > Contacto
*!*	SCAN
*!*	 \< < Cust_id > > < < Company > > < < Contact > > 
*!*	ENDSCAN
*!*	SET TEXTMERGE TO
*!*	SET TEXTMERGE OFF
*!*	oForm=CREATEOBJECT("MyTextEditor",lcFile,lcTitle,2)
*!*	oForm.Show(1)
*!*	DELETE FILE (lcFile)
*!*	CLOSE TABLES all
*!*	CLOSE DATABASES all
*!*	Nota: Por cuestiones de codificacion HTML tuve que poner espacios entre los mayor-que, menor-que < < > > de la sección TEXTMERGE, quitelos para que funcione correctamente. Nota2: Revise el archivo _reports.h que se localiza en el mismo directorio de la librería de clases, con él se pueden configurar mas opciones de la clase.

*!*	PREVIEW EN FORMA MAXIMIZADA Y CON DIALOGO DE IMPRESIÓN
*!*	Preview en forma maximizada y con diálogo de impresión, mucho más fácil y en una sola línea... 
*!*	Esta línea de código me pareció muy buena, lo único que solo funciona de la versión 6.0 en adelante... 
*!*	KEYBOARD '{CTRL+F10}' PLAIN CLEAR
*!*	REPORT FORM tureporte NOCO TO PRINTER PROMPT PREV

*!*	INFORME CON VISTA PREVIA MAXIMIZADA
*!*	 Solo hay que hacer ... 
*!*	Esto antes de lanzar el REPORT PREVIEW KEYBOARD "{CTRL+F10}"

*!*	Conocer el número de paginas totales de un informe
*!*	************************************************************
*!*	*
*!*	* Clase: report_contarpaginas
*!*	*
*!*	* Devuelve el número de paginas de un report
*!*	*
*!*	* Parametros:
*!*	*
*!*	* Nombre del report
*!*	*
*!*	* Ejemplos:
*!*	*
*!*	* lntotpaginas = report_contapaginas("minforme") 
*!*	*
*!*	* Retorno
*!*	*
*!*	* El numero de paginas del informe.
*!*	*
*!*	* Nota
*!*	*
*!*	*
*!*	* Creación : 08/09/1999 PRR
*!*	* Ultima Modificación: 14/04/2000 RAPY Rafael Angel Ponce Yllanes
*!*	*
*!*	************************************************************
*!*	PARAMETERS lc_report
*!*	LOCAL nPaginas
*!*	nPaginas = 0

*!*	DEFINE WINDOW x FROM 1,1 TO 2,2
*!*	ACTIVATE WINDOW x NOSHOW
*!*	REPORT FORM (lc_report) NOCONSOLE
*!*	nPaginas = _PAGENO
*!*	RELEASE WINDOW x
*!*	RETURN npaginas

*!*	NOTA: gracias a Jose Luis Santana Blasco y a Rafael Angel Ponce Yllanes
*!*	por la aclaración del NOCONSOLE, con esto se mejora mucho la velocidad.

*!*	Nota: Se ha reportado que con Campos MEMO, si se utiliza la propiedad STRETCH WITH OVERFLOW suelen ocurrir resultados inesperados

*!*	Obtener la dirección IP local de la maquina.
*!*	loSock = CREATEOBJECT('MSWinsock.Winsock.1')
*!*	? loSock.LocalIP
*!*	loSock = .NULL.

*!*	COMPRIMIR ARCHIVOS CON WINRAR
*!*	 Has deseado tener un programa en donde este archivado todas las rutas de carpetas a comprimir y con especificaciones de tipos de archivos y una ruta de almacenamiento, y solo dar un click para iniciar el proceso de respaldo. 
*!*	*** crea un tabla que contenga la ruta de almacenamiento, en donde se almacenaran tus respaldos *** ejemplo: resplado.dbf, con el campo "Almacena" y guardar "e:\backup" *** crea una tabla que tenga los nombre y rutas de las carpetas a respaldar y un campo que *** guarde las extensiones, puedes agregar multiples registros de carpetas a respaldar *** Ejemplo : directorio.dbf con el campos: ruta y extension ambos de tipo caracter *** Ejemplo : ruta = "c:\mis documentos\" *** Ejemplo : extension = "*.doc *.xls *.dbf *.ppt" o bien "*.*", al poner multiples extensiones solo separarlas con espacio 
*!*	*** inicio ***
*!*	USE Respaldo
*!*	wAlmacena=RESPALDO.ALMACENA

*!*	USE DIRECTORIO
*!*	*** GENERA LOS NOMBRES DE LOS RESPALDOS AUTOMATICAMENTE
*!*	*** Y LE AGREGA FECHA PARA NO SOBRE ESCRIBIRLOS
*!*	REPLACE ALL NOMBRE WITH +RIGHT(SYS(2015),8)+'_'+RIGHT(DTOS(DATE()),6)
*!*	GO TOP
*!*	*** INICIO DE LA GENERACION DE ARCHIVOS RAR
*!*	SCAN ALL
*!*	 ZRUTA=ALLTRIM(RUTA)+'\'+ALLTRIM(EXTENSION)
*!*	 ZSAV=ALLTRIM(wAlmacena)+'\'+ALLTRIM(NOMBRE)+'.RAR'+' '+ZRUTA
*!*	 ! /N7 RAR a -r -s &ZSAV
*!*	ENDSCAN
*!*	***

*!*	REDONDEAR A 5 CENTAVOS POR ARRIBA
*!*	 Esta función es muy útil para establecimientos donde las monedas de centavos ya no se usan tan frecuentemente y/o por comodidad se cobra 5 centavos arriba, es decir: $145.02 se convierte en $145.05, $145.07 se convierte en $145.10. 
*!*	function redondeoacincocentimos
*!*	 lparameters m.nValor
*!*	 return ceiling(m.nvalor * 20) / 20
*!*	endfunc

*!*	INSERTAR REGISTRO EN UNA POSICION
*!*	Cuantas veces no hemos querido ingresar un registro en blanco en alguna posicion especifica de una tabla ? 
*!*	Esta es una manera muy simple de hacerlo: 
*!*	GO 3
*!*	INSERT BLANK BEFORE
*!*	Te aconsejo no intentar este tipo de manejos sobre tablas medianas o grandes, ya que es muy lento y además necesitas abrir la tabla en forma exclusiva. 
*!*	 Publicado por jgpg07  en 4/30/2007 08:06:00 PM 
*!*	 3 comentarios: 
*!*	 Anónimo dijo... 

*!*	 Muy interesante los trucos. Como hago cuando window no refresca un formulario, y al mover el formulario muestra el escritorio quedando como tildado el formulario, pero no lo esta??

*!*	Franco 
*!*	 31 de julio de 2008 07:59 
*!*	 Manuel Vic dijo... 

*!*	 interesantes tus anotaciones. A ver si te ha pasado algo como esto, en mi sistema genero notas de ventas, todo funciona bien hasta que se usa impresoras Oki o Star (miniprinter),Si imprimen pero todo invertido, es decir los datos del cliente aparecen hasta abajo y el detalle de la nota arriba, tienes alguna solucion??. 

*!*	Manuel 
*!*	 23 de febrero de 2011 15:12 
*!*	 Jaime Matheus dijo... 

*!*	 Muy interesantes procedimientos y todo en un solo sitio, espero que lo sigan actualizando, los que alcance a probar realmente funcionan

*!*	Jaime Matheus, Bogota Col. 
*!*	 24 de agosto de 2011 11:48 

*!*	Publicar un comentario 
*!*	Entrada antigua 
*!*	Página Principal 
*!*	 Suscribirse a: Comentarios de la entrada (Atom) 
*!*	Barra de video			
*!*	con la tecnología de	


*!*	Suscribirse a
*!*	 Entradas 
*!*	 Comentarios 
*!*	Jaime Peña - Desarrollo de Software a la medida de su Empresa
*!*	@rrobaypunto
*!*	http://jgpg07.googlepages.com
*!*	http://www.jgpg07.tk
*!*	Acerca de mí
*!*	 jgpg07 
*!*	Ver mi perfil completo 
*!*	Buscar este blog	
*!*		con la tecnología de	

*!*	Apple  Google  Microsoft
*!*	Apple será vecina de Facebook
*!*	ITespresso.es
*!*	Tras la apuesta por la nube realizada por Apple con iCloud, la necesidad de tener nuevos centros de datos es cada vez más intensa. De hecho, la compañía estaría considerando comprar un terreno de más de 60 hectáreas en Prineville, en el estado de ...
*!*	Artículos relacionados »
*!*	Apple pierde un juicio contra Samsung por sus móviles Galaxy
*!*	MeriStation
*!*	Samsung Electronics, la mayor fabricante de teléfonos móviles, ha visto como sus acciones han aumentado en el mercado coreano tras ganar un litigio contra Apple. Un juzgado americano desestimó la petición de Apple de prohibir las ventas de los ...
*!*	Artículos relacionados »
*!*	Apple abre una tienda en la emblemática Estación Central de Nueva York
*!*	Lanacion.com (Argentina)
*!*	La tienda de Apple frente al imponente hall de la Estación Central de Nueva York. Foto: Gentileza messagingrobot / Flickr Destacados por su diseño, Apple planea romper el molde de los anteriores puntos de venta con la apertura de su tienda en un ...
*!*	Artículos relacionados »
*!*	McAfee: “Apple iOS es más seguro que Android”
*!*	ITespresso.es
*!*	En la lucha contra el malware Apple iOS supera a Android como entorno más seguro, lo que no quiere decir que los dispositivos móviles que lo integran estén libres de riesgo. Un informe publicado por la empresa de seguridad McAffe, propiedad de Intel ...
*!*	Artículos relacionados »con la tecnología de	

*!*	 
*!*	Seguidores

*!*	 
*!*	 