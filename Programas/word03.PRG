CLOSE DATABASES ALL

* crear la tabla de datos
CREATE TABLE micursor( ;
	DESCRI	c(20),;
	c1		N(9,2),;
	c2		N(9,2),;
	c3		N(9,2),;
	c4		N(9,2),;
	c5		N(9,2),;
	c6		N(9,2),;
	c7		N(9,2))

INSERT INTO micursor(DESCRI, c1,c2,c3,c4,c5,c6,c7)VALUES( "Peru",      a(80,100), a(8,20), a(90,200), a(164,200),a(23,76), a(51,98), a(1,100))
INSERT INTO micursor(DESCRI, c1,c2,c3,c4,c5,c6,c7)VALUES( "Chile",     a(1,40), a(8,20), a(90,200), a(164,200),a(23,76), a(51,98), a(1,100))
INSERT INTO micursor(DESCRI, c1,c2,c3,c4,c5,c6,c7)VALUES( "Argentina", a(10,40), a(8,20), a(9,20), a(164,200),a(23,76), a(51,98), a(1,100))
INSERT INTO micursor(DESCRI, c1,c2,c3,c4,c5,c6,c7)VALUES( "Colombia",  a(1,40), a(8,20), a(90,200), a(164,200),a(23,76), a(51,98), a(1,100))
INSERT INTO micursor(DESCRI, c1,c2,c3,c4,c5,c6,c7)VALUES( "Brasil",    a(52,60), a(8,20), a(90,200), a(164,200),a(23,76), a(51,98), a(1,100))
INSERT INTO micursor(DESCRI, c1,c2,c3,c4,c5,c6,c7)VALUES( "Paraguay",  a(1,40), a(8,20), a(90,200), a(164,200),a(23,76), a(51,98), a(1,100))
INSERT INTO micursor(DESCRI, c1,c2,c3,c4,c5,c6,c7)VALUES( "Bolivia",   a(15,29), a(30,99), a(259,650), a(410,468),a(234,786), a(510,978), a(71,100))

* Creo el Objeto Word Aplication
oWord = CREATEOBJECT('Word.Application')
oWord.VISIBLE = .F.
oDoc = oWord.Documents.ADD()
oSelection = oWord.SELECTION
WITH oSelection
	* Header
	.FONT.SIZE = 10
	.FONT.NAME = "Arial"
	.TypeText("Texto que quiero mostrar")
ENDWITH
* Cuento las filas del cursor
SELECT micursor
nRows=RECCOUNT('MiCursor')+1
nCols=8

*!* Inserta una Tabla
oRange=oSelection.RANGE
oWord.ActiveDocument.TABLES.ADD(oRange, nRows, nCols, 1, 0)
oTable = oSelection.TABLES(1)
WITH oTable
	* Ancho de Fila
	.ROWS.HEIGHT = 6
	* Anchos de columna 1
	.COLUMNS(1).SetWidth(120,0)
	* Ancho de columnas 2 al 8
	FOR N=2 TO 8
		.COLUMNS(N).SetWidth(60,0)
	ENDFOR
	.ROWS.WrapAroundText = .T.
	* AutoFormato de la tabla
	.Autoformat(1,.T.,.T.,.T.,.T.,.T.,.T.,.T.,.T.,.T.)
	* Pongo en Negrita la primera fila del encabezado
	.ROWS(1).RANGE.FONT.Bold=.T.
	* Algo de sombra
	.ROWS(1).Shading.Texture = 200
	*	Formo el titulo de la tabla
	.Cell(1,1).RANGE.InsertAfter("Concepto")
	.Cell(1,2).RANGE.InsertAfter("Años Ant.")
	.Cell(1,3).RANGE.InsertAfter("2002")
	.Cell(1,4).RANGE.InsertAfter("2003")
	.Cell(1,5).RANGE.InsertAfter("2004")
	.Cell(1,6).RANGE.InsertAfter("2005")
	.Cell(1,7).RANGE.InsertAfter("2006")
	.Cell(1,8).RANGE.InsertAfter("Total")
	* Alineacion del titulo
	.Cell(1,2).RANGE.ParagraphFormat.ALIGNMENT = 2
	.Cell(1,3).RANGE.ParagraphFormat.ALIGNMENT = 2
	.Cell(1,4).RANGE.ParagraphFormat.ALIGNMENT = 2
	.Cell(1,5).RANGE.ParagraphFormat.ALIGNMENT = 2
	.Cell(1,6).RANGE.ParagraphFormat.ALIGNMENT = 2
	.Cell(1,7).RANGE.ParagraphFormat.ALIGNMENT = 2
	.Cell(1,8).RANGE.ParagraphFormat.ALIGNMENT = 2
	* Relleno las otras filas con datos del cursor
	SELECT micursor
	N=2
	SCAN
		cMaskPicture=IIF(N=nRows,'9999,999.99','@z 9999,999.99' )
		.Cell(N,1).RANGE.ParagraphFormat.ALIGNMENT = 0
		.Cell(N,1).RANGE.InsertAfter(PROPER(ALLTRIM(micursor.DESCRI)))
		.Cell(N,2).RANGE.ParagraphFormat.ALIGNMENT = 2
		.Cell(N,2).RANGE.InsertAfter(ALLTRIM(TRANSFORM(micursor.c1,cMaskPicture)))
		.Cell(N,3).RANGE.ParagraphFormat.ALIGNMENT = 2
		.Cell(N,3).RANGE.InsertAfter(ALLTRIM(TRANSFORM(micursor.c2,cMaskPicture)))
		.Cell(N,4).RANGE.ParagraphFormat.ALIGNMENT = 2
		.Cell(N,4).RANGE.InsertAfter(ALLTRIM(TRANSFORM(micursor.c3,cMaskPicture)))
		.Cell(N,5).RANGE.ParagraphFormat.ALIGNMENT = 2
		.Cell(N,5).RANGE.InsertAfter(ALLTRIM(TRANSFORM(micursor.c4,cMaskPicture)))
		.Cell(N,6).RANGE.ParagraphFormat.ALIGNMENT = 2
		.Cell(N,6).RANGE.InsertAfter(ALLTRIM(TRANSFORM(micursor.c5,cMaskPicture)))
		.Cell(N,7).RANGE.ParagraphFormat.ALIGNMENT = 2
		.Cell(N,7).RANGE.InsertAfter(ALLTRIM(TRANSFORM(micursor.c6,cMaskPicture)))
		.Cell(N,8).RANGE.ParagraphFormat.ALIGNMENT = 2
		.Cell(N,8).RANGE.InsertAfter(ALLTRIM(TRANSFORM(micursor.c7,'9999,999.99')))
		N=N+1
	ENDSCAN
ENDWITH
oSelection.MoveDown( 5, nRows+2)
WITH oSelection
	.TypeParagraph
	.TypeParagraph
	.FONT.SIZE=8
	.TypeText("* Inserto Texto a Mostrar" )
ENDWITH
*
oWord.VISIBLE = .T. && Ver el resultado
MESSAGEBOX("Vea el Resultado en Word.")
oWord = NULL
CLOSE DATABASES ALL
DELETE FILE micursor.*

FUNCTION a
	LPARAMETERS tn_ini, tn_fin

	IF tn_fin = 0 OR tn_ini > tn_fin
		ln_nro = 0
	ELSE
		ln_nro = INT((tn_fin - tn_ini + 1)  * RAND() + tn_ini)
	ENDIF

	RETURN ln_nro
ENDFUNC
