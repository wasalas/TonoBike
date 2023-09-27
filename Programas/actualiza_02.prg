**************************************************************************
* fecha : 16/09/2022
* descripcion:
*	1.- Agregar indiced => TAG4 = IDCOT
*	2.- Al borrar una cotizacion COTIZACION.SCX
*       Muestra mensaje de alerta por dejar una Factura sinb Nº Cotizacion asociada
* autor : WS
**************************************************************************


DO actualiza

MESSAGEBOX("Proceso terminado",64, "Aviso")

*****************************************************************************

PROCEDURE actualiza
	SET EXCLUSIVE ON
	CLOSE DATABASES ALL

	USE faccab
	INDEX on idcot TAG tag4
ENDPROC

*****************************************************************************

