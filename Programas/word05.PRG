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


	ls_documento = "c:\Inmune\Documentos\Plantillas\cotizacion.docx"

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

	lcFileAs = "c:\Inmune\Documentos\Cotizaciones\" + ls_ano + "-" + ls_cor + ls_empresa + ".DOC"


	COPY FILE &ls_documento TO &lcFileAs 

	cData = FILETOSTR( lcFileAs  )
	cData = STRTRAN( cData, "<<ls_numcot>>",   PADR( ls_numcot, 13  ))

	STRTOFILE( cData, lcFileAs  )


ENDPROC



*!*	cPicture     = "@ 999,999,999.99"
*!*	nLen_fechoy  = 35
*!*	nLen_fecpro  = 17
*!*	nLen_importe = 130

*!*	K_FEC_HOY   = PADR( "<<FECHA_HOY>>",              nLen_fechoy  )
*!*	K_FEC_PRO   = PADR( "<<FECHA_PROCESO>>",          nLen_fecpro  )
*!*	K_IMPORTE   = PADR( "<<IMPORTES_SOL_DOL_TEXTO>>", nLen_importe )

*!*	K_FILE_ORI  = "COTDOC\CARTA_01.DOC"
*!*	K_FILE_DES  = "CARTA_01.DOC"

*!*	COPY FILE &K_FILE_ORI TO &K_FILE_DES

*!*	dd   = PADL( ALLTRIM( STR( DAY( DATE() ))), 2, "0" )
*!*	mmmm = CMONTH( DATE() )
*!*	yyyy = TRANSFORM( YEAR( DATE() ), "@ 9,999" )

*!*	cFechaHoy = "Lima, " + dd + " de " + mmmm + " del " + yyyy
*!*	cFechaPro = DTOC( _fecpla1 )
*!*	cPagoSol  = "S/. " + ALLTRIM( TRANSFORM( _totpagsol, cPicture ))
*!*	cPagoDol  = "US$ " + ALLTRIM( TRANSFORM( _totpagdol, cPicture ))
*!*	cCantDocs = ALLTRIM( TRANSFORM( nContador, "@ 99,999" ))
*!*	cTexto    = ", correspondiente a las cobranzas de " + cCantDocs + " documentos."
*!*	cImporte  = cFechaPro + ", " + " por un importe de " + cPagoDol + " y " + cPagoSol + cTexto

*!*	cData = FILETOSTR( K_FILE_DES )
*!*	cData = STRTRAN( cData, K_FEC_HOY,   PADR( cFechaHoy, nLen_fechoy  ))
*!*	cData = STRTRAN( cData, K_FEC_PRO,   PADR( cFechaPro, nLen_fecpro  ))
*!*	cData = STRTRAN( cData, K_IMPORTE,   PADR( cImporte,  nLen_importe ))
*!*	STRTOFILE( cData, K_FILE_DES )

*!*	CREATE CURSOR &cursor1 ( documento G )

*!*	SELECT(cursor1)

*!*	APPEND BLANK
*!*	APPEND GENERAL documento FROM &K_FILE_DES
*!*	GO TOP
