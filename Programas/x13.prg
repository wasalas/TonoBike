miForm = CREATEOBJECT("Form")
miForm.AUTOCENTER = .T.
miForm.WIDTH = 400
miForm.HEIGHT = 300

miForm.ADDOBJECT("cmdGrafico", "boton")
miForm.ADDOBJECT("cmdSalir",   "boton")

*!*	miForm.cmdGrafico.left = 100
*!*	miForm.cmdGrafico.top = 50

*!*	miForm.cmdSalir.left = 250
*!*	miForm.cmdSalir.top = 50


miForm.SHOW
miForm.refresh



READ EVENTS


DEFINE CLASS cmdGrafico AS boton
	CAPTION = "Grafico"
	TOP     = 250
	LEFT    = 100

	PROCEDURE CLICK
		CLEAR EVENTS ALL
	ENDPROC

ENDDEFINE

DEFINE CLASS cmdSalir AS boton
	CAPTION = "Salir"
	TOP     = 250
	LEFT    = 250

	PROCEDURE CLICK
		CLEAR EVENTS ALL
	ENDPROC

ENDDEFINE

DEFINE CLASS boton AS COMMANDBUTTON
	HEIGHT = 25
	VISIBLE = .T.

ENDDEFINE


