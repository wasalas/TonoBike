CLEAR
CLOSE DATABASES ALL

USE datos\cotcab IN 0
USE datos\cotdet IN 0
USE datos\clientes IN 0
USE datos\productos IN 0

SELECT cotcab
GO TOP

DO crea_word WITH cotcab.idcab

PROCEDURE crea_word
	LPARAMETERS tcIdCab

SET STEP ON
	
	cMsgNoSave = "No se puedo grabar el documento de trabajo." + CHR(13) + ;
		"Posiblemente este abierto un documento con el mismo nombre." + CHR(13) + CHR(13) + ;
		"Cierre todos los documentos de Word y vuelva a intentar el proceso."

	ls_documento = "E:\Programacion\Sistemas\vfp90\Inmune\Documentos\cotizacion.docx"

	IF SEEK(tcIdCab,"cotcab","tag1")

		ls_ano    = SUBSTR(tcIdCab,1,2)
		ls_cor    = ALLTRIM(STR(INT(VAL(SUBSTR(tcIdCab,3,5))),5))
		ls_numcot = ls_cor + "-" + ls_ano
		ls_fec    = DTOS(DATE())

		ls_subtot = "S/. " + ALLTRIM(TRANSFORM(cotcab.imptot,"999,999.99"))
		ls_impinm = "S/. " + ALLTRIM(TRANSFORM(cotcab.impinm,"999,999.99"))
		ls_impdet = "S/. " + ALLTRIM(TRANSFORM(cotcab.impdet,"999,999.99"))

		IF SEEK(cotcab.idcli,"clientes","tag1")
			ls_empresa = ALLTRIM(clientes.nomcli)
			ls_ruc = clientes.ruc
			ls_dir = clientes.DIR
			ls_tel = clientes.telf1
			ls_att = ""
		ENDIF
	ENDIF

	lcFileAs = ls_ano + "-" + ls_cor + ls_empresa + ".DOC"

	ON ERROR loWord = NULL
	loWord	= CREATEOBJECT( "Word.Application" )
	ON ERROR

	IF VARTYPE(loWord) <> 'O'
		MESSAGEBOX(cMsgNoSave,4+32,"Alerta")
		RETURN
	ENDIF

	loWord.Documents.OPEN( ls_documento,,.T.)

	lfBuscaReplaCadena(loWord.SELECTION, "<<ls_numcot>>", ls_numcot )
	lfBuscaReplaCadena(loWord.SELECTION, "<<ls_empresa>>", ls_empresa )

	lfBuscaReplaCadena(loWord.SELECTION, "<<ls_ruc>>", ls_ruc )
	lfBuscaReplaCadena(loWord.SELECTION, "<<ls_dir>>", ls_dir )
	lfBuscaReplaCadena(loWord.SELECTION, "<<ls_tel>>", ls_tel )
	lfBuscaReplaCadena(loWord.SELECTION, "<<ls_att>>", ls_att )
	lfBuscaReplaCadena(loWord.SELECTION, "<<ls_fec>>", ls_fec )	
	
	
	lfBuscaReplaCadena(loWord.SELECTION, "<<ls_subtot>>", ls_subtot )
	lfBuscaReplaCadena(loWord.SELECTION, "<<ls_impinm>>", ls_impinm )
	lfBuscaReplaCadena(loWord.SELECTION, "<<ls_impdet>>", ls_impdet )

	SELECT * FROM cotdet WHERE idcab == tcIdCab INTO CURSOR cur_detalle

	IF _TALLY = 0
		MESSAGEBOX( "No existe detalle", 64 , "Aviso" )
		loWord.QUIT
		RETURN
	ENDIF

	IF _TALLY = 1
		* sin anexo
		SELECT cur_detalle
		GO TOP
		ls_producto = IIF(SEEK(cur_detalle.idproducto,"productos","tag1"),productos.DESCRIP,"")
		ls_peso     = ALLTRIM(TRANSFORM(cur_detalle.peso,           "999,999.99")) + " Kg."
		ls_cantidad = ALLTRIM(TRANSFORM(cur_detalle.cantidad,       "999,999"   )) + " C.D.I."
		ls_dosis    = ALLTRIM(TRANSFORM(cur_detalle.dosis,              "999"   )) + " KGy"
		ls_precio   = "S/. " + ALLTRIM(TRANSFORM(cur_detalle.precio,"999,999.99")) + " + IGV"
		
		lfBuscaReplaCadena(loWord.SELECTION, "<<ls_producto>>", ls_producto )
		lfBuscaReplaCadena(loWord.SELECTION, "<<ls_peso>>", ls_peso )
		lfBuscaReplaCadena(loWord.SELECTION, "<<ls_cantidad>>", ls_cantidad )
		lfBuscaReplaCadena(loWord.SELECTION, "<<ls_dosis>>", ls_dosis )
		lfBuscaReplaCadena(loWord.SELECTION, "<<ls_precio>>", ls_precio )

	ELSE
		* con anexo
		DO WHILE NOT EOF()
			ls_producto = IIF(SEEK(cur_detalle.idproducto,"productos","tag1"),productos.DESCRIP,"")
			ln_peso = cur_detalle.peso
			ln_cantidad = cur_detalle.cantidad
			ln_dosis = cur_detalle.dosis
			ln_precio = cur_detalle.precio
			SKIP
		ENDDO
	ENDIF

	lError = .F.
	ON ERROR lError = .T.
	loWord.ActiveDocument.SAVEAS( lcFileAs )
	ON ERROR

	IF lError
		MESSAGEBOX( cMsgNoSave, 64 , "Aviso" )
		loWord.QUIT
		RETURN
	ENDIF

	loWord.ActiveDocument.SAVE
	loWord.VISIBLE	= .T.

ENDPROC


PROCEDURE lfBuscaReplaCadena
	LPARAMETERS poSelection, pcValueToFind, pcValueToReplace

	*--------------------------------------------------------
	*- Busca una cadena y la reemplaza por otra
	*-
	*- Parametros:
	*-       poSelection         Referencia a la selección a buscar.
	*-                           Ejm. oWord.Selection
	*-       pcValueToFind       Valor a buscar
	*-       pcValueToReplace    Valor a reemplazar
	*-
	*- Devuelve:
	*-             .t.           Si ha podido reemplazar todo
	*-             .f.           Si NO ha podido reemplazar
	*-
	*--------------------------------------------------------

	LOCAL llReturn
	llReturn = .T.

	TRY
		WITH poSelection.FIND
			.ClearFormatting
			.Replacement.ClearFormatting
			.TEXT = pcValueToFind
			.Replacement.TEXT = pcValueToReplace
			.Forward = .T.
			.WRAP = 1
			.Execute(,,,,,,,,,,2,,,,,,,,,)
		ENDWITH
	CATCH TO nError
		llReturn = .F.
		THIS.cDescUltError = 'Ha ocurrido un error en el proceso de reemplazo de texto'
	ENDTRY

ENDPROC
