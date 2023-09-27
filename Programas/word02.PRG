*El programa en Fox y la rutina que realiza el cambio de la cadena por el contenido es el siguiente:

ls_documento = "documentos\cotizacion.docx"


CLOSE DATABASES ALL
LOCAL loWord, loDocument



*- Crea referencia a Word
TRY
	loWord = GETOBJECT(,'Word.Application')
CATCH
	loWord = CREATEOBJECT('Word.Application')
ENDTRY

IF VARTYPE(loWord) <> 'O'
	ERROR 'No se ha podido crear una referencia a WORD'
	RETURN .F.
ENDIF


*---------------------------------
* Abre el documento como ReadOnly
*---------------------------------

SET STEP ON

*USE d:\ut\mail50 IN 0 ALIAS mail50

TRY
	loWord.Documents.OPEN( ls_documento,,.T.)
CATCH


	*- Cierra instancia de Word

	IF VARTYPE(loWord) = 'O'

		loWord.APPLICATION.QUIT(0) && Sale sin salvar y sin preguntar

		loWord = .NULL.

	ENDIF

	ERROR 'No se ha podido abrir el documento "' + _DOCUMENTO + '".'

ENDTRY



x=1
x=1
x=1

lfBuscaReplaCadena(loWord.SELECTION, "<<nombre>>",mail50.nombre )

lfBuscaReplaCadena(loWord.SELECTION, "<<direcc1>>",mail50.direcc1 )

lfBuscaReplaCadena(loWord.SELECTION, "<<direcc2>>",mail50.direcc2 )

lfBuscaReplaCadena(loWord.SELECTION, "<<poblacion>>",mail50.poblacion )

loWord.VISIBLE = .T.

loWord.printout()

WAIT "Imprimiendo..." WINDOW AT 15,40 TIMEOUT 5

loWord.Documents().CLOSE(.F.)




loWord.QUIT(.F.)



RETURN





procedure lfBuscaReplaCadena
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
			.WRAP= 1
			.Execute(,,,,,,,,,,2)
		ENDWITH
	CATCH TO nError
		llReturn = .F.
		THIS.cDescUltError = 'Ha ocurrido un error en el proceso de reemplazo de texto'
	ENDTRY

ENDPROC
