**********************************************************
* Fecha de modificaci�n: Agosto 12 de 2000
*
* Crear un gr�fico en Ms Graph 8.0  con Fox y Ole
*
* Se pretende Seleccionar:
*     1. El color para el titulo de los ejes x,y.
*     2. El color para el r�tulo de datos.
*     3. El color para ajustar el color interior de cada serie del conjunto
*
*
**********************************************************

PUBLIC Grafico, TxtColorTitulos, TxtColorRotulos, TxtColorInterior

TxtColorTitulos  = 16711680 && Color para los titulos por defecto (Azul)
TxtColorRotulos  = 255 && Color para los titulos por defecto (Rojo)
TxtColorInterior = 65408  && Color para los titulos por defecto (Verde)

Grafico = CREATEOBJECT('Form')  && Crea un formulario.
Grafico.CAPTION    = "Gr�ficos con Fox y MS Graph 8.0"
Grafico.HEIGHT     = 160
Grafico.WIDTH      = 290
Grafico.AUTOCENTER = .T.

Grafico.ADDOBJECT('cmdColorTitulos', 'cmdColorTitulos')	&& Bot�n Color.
Grafico.ADDOBJECT('cmdColorRotulos', 'cmdColorRotulos')	&& Bot�n R�tulos.
Grafico.ADDOBJECT('cmdColorInterior','cmdColorInterior')&& Bot�n Interior.
Grafico.ADDOBJECT('cmdGraficar',     'cmdGraficar')		&& Bot�n Graficar.

Grafico.cmdColorTitulos.VISIBLE  = .T.  && Bot�n Color visible.
Grafico.cmdColorRotulos.VISIBLE  = .T.  && Bot�n Color visible.
Grafico.cmdColorInterior.VISIBLE = .T.  && Bot�n Color visible.
Grafico.cmdGraficar.VISIBLE      = .T.  && Bot�n Grafico visible.

Grafico.SHOW  && Muestra el formulario.

*READ EVENTS  && Inicia el procesamiento de eventos.

DEFINE CLASS cmdColorTitulos AS COMMANDBUTTON  && Crea un bot�n de comando.
	CAPTION   = 'Color Titulos...'  && T�tulo del bot�n de comando.
	LEFT      = 50  				&& Columna del bot�n de comando.
	TOP       = 25 					&& Fila del bot�n de comando.
	HEIGHT    = 25  				&& Alto del bot�n de comando.
	WIDTH     = 200   		 		&& Ancho del bot�n de comando.
	FORECOLOR = RGB(0,0,255)  		&& Color Azul

	PROCEDURE CLICK
		TxtColorTitulos = GETCOLOR()
		tnColor         = _Col2RGB(TxtColorTitulos)
		THISFORM.cmdColorTitulos.CAPTION   = 'Color Titulos...' + tnColor  && Modificar T�tulo del bot�n de comando.
		THISFORM.cmdColorTitulos.FORECOLOR = &tnColor
ENDDEFINE

DEFINE CLASS cmdColorRotulos AS COMMANDBUTTON  && Crea un bot�n de comando.
	CAPTION   = 'Color Rotulos... '	&& T�tulo del bot�n de comando.
	LEFT      = 50					&& Columna del bot�n de comando.
	TOP       = 60					&& Fila del bot�n de comando.
	HEIGHT    = 25					&& Alto del bot�n de comando.
	WIDTH     = 200					&& Ancho del bot�n de comando.
	FORECOLOR = RGB(255,0,0)  		&& Color Rojo

	PROCEDURE CLICK
		TxtColorRotulos = GETCOLOR()
		tnColor         = _Col2RGB(TxtColorRotulos)
		THISFORM.cmdColorRotulos.CAPTION   = 'Color Rotulosr...'+tnColor  && Modificar T�tulo del bot�n de comando.
		THISFORM.cmdColorRotulos.FORECOLOR = &tnColor
ENDDEFINE

DEFINE CLASS cmdColorInterior AS COMMANDBUTTON  && Crea un bot�n de comando.
	CAPTION   = 'Color Interior...'  && T�tulo del bot�n de comando.
	LEFT      = 50  && Columna del bot�n de comando.
	TOP       = 90  && Fila del bot�n de comando.
	HEIGHT    = 25  && Alto del bot�n de comando.
	WIDTH     = 200    && Ancho del bot�n de comando.
	FORECOLOR = RGB(0,255,0) && Color Verde

	PROCEDURE CLICK
		TxtColorInterior = GETCOLOR()
		tnColor          = _Col2RGB(TxtColorInterior)
		THISFORM.cmdColorInterior.CAPTION   =  'Color Interior...' + tnColor  && Modificar T�tulo del bot�n de comando.
		THISFORM.cmdColorInterior.FORECOLOR = &tnColor
		THISFORM.cmdColorInterior.REFRESH
ENDDEFINE

DEFINE CLASS cmdGraficar AS COMMANDBUTTON  && Crea un bot�n de comando.
	CAPTION = 'Procesar Grafico...'  && T�tulo del bot�n de comando.
	LEFT    = 50  && Columna del bot�n de comando.
	TOP     = 120  && Fila del bot�n de comando.
	HEIGHT  = 25  && Alto del bot�n de comando.
	WIDTH   = 200    && Ancho del bot�n de comando.
	PICTURE = "C:\graficos\Bmp\nubes.bmp"

	PROCEDURE CLICK
		WAIT WINDOWS "Espere por favor mientras procesa el gr�fico" NOWAIT
		x = TIME()
		PUBLIC pantalla
		pantalla = CREATEOBJECT("form")
		pantalla.HEIGHT     = 400
		pantalla.WIDTH      = 700
		pantalla.CAPTION    = "Grafico Ms Graph 8.0"
		pantalla.AUTOCENTER = .T.

		pantalla.ADDOBJECT("objeto", "olecontrol", "msgraph.chart.8")
		pantalla.objeto.TOP     = 0
		pantalla.objeto.LEFT    = 0
		pantalla.objeto.HEIGHT  = pantalla.HEIGHT
		pantalla.objeto.WIDTH   = pantalla.WIDTH
		pantalla.VISIBLE        = .T.
		pantalla.objeto.VISIBLE = .T.
		pantalla.LOCKSCREEN     = .T.

		** Definir el tipo de grafico -4100 es xl3DColumn
		pantalla.objeto.OBJECT.APPLICATION.chart.charttype = -4100

		** Definir las series que posee el grafico (en este caso una serie)
		pantalla.objeto.OBJECT.APPLICATION.datasheet.RANGE("00").VALUE = ""
		pantalla.objeto.OBJECT.APPLICATION.datasheet.RANGE("01").VALUE = "Ventas"

		** Llevar valores para la columna A
		pantalla.objeto.OBJECT.APPLICATION.datasheet.RANGE("A0").VALUE = "Enero"
		pantalla.objeto.OBJECT.APPLICATION.datasheet.RANGE("A1").VALUE = 24

		** Llevar valores para la columna B
		pantalla.objeto.OBJECT.APPLICATION.datasheet.RANGE("B0").VALUE = "Febrero"
		pantalla.objeto.OBJECT.APPLICATION.datasheet.RANGE("B1").VALUE = 48

		** Borrar las filas que est�n llenas por defecto por el graph y no se van a utilizar
		** si usted trabaja con 3 o m�s series no debe hacer lo siguiente.
		pantalla.objeto.OBJECT.APPLICATION.datasheet.ROWS("4").DELETE
		pantalla.objeto.OBJECT.APPLICATION.datasheet.ROWS("3").DELETE

		** Borrar las columnas que est�n llenas por defecto por el graph y no se van a utilizar
		** si usted trabaja con 4 o m�s columnas no debe hacer lo siguiente.
		pantalla.objeto.OBJECT.APPLICATION.datasheet.COLUMNS("5").DELETE
		pantalla.objeto.OBJECT.APPLICATION.datasheet.COLUMNS("4").DELETE

		** Cambiar el titulo del grafico
		pantalla.objeto.OBJECT.APPLICATION.chart.hastitle = .T.
		pantalla.objeto.OBJECT.APPLICATION.chart.charttitle.TEXT = "Ventas Bimestre"

		** Permite Modificar el color de las series con el color verde.
		pantalla.objeto.SeriesCollection(1).Interior.COLOR = TxtColorInterior && Seleccionado en el form.

		** Lo siguiente activa el r�tulo de datos del primer punto de la serie uno (1) del gr�fico,
		** y establece el texto del r�tulo de datos.
		WITH pantalla.objeto
			WITH .SeriesCollection(1).Points(1)
				.HasDataLabel         = .T.
				.DataLabel.TEXT       = 24 && Valor de la columna A1.
				.DataLabel.FONT.COLOR = TxtColorRotulos && Seleccionado en le form.
			ENDWITH
		ENDWITH

		** Lo siguiente activa el r�tulo de datos del segundo punto de la serie uno (1) del gr�fico,
		** y establece el texto del r�tulo de datos.
		WITH pantalla.objeto
			WITH .SeriesCollection(1).Points(2)
				.HasDataLabel         = .T.
				.DataLabel.TEXT       = 44 && Valor de la columna B1
				.DataLabel.FONT.COLOR = TxtColorRotulos && && Seleccionado en le form
			ENDWITH
		ENDWITH

		** Modificar titulo, tama�o, color y fuente del eje X.
		WITH pantalla.objeto.Axes(1)
			.hastitle = .T.
			WITH .AxisTitle
				.CAPTION    = "Meses"
				.FONT.NAME  = "bookman"
				.FONT.SIZE  = 20
				.FONT.COLOR = TxtColorTitulos && Color seleccionado en el form
			ENDWITH
		ENDWITH

		** Modificar titulo, tama�o, color y fuente del eje Y.
		WITH pantalla.objeto.Axes(2)
			.hastitle = .T.
			WITH .AxisTitle
				.CAPTION    = "Miles Pesos"
				.FONT.NAME  = "bookman"
				.FONT.SIZE  = 20
				.FONT.COLOR = TxtColorTitulos && Color seleccionado en el form.
			ENDWITH
		ENDWITH

		pantalla.LOCKSCREEN = .F.
		WAIT WINDOWS "Proceso terminado" NOWAIT
ENDDEFINE

*------------------------------------------------

FUNCTION _Col2RGB(tnColor)

	*------------------------------------------------
	* Pasa un n�mero de color a formato RGB.
	* USO: _Col2RGB(1547)
	* RETORNA: Caracter - "RGB(nR, nG, nB)"
	*------------------------------------------------

	LOCAL lcRGB, ln
	lcRGB = "RGB("
	FOR ln = 1 TO 3
		lcRGB = lcRGB + TRAN( tnColor % 256, "999" ) + IIF( ln = 3, "", "," )
		tnColor = INT( tnColor / 256 )
	ENDFOR
	lcRGB = lcRGB + ")"
	RETURN lcRGB
ENDFUNC


*****************    www.davphantom.com   ******************

*                www3.gratisweb.com/davphantom

* DVID AMADOR TAPIA
