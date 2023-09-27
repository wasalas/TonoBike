CLOSE DATABASES ALL
PUBLIC oForm

oForm = CREATEOBJECT("FrmGrid")
oForm.ADDOBJECT("Grid1","Grid")

WITH oForm.Grid1
	.COLUMNCOUNT = 4
	.HEIGHT = 450
	.WIDTH = 650
	.LEFT = 24
	.TOP = 24
	.Column1.WIDTH= 17
	.Column1.Header1.CAPTION= ""
	.Column1.ADDOBJECT("Check1","CheckBox")
	.Column1.Check1.VISIBLE = .T.
	.Column1.CURRENTCONTROL= "Check1"
	.Column1.SPARSE= .F.

	.Column2.WIDTH= 50
	.Column2.Header1.CAPTION= "Código"

	.Column3.WIDTH= 350
	.Column3.Header1.CAPTION= "Nombre"

	.Column4.WIDTH= 100
	.Column4.Header1.CAPTION= "RUC"


	.SETALL("DynamicBackColor","IIF(Ok, RGB(0,220,210), RGB(255,255,255))", "COLUMN")
	.VISIBLE = .T.
ENDWITH

oForm.VISIBLE = .T.

DEFINE CLASS FrmGrid AS FORM
	TOP = 0
	LEFT = 0
	HEIGHT = 500
	WIDTH = 700
	DOCREATE = .T.
	CAPTION = "Grid multiselección"
	WINDOWTYPE = 1
	WINDOWSTATE = 0
	NAME = "FrmGrid"

	PROCEDURE LOAD
		USE datos\clientes
		SELECT .F. AS OK, idcli, nomcli, ruc ;
			FROM clientes INTO CURSOR cur_clientes READWRITE
	ENDPROC

	PROCEDURE UNLOAD
		USE IN cur_clientes
	ENDPROC
ENDDEFINE
